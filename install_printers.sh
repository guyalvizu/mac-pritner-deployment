#!/bin/bash
#author 9uy@lv!zu

cd "$(dirname "$0")"

echo "Admin access is required. Please enter your password when prompted."
sudo -v

# Install Drivers
echo "Installing Canon driver..."
sudo installer -pkg ./drivers/CanonDriver.pkg -target /

echo "Installing HP driver..."
sudo installer -pkg ./drivers/HPDriver.pkg -target /

# Add Canon Printers
echo "Adding Canon printers..."
lpadmin -p "SP_Off_Canon_L_4725" -L "Office Left" -E -v lpd://[CANON_IP_1] -P ./ppds/CNPZUIRA4725ZU.ppd.gz
lpadmin -p "SP_Off_Canon_R_6860" -L "Office Right" -E -v lpd://[CANON_IP_2] -P ./ppds/CNPZUIRA6860ZU.ppd.gz
lpadmin -p "SP_2nd_Floor_Canon_8705" -L "2nd Floor" -E -v lpd://[CANON_IP_3] -P ./ppds/CNPZUIRA8705ZU.ppd.gz

# Add HP Printers
echo "Adding HP printers..."
lpadmin -p "SP_LRC_Color_651" -L "LRC Color" -E -v lpd://[HP_IP_1] -P ./ppds/HP_Color_LaserJet_M651.gz
lpadmin -p "SP_LRC_4100" -L "LRC B&W" -E -v lpd://[HP_IP_2] -P ./ppds/HP_LaserJet_4100_Series.gz

# Enable all printers
echo "Enabling all printers..."
cupsenable SP_Off_Canon_L_4725
cupsenable SP_Off_Canon_R_6860
cupsenable SP_2nd_Floor_Canon_8705
cupsenable SP_LRC_Color_651
cupsenable SP_LRC_4100

echo "Installation complete. All printers are installed and ready to use."
