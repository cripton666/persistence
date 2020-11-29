#!/bin/bash

#Script echo en bash, para iniciar despues de haber instalado kali o parrot en usb persistente.
#Derechos redervados del Desarrollador Cripton666(jaime manquel).

trap Ctrl_c INT 

function Ctrl_c(){
    clear
    echo -e "\e[1;37mSaliendo del Script\e[0m"
    sleep 2s 
    exit 0
}

function persistencia {
    setxkbmap es 
    xterm -hold -e "fdisk -l" &
    airodump_xterm_PID=$!
    mkdir -p /mnt/linux
    echo -n -e "\e[0;37m[*] Elija Nombre de la Usb:\e[0m"
    read usb 
    mount /dev/$usb /mnt/linux
    echo "/ union" > /mnt/linux/persistence.conf
    umount /dev/$usb
    sleep 20s
}
persistencia
sleep 15s 
reboot
