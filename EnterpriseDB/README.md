# EDB Postgres Advanced Server Installation on RHEL 9.2 VM
https://www.enterprisedb.com/docs/epas/latest/installing/linux_x86_64/epas_rhel_9/
## Set up the EDB repository
### Check repo
```
dnf repolist | grep enterprisedb
```
- Result if available
```
enterprisedb-enterprise          enterprisedb-enterprise
enterprisedb-enterprise-noarch   enterprisedb-enterprise-noarch
enterprisedb-enterprise-source   enterprisedb-enterprise-source
```
### Set up the EDB repository
```
curl -1sLf 'https://downloads.enterprisedb.com/ndzW5EMdQ1WEEFfEE8xTdZ609jDfjkSA/enterprise/setup.rpm.sh' | sudo -E bash
```
- Output
```
Executing the  setup script for the 'enterprisedb/enterprise' repository ...

   OK: Checking for required executable 'curl' ...
   OK: Checking for required executable 'rpm' ...
   OK: Detecting your OS distribution and release using system methods ...
 ^^^^: ... Detected/provided for your OS/distribution, version and architecture:
 >>>>:
 >>>>: ... distro=rhel  version=9.2  codename=Plow  arch=x86_64
 >>>>:
   OK: Importing 'enterprisedb/enterprise' repository GPG keys into rpm ...
   OK: Checking for available package manager (DNF/Microdnf/YUM/Zypper) ...
 ^^^^: ... Detected package manager as 'dnf'
   OK: Checking for dnf dependency 'dnf-plugins-core' ...
   OK: Checking if upstream install config is OK ...
   OK: Fetching 'enterprisedb/enterprise' repository configuration ...
   OK: Installing 'enterprisedb/enterprise' repository via dnf ...
Importing GPG key 0x9F1EF813:
 Userid     : "Cloudsmith Package (enterprisedb/enterprise) <support@cloudsmith.io>"
 Fingerprint: 31A4 CF09 0B3A E265 F131 58DE E71E B082 9F1E F813
 From       : https://downloads.enterprisedb.com/ndzW5EMdQ1WEEFfEE8xTdZ609jDfjkSA/enterprise/gpg.E71EB0829F1EF813.key
Importing GPG key 0x9F1EF813:
 Userid     : "Cloudsmith Package (enterprisedb/enterprise) <support@cloudsmith.io>"
 Fingerprint: 31A4 CF09 0B3A E265 F131 58DE E71E B082 9F1E F813
 From       : https://downloads.enterprisedb.com/ndzW5EMdQ1WEEFfEE8xTdZ609jDfjkSA/enterprise/gpg.E71EB0829F1EF813.key
Importing GPG key 0x9F1EF813:
 Userid     : "Cloudsmith Package (enterprisedb/enterprise) <support@cloudsmith.io>"
 Fingerprint: 31A4 CF09 0B3A E265 F131 58DE E71E B082 9F1E F813
 From       : https://downloads.enterprisedb.com/ndzW5EMdQ1WEEFfEE8xTdZ609jDfjkSA/enterprise/gpg.E71EB0829F1EF813.key
   OK: Updating the dnf cache to fetch the new repository metadata ...
   OK: The repository has been installed successfully - You're ready to rock!
```
## Install the EPEL repository
```
dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
```
- Output
```
Updating Subscription Management repositories.
Last metadata expiration check: 0:02:43 ago on Mon 04 Sep 2023 08:07:54 PM WIB.
epel-release-latest-9.noarch.rpm                                                                                                                        7.4 kB/s |  19 kB     00:02
Dependencies resolved.
========================================================================================================================================================================================
 Package                                        Architecture                             Version                                   Repository                                      Size
========================================================================================================================================================================================
Installing:
 epel-release                                   noarch                                   9-7.el9                                   @commandline                                    19 k

Transaction Summary
========================================================================================================================================================================================
Install  1 Package

Total size: 19 k
Installed size: 26 k
Downloading Packages:
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                                                                                                1/1
  Installing       : epel-release-9-7.el9.noarch                                                                                                                                    1/1
  Running scriptlet: epel-release-9-7.el9.noarch                                                                                                                                    1/1
Many EPEL packages require the CodeReady Builder (CRB) repository.
It is recommended that you run /usr/bin/crb enable to enable the CRB repository.

  Verifying        : epel-release-9-7.el9.noarch                                                                                                                                    1/1
Installed products updated.

Installed:
  epel-release-9-7.el9.noarch

Complete!
```
## Install the package
```
dnf -y install edb-as<xx>-server
<xx> = version
dnf -y install edb-as12-server
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
