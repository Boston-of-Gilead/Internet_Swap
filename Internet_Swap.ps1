$test = get-wmiobject win32_networkadapter | Where {(($_.netconnectionid -eq "Ethernet") -and ($_.netconnectionstatus -eq 2)) -or (($_.netconnectionid -eq "Ethernet 3") -and ($_.netconnectionstatus -eq 2))} | Select name, netconnectionstatus #select netconnectionid, name, InterfaceIndex, guid, netconnectionstatus
#Gets Wifi IFIndex
#$wifiindex = get-wmiobject win32_networkadapter | Where {($_.netconnectionid -eq "Wi-Fi")} | Select InterfaceIndex -ExpandProperty InterfaceIndex
if ($test -eq $null){
    Write-Host "Using Wi-Fi"
    Start-Service Wlansvc
    }
    else {
    Write-Host "Using direct LAN or dock"
    Stop-Service Wlansvc
    #Use these two together to change state from 2 to 0 to 7
    #netsh interface set interface "Wi-Fi" disabled
    #netsh interface set interface "Wi-Fi" enabled
    }
