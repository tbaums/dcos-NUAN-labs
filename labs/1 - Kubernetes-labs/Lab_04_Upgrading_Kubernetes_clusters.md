## Lab 4 - Upgrading Your Kuberenetes Cluster

Kubernetes is evolving rapidly, with monthly releases of minor versions. More importantly, we want to be able to stay ahead of CVEs. An automated, reliable upgrade and patching process is therefore required. DC/OS orchestrates the entire rolling upgrade of your Kubernetes cluster, including marking Kubelets unschedulable, draining the Kubelet, and safely bringing the Kubelet back into the cluster. 

## View available upgrade/downgrade options
To see available upgrade/downgrade options for Kubernetes, run:
```
dcos kubernetes manager update package-versions
```

## Upgrade Kubernetes cluster
Run the following command to upgrade your Kubernetes cluster:
```
dcos kubernetes cluster update --cluster-name=kubernetes-cluster1 --package-version=2.3.2-1.14.1
```
You will be prompted to confirm the upgrade.

```
dcos kubernetes cluster update --cluster-name=kubernetes-cluster1 --package-version=2.3.2-1.14.1            


Using Kubernetes cluster: kubernetes-cluster1
About to start an update from version 2.2.0-1.13.3 to 2.3.2-1.14.1
Updating these components means the Kubernetes cluster may experience some
downtime or, in the worst-case scenario, cease to function properly.
Before updating proceed cautiously and always backup your data.
This operation is long-running and has to run to completion.
Continue cluster update? [yes/no]:
```

You can observe the rollout of the upgrade in real-time from the DC/OS UI. 

From the UI, go to Services > kubernetes-cluster1. From there, click on the *Plans* tab.

![](https://github.com/tbaums/dcos-NUAN-labs/blob/master/screenshots/Lab04-cluster-upgrade-plans.png)


[Back to Labs List >>](https://github.com/tbaums/dcos-NUAN-labs/tree/master/labs)