<# 
 Windows Laptop Health Check Script
 Author: Chris Origi
#>

Write-Host "=== LAPTOP HEALTH CHECK STARTED ===" -ForegroundColor Cyan

# CPU Temperature (requires OpenHardwareMonitorLib.dll)
$lib = "$env:ProgramFiles\OpenHardwareMonitor\OpenHardwareMonitorLib.dll"
if (-not (Test-Path $lib)) {
    $lib = "C:\tools\OpenHardwareMonitor\OpenHardwareMonitorLib.dll"
}
if (Test-Path $lib) {
    try {
        Add-Type -Path $lib -ErrorAction Stop
        $pc = New-Object OpenHardwareMonitor.Hardware.Computer
        $pc.CPUEnabled = $true
        $pc.GPUEnabled = $true
        $pc.Open()

        Write-Host "`n--- CPU & GPU TEMPERATURES ---" -ForegroundColor Yellow
        foreach ($hw in $pc.Hardware) {
            $hw.Update()
            if ($hw.HardwareType -in @("CPU","GpuNvidia","GpuAti","GpuIntel")) {
                foreach ($sensor in $hw.Sensors) {
                    if ($sensor.SensorType -eq "Temperature") {
                        Write-Host ("{0,-30} : {1,6} °C" -f $sensor.Name, $sensor.Value)
                    }
                }
            }
        }
    } catch {
        Write-Host "Failed to load OpenHardwareMonitorLib: $_" -ForegroundColor Red
    }
} else {
    Write-Host "CPU Temperature: OpenHardwareMonitorLib.dll not found. Download OpenHardwareMonitor and set path." -ForegroundColor DarkYellow
}

# Disk Status
Write-Host "`n--- DISK HEALTH ---" -ForegroundColor Yellow
try {
    wmic diskdrive get status,model,size
} catch {
    Write-Host "wmic not available" -ForegroundColor Red
}

# SSD SMART (requires admin)
Write-Host "`n--- SSD/HDD SMART RELIABILITY COUNTERS ---" -ForegroundColor Yellow
try {
    Get-PhysicalDisk | Get-StorageReliabilityCounter | Format-Table -AutoSize
} catch {
    Write-Host "Get-StorageReliabilityCounter not available on this system." -ForegroundColor Yellow
}

# Battery Health
Write-Host "`n--- BATTERY HEALTH ---" -ForegroundColor Yellow
try {
    powercfg /batteryreport | Out-Null
    Write-Host "Battery report generated at: $env:USERPROFILE\battery-report.html"
} catch {
    Write-Host "Failed to generate battery report." -ForegroundColor Yellow
}

# RAM Test (recommendation)
Write-Host "`n--- RAM TEST ---" -ForegroundColor Yellow
Write-Host "To run Windows Memory Diagnostic, execute 'mdsched.exe' and reboot."

# OS Integrity
Write-Host "`n--- SFC / DISM (this may take a while) ---" -ForegroundColor Yellow
try {
    sfc /scannow
    DISM /Online /Cleanup-Image /RestoreHealth
} catch {
    Write-Host "SFC/DISM failed or not supported on this OS." -ForegroundColor Yellow
}

Write-Host "`n=== HEALTH CHECK COMPLETE ===" -ForegroundColor Cyan
