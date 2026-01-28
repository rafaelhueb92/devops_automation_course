az group create --name ansible-lab-rg --location eastus

az vm create --resource-group ansible-lab-rg --name "ansible-controller" --image Ubuntu2204 \
  --admin-username azureuser --admin-password "StrongPsw123@21" \
  --authentication-type password --location eastus2 --size Standard_D2s_v3 --public-ip-sku Standard

az vm create --resource-group ansible-lab-rg --name "ansible-target" --image Ubuntu2204 \
  --admin-username azureuser --admin-password "StrongPsw123@21" \
  --authentication-type password --location eastus2 --size Standard_D2s_v3 --public-ip-sku Standard

az vm open-port --resource-group ansible-lab-rg --name "ansible-controller" --port 22

az vm open-port --resource-group ansible-lab-rg --name "ansible-target" --port 22

az network nsg rule create \
  --resource-group ansible-lab-rg \
  --nsg-name ansible-targetNSG \
  --name Allow-8081 \
  --priority 1002 \
  --access Allow \
  --protocol Tcp \
  --direction Inbound \
  --source-address-prefixes '*' \
  --source-port-ranges '*' \
  --destination-address-prefixes '*' \
  --destination-port-ranges 8081

   az vm list-ip-addresses --query "[].virtualMachine.network.publicIpAddresses[].ipAddress" --name ansible-controller

   #### In the VM 

   sudo apt update
   sudo apt install -y ansible sshpass
   export ANSIBLE_HOST_KEY_CHECKING=False
   tocuh hosts
   ansible -i hosts targets -m ping
   ansible-playbook -i hosts playbooks/basic-setup.yaml
   ansible -i hosts targets -m shell -a "<command>"

   ## Step by step here https://github.com/rafaelhueb92/devops_automation/tree/main/06-ansible