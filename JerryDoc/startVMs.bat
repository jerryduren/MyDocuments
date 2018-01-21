ECHO ON

"C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" startvm "controller"  --type headless
"C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" startvm "compute"  --type headless
"C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" startvm "network"  --type headless

EXIT(0)