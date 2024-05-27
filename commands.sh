
# Clone source 
git clone git@github.com:nguyentrungmen/azure-devops-cicd-pipeline-udacity-prj2.git; 
cd azure-devops-cicd-pipeline-udacity-prj2; 
git pull; 
python3 -m venv ~/.azure-devops-cicd-pipeline-udacity-prj2; 
# Active ENV
source ~/.azure-devops-cicd-pipeline-udacity-prj2/bin/activate; 
# Install requirements
make all; 
# DEPLOY APP
az webapp up -n mennt1-udacity-project2-app -g Azuredevops --sku FREE