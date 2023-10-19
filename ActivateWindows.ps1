# Function to detect the operating system edition
function Get-OSInfo {
    $osInfo = Get-CimInstance -ClassName Win32_OperatingSystem
    $editionId = $osInfo.OperatingSystemSKU
    switch ($editionId) {
        4 { return "Windows 10 Pro" }
        48 { return "Windows 10 Pro N" }
        27 { return "Windows 10 Pro for Workstations" }
        53 { return "Windows 11 Pro" }
        57 { return "Windows 11 Pro N" }
        28 { return "Windows 11 Pro for Workstations" }
        default { return "Unsupported OS Edition" }
    }
}

# Function to activate the OS using a KMS Client Product Key
function Activate-OSWithKMSKey {
    param(
        [string]$productKey
    )
    
    $activationResult = slmgr /ipk $productKey
    $activationResult = slmgr /ato
    
    Write-Host "Activation result: $activationResult"
}

# Get the OS edition
$osEdition = Get-OSInfo

# Map OS edition to KMS Client Product Key
$kmClientProductKey = @{
    "Windows 10 Pro" = "W269N-WFGWX-YVC9B-4J6C9-T83GX"
    "Windows 10 Pro N" = "MH37W-N47XK-V7XM9-C7227-GCQG9"
    "Windows 10 Pro for Workstations" = "NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J"
    "Windows 11 Pro" = "W269N-WFGWX-YVC9B-4J6C9-T83GX"
    "Windows 11 Pro N" = "MH37W-N47XK-V7XM9-C7227-GCQG9"
    "Windows 11 Pro for Workstations" = "NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J"
}

if ($kmClientProductKey.ContainsKey($osEdition)) {
    $productKey = $kmClientProductKey[$osEdition]
    Write-Host "Detected OS Edition: $osEdition"
    Write-Host "Activating with KMS Client Product Key: $productKey"
    Activate-OSWithKMSKey -productKey $productKey
} else {
    Write-Host "Unsupported OS edition: $osEdition"
}
