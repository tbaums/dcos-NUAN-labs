#! /bin/bash

export LANG=en_US.utf-8
export LANGUAGE=en_US.utf-8 LC_ALL=en_US.utf-8

dcos cluster remove --all
dcos cluster setup https://$(echo $1 | sed -r "s|https?://||") --username=admin --password=$2 --no-check --insecure
dcos config set core.ssl_verify false
dcos package install dcos-enterprise-cli --yes


# Installs MKE
dcos package install kubernetes --yes

## Set up EdgeLB

dcos package repo add --index=0 edgelb https://downloads.mesosphere.com/edgelb/v1.3.0/assets/stub-universe-edgelb.json
dcos package repo add --index=0 edgelb-pool https://downloads.mesosphere.com/edgelb-pool/v1.3.0/assets/stub-universe-edgelb-pool.json

if [ ! -f public-key.pem ]; then
    dcos security org service-accounts keypair private-key.pem public-key.pem
fi

dcos security org service-accounts create -p public-key.pem -d "Edge-LB service account" edge-lb-principal
dcos security secrets create-sa-secret private-key.pem edge-lb-principal dcos-edgelb/edge-lb-secret
dcos security org groups add_user superusers edge-lb-principal

dcos package install --options=edgelb.options.json edgelb --yes

until dcos edgelb ping; do sleep 1; done

dcos edgelb create edgelb.cfg.json
