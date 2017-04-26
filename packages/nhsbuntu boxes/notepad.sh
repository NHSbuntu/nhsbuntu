#! /bin/bash
xfreerdp /cert-ignore /v:127.0.0.1 /u:vagrant /p:vagrant "/app:C:\Windows\notepad.exe" /rfx +fonts +aero +menu-anims +compression +clipboard +window-drag > /dev/null 2>&1 &
