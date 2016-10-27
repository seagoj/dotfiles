#!/bin/bash

VBoxManage modifyvm "IOS Dev Environment" --cpuidset 00000001 000306a9 04100800 7fbae3ff bf3bfbff &&\
    VBoxManage setextradata "IOS Dev Environment" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "MacBookPro11,3" &&\
    VBoxManage setextradata "IOS Dev Environment" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0" &&\
    VBoxManage setextradata "IOS Dev Environment" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "iloveapple" &&\
    VBoxManage setextradata "IOS Dev Environment" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc" &&\
    VBoxManage setextradata "IOS Dev Environment" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
