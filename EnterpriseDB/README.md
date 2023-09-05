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
- Output
```
Updating Subscription Management repositories.
enterprisedb-enterprise                                 322  B/s | 659  B     00:02
enterprisedb-enterprise-noarch                          592  B/s | 659  B     00:01
enterprisedb-enterprise-noarch                           19 kB/s |  34 kB     00:01
enterprisedb-enterprise-source                          420  B/s | 659  B     00:01
enterprisedb-enterprise-source                          133  B/s | 291  B     00:02
Extra Packages for Enterprise Linux 9 - x86_64          550 kB/s |  19 MB     00:34
Extra Packages for Enterprise Linux 9 openh264 (From Ci 207  B/s | 2.5 kB     00:12
Red Hat Enterprise Linux 9 for x86_64 - BaseOS (RPMs)   1.2 kB/s | 4.1 kB     00:03
Red Hat Enterprise Linux 9 for x86_64 - AppStream (RPMs 839  B/s | 4.5 kB     00:05
Red Hat Enterprise Linux 9 for x86_64 - AppStream (RPMs 1.4 MB/s |  24 MB     00:17
Dependencies resolved.
========================================================================================
 Package                     Arch   Version      Repository                        Size
========================================================================================
Installing:
 edb-as15-server             x86_64 15.4.0-1.el9 enterprisedb-enterprise          9.8 k
Installing dependencies:
 boost-atomic                x86_64 1.75.0-8.el9 rhel-9-for-x86_64-appstream-rpms  19 k
 boost-chrono                x86_64 1.75.0-8.el9 rhel-9-for-x86_64-appstream-rpms  26 k
 boost-date-time             x86_64 1.75.0-8.el9 rhel-9-for-x86_64-appstream-rpms  15 k
 edb-as15-pgagent            x86_64 4.2.2-1.el9  enterprisedb-enterprise          125 k
 edb-as15-server-client      x86_64 15.4.0-1.el9 enterprisedb-enterprise          1.4 M
 edb-as15-server-contrib     x86_64 15.4.0-1.el9 enterprisedb-enterprise          746 k
 edb-as15-server-core        x86_64 15.4.0-1.el9 enterprisedb-enterprise          6.5 M
 edb-as15-server-devel       x86_64 15.4.0-1.el9 enterprisedb-enterprise          6.2 M
 edb-as15-server-docs        x86_64 15.4.0-1.el9 enterprisedb-enterprise           18 k
 edb-as15-server-indexadvisor
                             x86_64 15.4.0-1.el9 enterprisedb-enterprise           69 k
 edb-as15-server-libs        x86_64 15.4.0-1.el9 enterprisedb-enterprise          669 k
 edb-as15-server-plperl      x86_64 15.4.0-1.el9 enterprisedb-enterprise           69 k
 edb-as15-server-plpython3   x86_64 15.4.0-1.el9 enterprisedb-enterprise          108 k
 edb-as15-server-pltcl       x86_64 15.4.0-1.el9 enterprisedb-enterprise           46 k
 edb-as15-server-sqlprotect  x86_64 15.4.0-1.el9 enterprisedb-enterprise          112 k
 lz4                         x86_64 1.9.3-5.el9  rhel-9-for-x86_64-baseos-rpms     62 k

Transaction Summary
========================================================================================
Install  17 Packages

Total download size: 16 M
Installed size: 62 M
Downloading Packages:
(1/17): edb-as15-server-15.4.0-1.el9.x86_64.rpm         4.6 kB/s | 9.8 kB     00:02
(2/17): edb-as15-pgagent-4.2.2-1.el9.x86_64.rpm          47 kB/s | 125 kB     00:02
(3/17): edb-as15-server-contrib-15.4.0-1.el9.x86_64.rpm 166 kB/s | 746 kB     00:04
(4/17): edb-as15-server-client-15.4.0-1.el9.x86_64.rpm  212 kB/s | 1.4 MB     00:06
(5/17): edb-as15-server-docs-15.4.0-1.el9.x86_64.rpm    4.9 kB/s |  18 kB     00:03
(6/17): edb-as15-server-core-15.4.0-1.el9.x86_64.rpm    542 kB/s | 6.5 MB     00:12
(7/17): edb-as15-server-indexadvisor-15.4.0-1.el9.x86_6  16 kB/s |  69 kB     00:04
(8/17): edb-as15-server-devel-15.4.0-1.el9.x86_64.rpm   671 kB/s | 6.2 MB     00:09
(9/17): edb-as15-server-plperl-15.4.0-1.el9.x86_64.rpm   45 kB/s |  69 kB     00:01
(10/17): edb-as15-server-libs-15.4.0-1.el9.x86_64.rpm   302 kB/s | 669 kB     00:02
(11/17): edb-as15-server-plpython3-15.4.0-1.el9.x86_64.  67 kB/s | 108 kB     00:01
(12/17): edb-as15-server-pltcl-15.4.0-1.el9.x86_64.rpm   33 kB/s |  46 kB     00:01
(13/17): edb-as15-server-sqlprotect-15.4.0-1.el9.x86_64  75 kB/s | 112 kB     00:01
(14/17): lz4-1.9.3-5.el9.x86_64.rpm                     6.0 kB/s |  62 kB     00:10
(15/17): boost-date-time-1.75.0-8.el9.x86_64.rpm        1.5 kB/s |  15 kB     00:10
(16/17): boost-chrono-1.75.0-8.el9.x86_64.rpm           2.8 kB/s |  26 kB     00:09
(17/17): boost-atomic-1.75.0-8.el9.x86_64.rpm           7.6 kB/s |  19 kB     00:02
----------------------------------------------------------------------------------------
Total                                                   541 kB/s |  16 MB     00:30
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                1/1
  Installing       : edb-as15-server-libs-15.4.0-1.el9.x86_64                      1/17
  Running scriptlet: edb-as15-server-libs-15.4.0-1.el9.x86_64                      1/17
  Installing       : edb-as15-server-client-15.4.0-1.el9.x86_64                    2/17
  Running scriptlet: edb-as15-server-client-15.4.0-1.el9.x86_64                    2/17
  Installing       : edb-as15-server-contrib-15.4.0-1.el9.x86_64                   3/17
  Running scriptlet: edb-as15-server-core-15.4.0-1.el9.x86_64                      4/17
  Installing       : edb-as15-server-core-15.4.0-1.el9.x86_64                      4/17
  Running scriptlet: edb-as15-server-core-15.4.0-1.el9.x86_64                      4/17
  Installing       : edb-as15-server-indexadvisor-15.4.0-1.el9.x86_64              5/17
  Running scriptlet: edb-as15-server-indexadvisor-15.4.0-1.el9.x86_64              5/17
  Installing       : edb-as15-server-plperl-15.4.0-1.el9.x86_64                    6/17
  Installing       : edb-as15-server-plpython3-15.4.0-1.el9.x86_64                 7/17
  Installing       : edb-as15-server-pltcl-15.4.0-1.el9.x86_64                     8/17
  Installing       : edb-as15-server-sqlprotect-15.4.0-1.el9.x86_64                9/17
  Running scriptlet: edb-as15-server-sqlprotect-15.4.0-1.el9.x86_64                9/17
  Installing       : edb-as15-server-devel-15.4.0-1.el9.x86_64                    10/17
  Installing       : boost-atomic-1.75.0-8.el9.x86_64                             11/17
  Installing       : boost-chrono-1.75.0-8.el9.x86_64                             12/17
  Installing       : boost-date-time-1.75.0-8.el9.x86_64                          13/17
  Installing       : edb-as15-pgagent-4.2.2-1.el9.x86_64                          14/17
  Running scriptlet: edb-as15-pgagent-4.2.2-1.el9.x86_64                          14/17
  Installing       : lz4-1.9.3-5.el9.x86_64                                       15/17
  Installing       : edb-as15-server-docs-15.4.0-1.el9.x86_64                     16/17
  Installing       : edb-as15-server-15.4.0-1.el9.x86_64                          17/17
  Running scriptlet: edb-as15-server-15.4.0-1.el9.x86_64                          17/17
  Verifying        : edb-as15-pgagent-4.2.2-1.el9.x86_64                           1/17
  Verifying        : edb-as15-server-15.4.0-1.el9.x86_64                           2/17
  Verifying        : edb-as15-server-client-15.4.0-1.el9.x86_64                    3/17
  Verifying        : edb-as15-server-contrib-15.4.0-1.el9.x86_64                   4/17
  Verifying        : edb-as15-server-core-15.4.0-1.el9.x86_64                      5/17
  Verifying        : edb-as15-server-devel-15.4.0-1.el9.x86_64                     6/17
  Verifying        : edb-as15-server-docs-15.4.0-1.el9.x86_64                      7/17
  Verifying        : edb-as15-server-indexadvisor-15.4.0-1.el9.x86_64              8/17
  Verifying        : edb-as15-server-libs-15.4.0-1.el9.x86_64                      9/17
  Verifying        : edb-as15-server-plperl-15.4.0-1.el9.x86_64                   10/17
  Verifying        : edb-as15-server-plpython3-15.4.0-1.el9.x86_64                11/17
  Verifying        : edb-as15-server-pltcl-15.4.0-1.el9.x86_64                    12/17
  Verifying        : edb-as15-server-sqlprotect-15.4.0-1.el9.x86_64               13/17
  Verifying        : lz4-1.9.3-5.el9.x86_64                                       14/17
  Verifying        : boost-date-time-1.75.0-8.el9.x86_64                          15/17
  Verifying        : boost-chrono-1.75.0-8.el9.x86_64                             16/17
  Verifying        : boost-atomic-1.75.0-8.el9.x86_64                             17/17
Installed products updated.

Installed:
  boost-atomic-1.75.0-8.el9.x86_64
  boost-chrono-1.75.0-8.el9.x86_64
  boost-date-time-1.75.0-8.el9.x86_64
  edb-as15-pgagent-4.2.2-1.el9.x86_64
  edb-as15-server-15.4.0-1.el9.x86_64
  edb-as15-server-client-15.4.0-1.el9.x86_64
  edb-as15-server-contrib-15.4.0-1.el9.x86_64
  edb-as15-server-core-15.4.0-1.el9.x86_64
  edb-as15-server-devel-15.4.0-1.el9.x86_64
  edb-as15-server-docs-15.4.0-1.el9.x86_64
  edb-as15-server-indexadvisor-15.4.0-1.el9.x86_64
  edb-as15-server-libs-15.4.0-1.el9.x86_64
  edb-as15-server-plperl-15.4.0-1.el9.x86_64
  edb-as15-server-plpython3-15.4.0-1.el9.x86_64
  edb-as15-server-pltcl-15.4.0-1.el9.x86_64
  edb-as15-server-sqlprotect-15.4.0-1.el9.x86_64
  lz4-1.9.3-5.el9.x86_64

Complete!

```
- Create password
```
passwd enterprisedb
```
  - Output
```
Changing password for user enterprisedb.
New password:
BAD PASSWORD: The password is shorter than 8 characters
Retype new password:
passwd: all authentication tokens updated successfully.
```
## (Additional) Install an individual component
```
dnf -y install <package_name>
```
https://www.enterprisedb.com/docs/epas/latest/installing/linux_install_details/rpm_packages/
## Initial configuration
```
PGSETUP_INITDB_OPTIONS="-E UTF-8" /usr/edb/as15/bin/edb-as-15-setup initdb
```
- Output
```
Initializing database ... OK
```
- Start EDB
```
systemctl start edb-as-15
```
## Connect database
```
su - enterprisedb
psql edb
ALTER ROLE enterprisedb IDENTIFIED BY '123qwe';
```
## Experiment
