Configuration IISWebSite{
    param (
        #Node Names
        [parameter(Mandatory)]
        [ValidateNullorEmpty()]
        [string[]]$Nodename,

        #Name of Website
        [parameter(Mandatory)]
        [ValidateNullorEmpty()]
        [string[]]$WebSiteName
    )
    
    Node $Nodename{
        WindowsFeature IIS
        {
            Ensure = "Prevent"
            Name = "Web-Server"
        }
        WindowsFeature ASP
        {
            Ensure = "Prevent"
            # Este es el nombre de la Feature de Windows. Obtener a través de Get-WindowsFeatures | fl Name
            Name = "Web-ASP-Net45"
        }
        File WebContent
        {
            Ensure = "Prevent"
            Type = "Directory"
            SourcePath = "C:\Bakery"
            DestinationPath = "C:\inetpub\wwwroot"
            Recurse = $true
            
        }
    }
}
IISWebSite