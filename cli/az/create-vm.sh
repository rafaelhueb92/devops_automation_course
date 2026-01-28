PASSWORD="STRONGPWD123456!@#"

function createVM() {
echo "Creating $1"
 
az vm create --resource-group devops-automation --name "$1" --image Ubuntu2204 \
  --admin-username azureuser --admin-password "$PASSWORD" \
  --authentication-type password --location eastus2 --size Standard_D2s_v3
}

VMS=("vm01" "vm02")

for vm in "${VMS[@]}"; do
   createVM "$vm"
done

echo "All VM's created!"
