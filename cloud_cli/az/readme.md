az login
az account list --output table
az group list --output table
az vm list
az group create --name devops-automation -- location eastus
az vm create --resource-group devops-automation --name vm01 --image Ubuntu2204 \
  --admin-username azureuser --admin-password "$PASSWORD" \
  --authentication-type password --location eastus2 --size Standard_B2s
az vm list-sizes --location eastus2 \
  --query "[?name=='Standard_B1s' || name=='Standard_B2s' || name=='Standard_D2s_v3' || name=='Standard_D2s_v5' || name=='Standard_DS1_v2'].[name,numberOfCores,memoryInMb,resourceDiskSizeInMb]" \
  -o table
az vm list-sizes --location eastus2 -o table
az vm list-ip-addresses --resource-group DEVOPS-AUTOMATION --name vm01 --query "[].virtualMachine.network.publicIpAddresses[].ipAddress" --output ts
az vm list-ip-addresses --resource devops-automation --query "[].virtualMachine.{name:name, ip:network.publicIpAddresses[0].ipAddress}" -o json | jq -r '.[] | "\(.name) \(.ip)"'
awk '$1 == "vm01" { print $2 }' vms-ips.txt 
