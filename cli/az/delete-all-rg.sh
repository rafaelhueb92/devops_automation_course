#!/bin/bash

echo "Fetching all resource groups..."
RESOURCE_GROUPS=$(az group list --query "[].name" -o tsv)

if [ -z "$RESOURCE_GROUPS" ]; then
  echo "No resource groups found."
  exit 0
fi

echo "Found the following resource groups:"
echo "$RESOURCE_GROUPS"
echo ""
read -p "Are you sure you want to delete ALL resource groups? (yes/no): " CONFIRM

if [ "$CONFIRM" != "yes" ]; then
  echo "Aborted."
  exit 0
fi

echo "Deleting all resource groups..."
for rg in $RESOURCE_GROUPS; do
  echo "Deleting $rg..."
  az group delete --name "$rg" --yes --no-wait
done

echo "All resource group deletions initiated (running in background)."
