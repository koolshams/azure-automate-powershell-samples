$connectionName = "AzureRunAsConnection" # you will need a run as connection account for this
try
{
    # Get the connection "AzureRunAsConnection "
    $servicePrincipalConnection = Get-AutomationConnection -Name $connectionName
    Connect-AzAccount `
        -Tenant $servicePrincipalConnection.TenantID `
        -ApplicationId $servicePrincipalConnection.ApplicationID   `
        -CertificateThumbprint $servicePrincipalConnection.CertificateThumbprint `
        -ServicePrincipal
    Write-Output "Logged in" 
}
catch {
    if (!$servicePrincipalConnection)
    {
        $ErrorMessage = "Connection $connectionName not found."
        throw $ErrorMessage
    } else{
        Write-Error -Message $_.Exception
        throw $_.Exception
    }
}

Set-AzContext -SubscriptionId "<Subscription ID>"
Write-Output "Subscription selected" 

Restart-AzWebApp -ResourceGroupName "<resource-group>" -Name "<app-service-name>"
Write-Output "Restarting App service" 
