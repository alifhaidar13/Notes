# EDB Postgres Advanced Server Installation on RHEL 9.2 VM
https://www.enterprisedb.com/docs/epas/latest/installing/linux_x86_64/epas_rhel_9/
## Set up the EDB repository
### Check repo
```
dnf repolist | grep enterprisedb
```
### Set up the EDB repository
```
curl -1sLf 'https://downloads.enterprisedb.com/ndzW5EMdQ1WEEFfEE8xTdZ609jDfjkSA/enterprise/setup.rpm.sh' | sudo -E bash
```
## Install the EPEL repository
```
dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
```
## Install the package
```
dnf -y install edb-as15-server
```
- Create password
```
passwd enterprisedb
```
## (Additional) Install an individual component
```
dnf -y install <package_name>
```
https://www.enterprisedb.com/docs/epas/latest/installing/linux_install_details/rpm_packages/
## Initial configuration
```
PGSETUP_INITDB_OPTIONS="-E UTF-8" /usr/edb/as15/bin/edb-as-15-setup initdb
systemctl start edb-as-15
```
## Connect database
```
su - enterprisedb
ALTER ROLE enterprisedb IDENTIFIED BY 123qwe;
```
## Experiment
