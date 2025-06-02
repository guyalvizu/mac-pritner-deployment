# mac-printer-deployment
Automated printer deployment for macOS using bash, lpadmin, and local drivers.

## File Setup

Before running the script, make sure the following files are available in the correct directories:

### 🔧 Required Files

- **CanonDriver.pkg** — Canon printer driver package
- **HPDriver.pkg** — HP printer driver package
- **PPD files** (`.ppd.gz`) for each printer model

### 📁 Recommended Folder Structure

mac-printer-deployment/
├── install_printers.sh
├── drivers/
│ ├── CanonDriver.pkg
│ └── HPDriver.pkg
├── ppds/
│ ├── CNPZUIRA4725ZU.ppd.gz
│ ├── CNPZUIRA6860ZU.ppd.gz
│ ├── CNPZUIRA8705ZU.ppd.gz
│ ├── HP_Color_LaserJet_M651.gz
│ └── HP_LaserJet_4100_Series.gz


> 💡 If you're running this from a USB thumb drive, make sure the drivers and PPDs are inside folders named `drivers` and `ppds` relative to the script.

---

### Where to Find Canon/HP PPD Files?

PPD files are often:
- Installed with the printer driver
- Located in `/Library/Printers/PPDs/Contents/Resources/` after installing
- Downloadable from the manufacturer’s support site



# Mac Printer Deployment Script

This repository provides a bash script to automate the installation of Canon and HP printer drivers and the configuration of multiple printers on macOS devices using `lpadmin`.

## Overview

This script is designed for system administrators who need to quickly deploy print drivers and preconfigured printers in environments such as schools or offices. It supports:

- Canon and HP printer driver installation
- Setup for multiple printers using LPD and PPD files
- Silent operation with admin privileges

## Features

- Installs `.pkg` drivers from a local `drivers/` folder
- Installs Canon and HP printers via `lpadmin`
- Uses local `.ppd.gz` files from a `ppds/` folder
- Can be modified to suit different environments or models

## Usage

1. Clone or copy the repository to a Mac system.
2. Ensure your printer `.pkg` drivers are in the `drivers/` directory.
3. Ensure your `.ppd.gz` files are in the `ppds/` directory.
4. Run the script with:

```bash
chmod +x install_printers.sh
./install_printers.sh
