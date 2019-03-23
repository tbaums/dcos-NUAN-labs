# Deploing Couchbase on DC/OS

In this exercise we will experience the simplicity of deploying a fully operational Couchbase cluster with a single command.  We will then proceed to validate that the cluster is operational by running some [N1QL](https://www.couchbase.com/products/n1ql).

## Deploy Couchbase Service from CLI

From your DC/OS CLI, install the DC/OS Couchbase package from the Catalog.  Firstl download [couchbase.json](couchbase.json)

```
dcos package install couchbase --options=couchbase.json --yes
```

Monitor the deployment of Couchbase.

```
watch dcos couchbase plan status deploy
```

You should see something like the output below when complete.

```
deploy (serial strategy) (COMPLETE)
├─ setup-data-nodes (serial strategy) (COMPLETE)
│  ├─ data-0:[node] (COMPLETE)
│  ├─ data-0:[initialize-cluster] (COMPLETE)
│  └─ data-1:[node] (COMPLETE)
├─ setup-index-nodes (serial strategy) (COMPLETE)
│  └─ index-0:[node] (COMPLETE)
├─ setup-query-nodes (serial strategy) (COMPLETE)
│  └─ query-0:[node] (COMPLETE)
├─ setup-fts-nodes (serial strategy) (COMPLETE)
├─ setup-eventing-nodes (serial strategy) (COMPLETE)
├─ setup-analytics-nodes (serial strategy) (COMPLETE)
├─ rebalance-nodes (serial strategy) (COMPLETE)
│  └─ admin-0:[rebalance] (COMPLETE)
├─ backupmgr-nodes (serial strategy) (COMPLETE)
└─ setup-sync-gateway-nodes (serial strategy) (COMPLETE)
```        

Hit `<Ctrl-C>` to exit the watch command and return back to your prompt.

## Interacting with Couchbase from a terminal

First we will ssh to one of the data nodes.

```
dcos task exec -ti data-0-node bash
```

You should see something like:

```
root@ip-172-12-18-198:/mnt/mesos/sandbox#
```        

Create a bucket in Couchbase.

```
couchbase-cli bucket-create --cluster localhost:8091 --user Administrator --password password --bucket students --bucket-type couchbase --bucket-ramsize 1024
```

Now we will start the Command Line Shell for N1QL.
```
cbq -e http://localhost:8091 -u Administrator -p password
```

You should get something like:

```
 Connected to : http://localhost:8091/. Type Ctrl-D or \QUIT to exit.

Unable to determine home directory, history file disabled.
cbq>
```

Create a index for the bucket previously created.

```SQL
CREATE PRIMARY INDEX ON students;
```

Insert a record into table.

```SQL
INSERT INTO `students` ( KEY, VALUE ) VALUES ("k001", { "name": "John Doe", "dept": "DevOps"});
```

Verify that the record exists.
```SQL
SELECT * FROM students;
```

You should see the result below.
```JSON
{
    "requestID": "760a3e8b-6348-45ed-9ec4-01fdaa93586c",
    "signature": {
        "*": "*"
    },
    "results": [
        {
            "students": {
                "dept": "DevOps",
                "name": "John Doe"
            }
        }
    ],
    "status": "success",
    "metrics": {
        "elapsedTime": "3.406006ms",
        "executionTime": "3.253747ms",
        "resultCount": 1,
        "resultSize": 120
    }
}
```

Hit `<Ctrl-D>` to exit cbq and return back to your prompt.

[Back to Labs List >>](..)