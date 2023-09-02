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
### Update
```
yum update
reboot
```
### Install Guest Addition
```
yum groupinstall "Development Tools"
yum install kernel-devel elfutils-libelf-devel
#Then Install Guest Addition
```

