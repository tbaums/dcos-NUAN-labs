# Lab 1 - Environment Setup

In this series of labs, you will learn how to deploy a full CICD pipeline on DC/OS using Jenkins. 

By the end of this lab series, you will have configured Jenkins to: 

1. monitor a GitHub repository for new commits, 
1. pull the code from GitHub when Jenkins discovers new commits, 
1. build the new code into a Docker container, 
1. push the new container to DockerHub, and
1. deploy the new application!

## Prerequisites

In order to complete these lab exercises, please ensure you have the following:

1. GitHub account and access to your credentials 
1. DockerHub account and access to your credentials
1. DC/OS cluster

## Step 1 - Install Jenkins on DC/OS

We can install Jenkins with a single command on DC/OS:

```
dcos package install --yes jenkins --package-version=3.5.2-2.107.2
```

You can monitor the Jenkins launch process in your DC/OS Services tab.

## Step 2 - Clone the `cd-demo` repository

Our Jenkins instance will need a GitHub repository to monitor for changes. 

Please sign in to GitHub.com and navigate to https://github.com/mesosphere/cd-demo. 

Once on the `cd-demo` repository homepage, select *Fork* in the upper righthand corner of the page.

![github-fork](https://github.com/tbaums/dcos-k8s-days-labs/blob/master/labs/CICD-labs/screenshots/github-fork.png)

You should now see the forked repository in your GitHub account.

[Next Lab >>](https://github.com/tbaums/dcos-NUAN-labs/blob/master/labs/4%20-%20CICD-labs/Lab_02_Configure_GitHub_Repository.md)

