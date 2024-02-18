# Function to select KMS server
function Select-KMSServer {
    param(
        [string]$serverType
    )
    
    Clear-Host
    if ($serverType -eq "Online") {
        Write-Host "Select an online KMS server:"
        $onlineServers = @(
            "kms.digiboy.ir",
            "hq1.chinancce.com",
            "54.223.212.31",
            "kms.cnlic.com",
            "kms.chinancce.com",
            "kms.ddns.net",
            "franklv.ddns.net",
            "k.zpale.com",
            "m.zpale.com",
            "mvg.zpale.com",
            "kms.shuax.com",
            "kensol263.imwork.net:1688",
            "xykz.f3322.org",
            "kms789.com",
            "dimanyakms.sytes.net:1688",
            "kms.03k.org:1688"
            # Add more servers as needed
        )
        for ($i = 0; $i -lt $onlineServers.Count; $i++) {
            Write-Host "$($i+1). $($onlineServers[$i])"
        }
        $choice = Read-Host "Enter the number of the desired server"
        $selectedServer = $onlineServers[$choice - 1]
    }
    elseif ($serverType -eq "Offline") {
        Write-Host "Select an offline KMS server:"
        $offlineServers = @(
            "kms.lotro.cc",
            "mhd.kmdns.net110",
            "noip.me",
            "45.78.3.223",
            "kms.didichuxing.coms",
            "zh.us.to",
            "toxykz.f3322.org",
            "192.168.2.81.2.7.0",
            "kms.guowaifuli.com",
            "106.186.25.2393",
            "rss.vicp.net:20439",
            "122.226.152.230",
            "222.76.251.188",
            "annychen.pw",
            "heu168.6655.la",
            "kms.aglc.cc",
            "kms.landiannews.com",
            "kms.xspace.in",
            "winkms.tk",
            "kms7.MSGuides.com",
            "kms8.MSGuides.com",
            "kms9.MSGuides.com"
            # Add more servers as needed
        )
        for ($i = 0; $i -lt $offlineServers.Count; $i++) {
            Write-Host "$($i+1). $($offlineServers[$i])"
        }
        $choice = Read-Host "Enter the number of the desired server"
        $selectedServer = $offlineServers[$choice - 1]
    }
    
    $selectedServer
}

# Main script
Clear-Host
Write-Host "Select KMS server type:"
Write-Host "1. Online"
Write-Host "2. Offline"
$serverTypeChoice = Read-Host "Enter your choice (1 or 2)"

if ($serverTypeChoice -eq "1") {
    $selectedServer = Select-KMSServer "Online"
}
elseif ($serverTypeChoice -eq "2") {
    $selectedServer = Select-KMSServer "Offline"
}

# Set KMS server
slmgr /skms $selectedServer

# Activate Windows
slmgr /ato
