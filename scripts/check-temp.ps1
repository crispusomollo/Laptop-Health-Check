$lib = "C:\tools\OpenHardwareMonitor\OpenHardwareMonitorLib.dll"
if (-not (Test-Path $lib)) {
    Write-Host "OpenHardwareMonitorLib.dll not found at $lib"
    exit 1
}
Add-Type -Path $lib
$pc = New-Object OpenHardwareMonitor.Hardware.Computer
$pc.CPUEnabled = $true
$pc.Open()
foreach ($hardware in $pc.Hardware) {
    if ($hardware.HardwareType -eq "CPU") {
        $hardware.Update()
        foreach ($sensor in $hardware.Sensors) {
            if ($sensor.SensorType -eq "Temperature") {
                Write-Host "$($sensor.Name): $($sensor.Value) °C"
            }
        }
    }
}
