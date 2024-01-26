$key = @{
    String = "<storage-account-key>" ## Insert SA - KEY
}
$acctKey = ConvertTo-SecureString @key -AsPlainText -Force

$cred = @{
    ArgumentList = "Azure\<storage-account-name>", $acctKey ## Replace with your SA
}
$credential = New-Object System.Management.Automation.PSCredential @cred

$map = @{
    Name = "Z" ## Provide prefered Drive-letter
    PSProvider = "FileSystem"
    Root = "\\<storage-account-name>.file.core.windows.net\file-share" ## Replace with your SA URL
    Credential = $credential
}
New-PSDrive @map

$key = @{
    String = "<storage-account-key>" ## Insert SA - KEY
}
$acctKey = ConvertTo-SecureString @key -AsPlainText -Force

$cred = @{
    ArgumentList = "Azure\myprivatestoragepcpc", $acctKey ## Replace with your SA
}
$credential = New-Object System.Management.Automation.PSCredential @cred

$map = @{
    Name = "Z" ## Provide prefered Drive-letter
    PSProvider = "FileSystem"
    Root = "\\myprivatestoragepcpc.file.core.windows.net\myprivatesharepcpc" ## Replace with your SA URL
    Credential = $credential
}
New-PSDrive @map