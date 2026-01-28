
output "next_steps" {
  value = <<EOT
🎉 AKS Cluster created with success!

👉 Para acessar seu cluster, execute o seguinte comando:

az aks get-credentials --resource-group ${var.resource_group_name} --name ${var.aks_cluster_name}

🚀 Ingress Controller instalado com sucesso!

✅ Acesse o IP fixo criado:
http://${azurerm_public_ip.ingress_ip.ip_address}

📄 Você verá uma mensagem "404 Not Found" do NGINX — isso é esperado!

EOT
}

output "resource_group_name" {
  value = var.resource_group_name
}

output "aks_cluster_name" {
  value = var.aks_cluster_name
}