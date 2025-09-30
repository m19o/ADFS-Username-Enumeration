function Invoke-Obfuscated {
    # region Obfuscated Get-WebPorts
    function g7 {
        [xml]$l1 = (Invoke-WebRequest -Uri ([string]::Join('',('h','t','t','p','s',':','/','/','w','w','w','.','i','a','n','a','.','o','r','g','/','a','s','s','i','g','n','m','e','n','t','s','/','s','e','r','v','i','c','e','-','n','a','m','e','s','-','p','o','r','t','-','n','u','m','b','e','r','s','.','x','m','l')))).Content
        $o2 = ""
        $t3 = $l1.ChildNodes.record.Count
        $c4 = 0
        foreach ($r5 in $l1.ChildNodes.record){
            $c4++
            $p6 = [math]::Round(($c4 / $t3) * 100, 2)
            Write-Progress -Activity ("P"+"r"+"o"+"c"+"e"+"s"+"s"+"i"+"n"+"g"+" "+"r"+"e"+"c"+"o"+"r"+"d"+"s") -Status ("G"+"e"+"t"+"t"+"i"+"n"+"g"+" "+"p"+"o"+"r"+"t"+" "+"d"+"e"+"s"+"c"+"r"+"i"+"p"+"t"+"i"+"o"+"n"+"s") -PercentComplete $p6
            if ([string]::IsNullOrEmpty($r5.number) -or ([string]::IsNullOrEmpty($r5.protocol))) { continue }
            $d7 = ($r5.description -replace '`n','') -replace '\s+',' '
            $n8 = $r5.number
            if ($n8 -like "*-*") {
                $nA = $n8.Split('-')
                foreach($nB in $nA[0]..$nA[1]) {
                    $o2 += "$nB|$($r5.protocol)|$($r5.name)|$d7`n"
                }
            } else {
                $o2 += "$n8|$($r5.protocol)|$($r5.name)|$d7`n"
            }
        }
        Write-Progress -Activity ("P"+"r"+"o"+"c"+"e"+"s"+"s"+"i"+"n"+"g"+" "+"r"+"e"+"c"+"o"+"r"+"d"+"s") -Status ("G"+"e"+"t"+"t"+"i"+"n"+"g"+" "+"p"+"o"+"r"+"t"+" "+"d"+"e"+"s"+"c"+"r"+"i"+"p"+"t"+"i"+"o"+"n"+"s") -PercentComplete 100
        Out-File -InputObject $o2 -FilePath "$PSScriptRoot\ports.txt"
        Write-Verbose -message ("F"+"i"+"l"+"e"+" "+"c"+"r"+"e"+"a"+"t"+"e"+"d"+" "+"a"+"t"+" "+$PSScriptRoot+"\ports.txt") 
    }
    # endregion

    # region Obfuscated get-Version
    function v9 {
        $lC = "$PSScriptRoot\pmap.psd1"
        $rD = ([string]::Join('',('h','t','t','p','s',':','/','/','r','a','w','.','g','i','t','h','u','b','u','s','e','r','c','o','n','t','e','n','t','.','c','o','m','/','t','e','k','s','h','t','e','i','n','/','P','o','r','t','-','M','a','p','/','m','a','s','t','e','r','/','p','m','a','p','.','p','s','d','1')))
        $lE = Import-PowerShellDataFile -Path $lC
        $lF = [version]$lE.ModuleVersion
        $rG = Invoke-WebRequest -Uri $rD -UseBasicParsing
        $rH = Invoke-Expression $rG.Content
        $rI = [version]$rH.ModuleVersion
        if ($lF.Major -lt $rI.Major) {
            Write-Host ("A"+" "+"n"+"e"+"w"+" "+"v"+"e"+"r"+"s"+"i"+"o"+"n"+" "+"("+$rI+")"+" "+"i"+"s"+" "+"a"+"v"+"a"+"i"+"l"+"a"+"b"+"l"+"e"+"."+" "+"P"+"l"+"e"+"a"+"s"+"e"+" "+"u"+"p"+"d"+"a"+"t"+"e"+" "+"y"+"o"+"u"+"r"+" "+"m"+"o"+"d"+"u"+"l"+"e"+"." )
        }
    }
    # endregion

    # region Expose Obfuscated Functions
    Set-Alias -Name Invoke-WebPorts -Value g7
    Set-Alias -Name Invoke-VersionCheck -Value v9
    # endregion
}
