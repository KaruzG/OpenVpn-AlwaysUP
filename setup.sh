#!/bin/bash

# Every step, log it in case of crash.

# Initial text and DISCLAIMER

echo "$(<./bin/initialText)"

read thrash


# Check if running as root or sudo

if [ "$EUID" -ne 0 ]
  then echo "Please run with sudo or as root!"
  exit
fi


# Check if openVPN is installed
/usr/bin/dpkg -s openvpn &> .temp  # Kinda dirty
prontDpkg=$(wc -l < .temp)

if [ "$expr $prontDpkg" -gt 4 ]; then # Output of dpkg -s openvpn should be > 4 if is installed
    # Is installed
    echo "OpenVPN is already installed, checking if updates are avaliable."
else
    # Is not installed
    echo "OpenVPN is not installed, press ENTER to INSTALL"
    read thrash
    apt install openvpn -y
fi
rm .temp





# Check if setup is executed with (parameter1) VPNprofile
    # If not ask for path of VPNprofile
        # If not pront how to set it up in /config/profile.opvpn




# Configure CRONTAB, ask for refreshrate 
printf "Every how many minutes you want to check the VPN status? (Recommended 2): "
read refreshRateInMinutes # TODO: Check that input is correct, also fix, nothing working

echo $refreshRateInMinutes

if [ $refreshRateInMinutes -gt 59 ]; then
    echo "ojo"
else
    new_crontab="$refreshRateInMinutes" * * * * /ruta/del/comando""
fi

echo $new_crontab



#nueva_tarea="* * * * * /ruta/del/comando"
#echo "$(crontab -l)"$'\n'"$nueva_tarea" | crontab -




# Installation Completed, run opvpnAlwaysUp.sh
