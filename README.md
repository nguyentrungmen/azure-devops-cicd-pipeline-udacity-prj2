[![Python application test with Github Actions](https://github.com/nguyentrungmen/azure-devops-cicd-pipeline-udacity-prj2/actions/workflows/pythonapp.yml/badge.svg)](https://github.com/nguyentrungmen/azure-devops-cicd-pipeline-udacity-prj2/actions/workflows/pythonapp.yml)
# Overview

In this project, you will build a Github repository from scratch and create a scaffold that helps you do both Continuous Integration and Continuous Delivery. You'll use Github Actions along with Makefile, requirements.txt, and application code to perform the initial code debugging, testing, and installation cycle. Next, you will integrate this project with Azure Pipelines to enable Continuous Delivery to Azure App Service.

## Project Plan
It is very important to have a project plan and task tracking so in this project we will use Excel spreadsheet and Trello:

* [Trello Board](https://trello.com/b/KxRoH2T2/mennt1-udacity-project2)
    
* [Project Plan](https://github.com/nguyentrungmen/azure-devops-cicd-pipeline-udacity-prj2/blob/69b44418b6a2608189dbdbacccff4d4c5437d185/Project%20Management_mennt1_udacity.xlsx)

## Instructions
CICD Diagram Github And Azure Pipeline

![CI diagram](./screenshots/ci-diagram.png)
![CD diagram](./screenshots/cd-diagram.png)

### 2.1.	Configuring GitHub
- Log into Azure Cloud Shell
- Create a ssh key

```bash
ssh-keygen -t rsa -b 4096 -C "github_account@abc.com"
```
![alt text](./screenshots/id_rsa_pub.png)

Copy the public key to your GitHub Account -> Settings -> SSH and GPG keys (https://github.com/settings/keys)

![alt text](./screenshots/id_rsa_pub.png)

### 2.2.	Clone code from Github
Once SSH Key configured in Github then clone project into Azure Cloud Shell 
```bash
git clone https://github.com/nguyentrungmen/azure-devops-cicd-pipeline-udacity-prj2.git
```
![alt text](./screenshots/clone_project.png)

### 2.3.	Create a Python Virtual Environment to run your application

```bash
make setup
```
![alt text](./screenshots/make_setup.png)


And then activate the virtual environment
```bash
source ~/.azure-devops-cicd-pipeline-udacity-prj2/bin/activate
```
![alt text](./screenshots/active_virtual_env.png)

Run following command to install project dependencies
```bash
make all
```

![alt text](./screenshots/make_all.png)

Run Application and make a test using below command

Run application
```bash
export FLASK_APP=app.py
	flask run
```
![alt text](./screenshots/flask_run_local.png)

Make a prediction test
```bash
sh make_prediction.sh
```
![alt text](./screenshots/make_test_local.png)

### 2.4.	Deploy the application to Azure App Service
Now time to deploy the application to Azure App Service using below command which already written up to `commands.sh`
```bash
az webapp up -n mennt1-udacity-project2-app -g Azuredevops --sku FREE
```

![alt text](./screenshots/deploy_to_azure_appservice.png)


![alt text](./screenshots/predict_azure_app_home.png)


Make a prediction test for deployed app running on Azure App Services
```bash
sh make_predict_azure_app.sh
```

![alt text](./screenshots/make_test_azure.png)

Output of streamed log files from deployed application in Azure App Service 
```bash
az webapp log tail --name mennt1-udacity-project2-app --resource-group Azuredevops
```

![alt text](./screenshots/app_service_tail_log.png)

### 2.5.	Setup GitHub Action
Set up the CI pipeline with GitHub Actions and below is the result when push a change to the repository:
![Github action](./screenshots/github_action.png)

### 2.6.	Setup Azure Pipelines
Setup Azure Pipelines to continue deploy application to Azure App Services follow these instructions from Azure [Azure pipeline python app instructions](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops) and [Azure pipeline self hosted agent](https://learn.microsoft.com/en-us/azure/devops/pipelines/agents/linux-agent?view=azure-devops)

![AzurePipeline](./screenshots/azure_pipeline.png)


### 2.2.	Load testing using Locust

- Install locust
```bash
pip install locust
```

Go to folder contain `locustfile.py` before run:
```bash
locust
```
Open Locust app http://localhost:8089/ then config test with your deployed host `https://mennt1-udacity-project2-app.azurewebsites.net/`

![alt text](./screenshots/locust_start.png)

![alt text](./screenshots/locust_config_input.png)

The output test
![alt text](./screenshots/locust_load_result_1.png)
![alt text](./screenshots/locust_load_result_2.png)


## Enhancements

The project can be configured to work with GitFlow, so if you commit to a specific branch, the code can continue to be deployed in the corresponding environment (DEV, QA, Staging or PROD).

## Demo 

[DemoVideos]



