# from stackoverflow answer https://stackoverflow.com/questions/59198965/how-to-restart-a-container-instance-using-powershell/59260725

$connectionName = "AzureRunAsConnection"
$servicePrincipalConnection = Get-AutomationConnection -Name $connectionName

$appid = "<App ID>"
$appSecret= "<APP Secret>"
$tenant = $servicePrincipalConnection.TenantID

$resourceGroup = "<resource-group>"
$containerInstanceName = "<container-instance-name>"
$subscrptionId = "Ssubscription ID>"

$body=@{
    "grant_type"="client_credentials";
    "resource"="https://management.azure.com/";
    "client_id"=$appid;
    "client_secret"=$appSecret
}
 
$result=Invoke-RestMethod -Uri "https://login.windows.net/$tenant/oauth2/token" -Method POST -Body $body 
$accessToken = $result.access_token

Write-Output "Logged in" 

$result1 = Invoke-RestMethod -Uri "https://management.azure.com/subscriptions/$subscrptionId/resourceGroups/$resourceGroup/providers/Microsoft.ContainerInstance/containerGroups/$containerInstanceName/restart?api-version=2018-10-01" -Method POST -Headers @{"Authorization"="Bearer $accessToken"} 
Write-Output "Restarted" 
