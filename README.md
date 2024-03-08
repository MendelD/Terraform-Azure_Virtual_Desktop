# Terraform-Azure_Virtual_Desktop

## Requirements ##


### Login to Azure CLI and get SubscriptionID and TenantID ###
```
az login --tenant <tenant>
$subscriptionid=$(az account show --query id --output tsv)
$tenantid=$(az account show --query tenantId --output tsv)

echo "SubscriptionID = $subscriptionid"
echo "TenantID = $tenantid"
```
<br />

### Create Azure AD Service Principal ###
```
$app=$(az ad sp create-for-rbac --name="Terraform Service Principal" --role="Contributor" --scopes="/subscriptions/$subscriptionid")

$clientId=($app | ConvertFrom-Json).appId
$clientsecret=($app | ConvertFrom-Json).password

echo "clientID = $clientid"
echo "client secret = $clientsecret"
```
<br />

### Create variables that Terraform will use ###
Create terraform.auto.tfvars file and add
```
tenant_id     = "Your tenant id"
subscription_id = "Your subscription id"
client_id     = "Terraform Service Principal client ID"
client_secret = "Terraform Service Principal client secret"
```