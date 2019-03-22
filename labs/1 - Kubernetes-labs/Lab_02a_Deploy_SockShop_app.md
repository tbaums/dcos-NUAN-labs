## Lab 2a - Deploy SockShop App

In this lab, you will deploy a Kubernetes YAML file with all the requisite information to have a fully functioning e-commerce site on your Kubernetes cluster, orchestrated by DC/OS.   

### Step 1. Download Kubernetes YAML file

From your terminal, please run the following command to pull down the YAML file we will use to deploy Sock Shop to your Kubernetes cluster:

```
curl -O https://raw.githubusercontent.com/microservices-demo/microservices-demo/master/deploy/kubernetes/complete-demo.yaml
```



### Step 2. Create Namespace for Sock Shop

Kubernetes provides isolation via the ["Namespaces" type](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/), which function as virtual Kubernetes clusters, backed by the same physical Kubernetes cluster. The YAML we downloaded in Step 1 expects a namespace called `sock-shop`. Let's create that namespace by running the command below:

```
kubectl create namespace sock-shop
```

### Step 3. Deploy Sock Shop app

Now we're ready to deploy our example application using the `kubectl apply` command. Because the YAML file we are using encomasses all the microservices and data services we need to run this complete e-commerce site, we will be up and running with the single command below:

```
kubectl apply -f complete-demo.yaml
```

Your output should resemble the below:

```
$ kubectl apply -f complete-demo.yaml

deployment.extensions/carts-db created
service/carts-db created
deployment.extensions/carts created
service/carts created
deployment.extensions/catalogue-db created
service/catalogue-db created
deployment.extensions/catalogue created
service/catalogue created
deployment.extensions/front-end created
service/front-end created
deployment.extensions/orders-db created
service/orders-db created
deployment.extensions/orders created
service/orders created
deployment.extensions/payment created
service/payment created
deployment.extensions/queue-master created
service/queue-master created
deployment.extensions/rabbitmq created
service/rabbitmq created
deployment.extensions/shipping created
service/shipping created
deployment.extensions/user-db created
service/user-db created
deployment.extensions/user created
service/user created
```
### Step 4. Visit your new e-commerce site - Sock Shop!

Point your browser to the URL below to check out your new Sock Shop site.

```
<your public agent public IP>:30001
```




[Next Lab >>](https://github.com/tbaums/dcos-NUAN-labs/blob/master/labs/1%20-%20Kubernetes-labs/Lab_02b_Laurch_a_second_Kubernetes_cluster.md)