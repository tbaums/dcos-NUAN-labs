# Stream Processing Fraud Detection with Kafka and Flink

## Lab 3 - Install Microservices on Kubernetes

### Step 1 - Deploy the transactions generator to Kubernetes

Now, we can deploy the [data generator](https://github.com/dcos/demos/blob/master/flink/1.11/generator/generator.go) using the [flink-demo-generator.yaml](https://github.com/dcos/demos/blob/master/flink-k8s/1.11/generator/flink-demo-generator.yaml) deployment definition:

```bash
kubectl apply -f https://raw.githubusercontent.com/dcos/demos/master/flink-k8s/1.11/generator/flink-demo-generator.yaml
```

We can check the status of the deployment:

```bash
kubectl get deployments
kubectl get pods
```

We can also view the log output to make sure it is generating events as expected (you will need to use the actual pod id from the previous command):

```bash
kubectl logs flink-demo-generator-<your pod ID from "kubectl get pods" command above>
```
[Next Lab >>](https://github.com/tbaums/dcos-NUAN-labs/blob/master/labs/2%20-%20Data-Services-labs/Lab_04_Deploy_Flink_Job.md)