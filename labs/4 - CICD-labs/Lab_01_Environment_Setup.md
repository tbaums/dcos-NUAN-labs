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

Within your DC/OS UI, select *Catalog* in the left navigation pane.

![jenkins-select-catalog](https://github.com/tbaums/dcos-k8s-days-labs/blob/master/labs/CICD-labs/screenshots/jenkins-select-catalog.png)

Select Jenkins from the list of certified packages.

![jenkins-select](https://github.com/tbaums/dcos-k8s-days-labs/blob/master/labs/CICD-labs/screenshots/jenkins-select.png)

Select *Review & Run*.

![jenkins-review-and-run](https://github.com/tbaums/dcos-k8s-days-labs/blob/master/labs/CICD-labs/screenshots/jenkins-review-and-run.png)

You do not need to change the default configuration settings. Click *Review & Run* again.

![jenkins-review-and-run2](https://github.com/tbaums/dcos-k8s-days-labs/blob/master/labs/CICD-labs/screenshots/jenkins-review-and-run2.png)

Lastly, click *Run Service* to initiate your Jenkins deployment.

![jenkins-run-service](https://github.com/tbaums/dcos-k8s-days-labs/blob/master/labs/CICD-labs/screenshots/jenkins-run-service.png)

You can monitor the Jenkins launch process in your DC/OS Services tab.

## Step 2 - Clone the `cd-demo` repository

Our Jenkins instance will need a GitHub repository to monitor for changes. 

Please sign in to GitHub.com and navigate to https://github.com/mesosphere/cd-demo. 

Once on the `cd-demo` repository homepage, select *Fork* in the upper righthand corner of the page.

![github-fork](https://github.com/tbaums/dcos-k8s-days-labs/blob/master/labs/CICD-labs/screenshots/github-fork.png)

You should now see the forked repository in your GitHub account.

[Next Lab >>](https://github.com/tbaums/dcos-mandt-labs/blob/master/labs/4%20-%20CICD-labs/Lab_02_Configure_GitHub_Repository.md)

