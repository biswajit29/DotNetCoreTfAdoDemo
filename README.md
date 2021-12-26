# DotNetCoreTfAdoDemo
demo sample for a .net core api project to host in Azure using ADO, dockerHub and TF

docker build -t bismsit29/weatherapi .
docker login
docker push bismsit29/weatherapi

terraform init
terraform plan
terraform apply
