terraform fmt # Format files
az account show --query id --output tsv # get subscription id
export ARM_SUBSCRIPTION_ID="$(az account show --query id --output tsv)" # set the env
ssh azureuser@<vm-ip> # Connect into vm