powercfg /batteryreport
Start-Sleep -Seconds 1
$report = Join-Path $env:USERPROFILE "battery-report.html"
if (Test-Path $report) { Invoke-Item $report } else { Write-Host "Battery report not found." }
