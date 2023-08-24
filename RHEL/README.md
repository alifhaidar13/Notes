# Configuring storage for a mount point file system

## Recommended Size (minimum)

Mandatory Volumes
  - /boot    : 1 GiB
  - /(root)  : 5-10 GiB
  - /home    : 1 GiB (?)
  - /swap    :
  	- RAM<2 		= 2*RAM
    - 2<RAM<8 	= 1*RAM
    - 8<RAM<64 	= 4-0.5*RAM
  
Recommended
  - /boot/efi   : 200 MiB
  - PRep        : 8 MiB

Additional
  - /usr    : 10 GiB
  - /var    : 5 GiB (?)
  - /tmp    : 5 GiB

for ORALCE
  - /u01    : 22 GiB

for PostgreSQL
  - /var/lib/pgsql/data

## Other Requirement

- RAM : 4 GiB
- Disk : 10-20 GiB
- Graphic : 1026x768
