# 🧰 Laptop Health Toolkit

[![Windows Tested](assets/badges/windows-tested.svg)](https://github.com/crispusomollo)
[![macOS Tested](assets/badges/macos-tested.svg)](https://github.com/crispusomollo)
[![Bootable USB](assets/badges/bootable-usb.svg)](https://github.com/crispusomollo)

A complete cross-platform toolkit for checking laptop health.
Includes Windows PowerShell scripts, macOS shell checks, SMART/`smartctl` diagnostics, and a full bootable USB health test environment.

![PowerShell Version](https://img.shields.io/badge/PowerShell-5.1%2B-blue?logo=powershell)
![macOS zsh](https://img.shields.io/badge/macOS-zsh-orange?logo=apple)
![Linux Shell](https://img.shields.io/badge/Linux-bash%20%2F%20zsh-green?logo=linux)
![smartctl Support](https://img.shields.io/badge/smartctl-supported-lightgrey?logo=smart)
![USB Boot](https://img.shields.io/badge/Bootable%20USB-Ventoy-success?logo=usb)

---

## ✨ Features

### 🔧 **Hardware Diagnostics**
- Check CPU temperature, frequency, and throttling  
- Battery cycle count, wear level, and runtime performance  
- RAM integrity tests (Windows + Linux boot ISO)  
- HDD/SSD SMART analysis using `smartctl`  
- Fan speed, thermal zones, and cooling performance  

### 🖥️ **Windows Toolkit**
- One-click health check (`health-check.ps1`)  
- PowerShell-based thermal, disk, and hardware checks  
- Event Viewer log summary  
- Driver + firmware inspection  

### 🍏 **macOS Toolkit**
- Shell script health scan  
- SMART disk tests with `diskutil` + `smartctl`  
- Battery service status + cycle count  
- macOS logs & performance checks  

### 🧪 **Bootable USB Toolkit**
- Ventoy-based multi-ISO health testing  
- Included checklist for:  
  ✔ Memory test ISO  
  ✔ CPU stress ISO  
  ✔ Linux rescue tools  
  ✔ Disk test ISO  

### 📦 **Portable & GitHub Ready**
- Organized repository structure  
- Banner images + badges  
- Ready-to-export ZIP structure  
- Works offline

---

## 🚀 Quick Start (Windows)

1. Clone the repository or extract the ZIP.  
2. Open **PowerShell as Administrator**.  
3. Run:

```powershell
cd scripts
.\health-check.ps1
```

---

## 📁 Contents

- **scripts/** — Windows and macOS script collection  
- **docs/** — Guides and detailed documentation  
- **iso/** — Placeholder for recommended ISOs  
- **assets/** — Banners, badges, screenshots  
- **usb-boot/** — Ventoy bootable USB instructions & ISO checklist  

---

## 🤝 Contributing

Contributions, suggestions, and improvements are welcome.  
Submit a pull request or open an issue to propose changes.

