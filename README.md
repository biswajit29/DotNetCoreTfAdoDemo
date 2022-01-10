# DotNetCoreTfAdoDemo
demo sample for a .net core api project to host in Azure using ADO, dockerHub and TF

To **create the project** use

```dotnet new webapi -n weatherapi```

To **run the project locally** use
```dotnet run```

and the application will be accessible in - 
https://localhost:5001/weatherforecast

To **build and push image** locally -
```
docker build -t bismsit29/weatherapi .
docker run -p 8080:80 bismsit29/weatherapi
docker login
docker push bismsit29/weatherapi

```
Local **docker running application** will be available in 
http://localhost:8080/weatherforecast

to stop the application do ```docker ps``` and then ```docker stop <container id>``` and then kill the process for the running container or use the the stop option from the docker extension in VS Code. 

To **run Terraform** file locally
```
terraform init
terraform plan
terraform apply
terraform destroy
```

to create the **storage account and the container** use the below command
```
az group create -l uksouth  -n BKTestStorageACRG
az storage account create --name bktfstorageaccount  --resource-group BKTestStorageACRG 
az storage container create -n bktfstate --account-name bktfstorageaccount --resource-group BKTestStorageACRG

```