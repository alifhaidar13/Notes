# Configuring storage for a mount point file system
## Recommended Size (minimum)
### Mandatory Volumes
  - /boot    : 500 MiB - 1 GiB
  - /        : 5-10 GiB
  - /home    : 500 MiB - 1 GiB
  - /swap    :
  	- RAM<2 		= 2*RAM
    - 2<RAM<8 	= 1*RAM
    - 8<RAM<64 	= 4-0.5*RAM  
### Recommended
  - /boot/efi   : 200 MiB
  - PRep        : 8 MiB
### Additional
  - /usr    : 10 GiB
  - /var    : 5-10 GiB (?)
  - /tmp    : 5 GiB
### for ORALCE
  - /u01    : 22 GiB
### for PostgreSQL
  - /var/lib/pgsql/data : 1 GiB
### My Setting
  - /boot  : 500 MiB
  - /home  : 500 MiB
  - /      : 5 GiB +
    - Oracle      => 25 GiB
    - Postgresql  => 5 GiB
    - EDB         => 5 GiB
  - /swap  : 8 GiB
  - /tmp   : 2 GiB
```
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/installation_guide/s2-diskpartrecommend-x86
```
## Other Requirement

- RAM : 4 GiB
- Disk : 10-20 GiB
- Graphic : 1026x768

## Post Installation
### Subscription Register
```
subscription-manager register --username=<username> --password=<password>
subscription-manager status
subscription-manager syspurpose role --set "Red Hat Enterprise Linux Server"
subscription-manager syspurpose service-level --set "Self-Support"
subscription-manager syspurpose usage --set "Development/Test
subscription-manager syspurpose --show"
```
### Update
```
dnf update
reboot
```
### Install Guest Addition

- Check grouplist Development Tools
```
dnf grouplist installed | grep Dev*
```
- Check package (kernel-devel & elfluits)
```
dnf list installed | grep kernel-devel
dnf list installed | grep elfutils-libelf-devel
```
- Install Development Tools and kernel-devel 
```
dnf groupinstall "Development Tools"
dnf install kernel-devel elfutils-libelf-devel

#Then Install Guest Addition
```
### Enable SSHD
```
vi /etc/ssh/sshd_config
PermitRootLogin yes
PasswordAuthentication yes
```
### Addtional
```
ln -sfn /dev/null /etc/motd.d/cockpit
vi /etc/pam.d/sshd
# session    optional     pam_motd.so
```
