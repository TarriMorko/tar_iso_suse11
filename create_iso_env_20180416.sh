#!/bin/bash
#
#
export LANG=POSIX
export LC_ALL=POSIX


## Check OS Version
grep 'VERSION = 11' /etc/SuSE-release
rc=$?

if [ $rc -ne 0 ] ; then
    echo "This script is for SuSE 11 ONLY."
    exit 0
fi


## Backup Setting
cp -p /etc/issue /etc/issue.bak
cp -p /etc/issue.net  /etc/issue.net.bak
cp -p /etc/login.defs  /etc/login.defs.bak
cp -p /etc/pam.d/common-password-pc /etc/pam.d/common-password-pc.bak
cp -p /etc/pam.d/common-auth-pc /etc/pam.d/common-auth-pc.bak
cp -p /etc/pam.d/common-account-pc /etc/pam.d/common-account-pc.bak
cp -p /etc/pam.d/sshd /etc/pam.d/sshd.bak
tar -cf pam_d.tar.bak /etc/pam.d >/dev/null 2>&1

cp -p /etc/passwd /etc/passwd.bak
cp -p /etc/audit/audit.rules /etc/audit/audit.rules.bak
cp -p /etc/audit/auditd.conf /etc/audit/auditd.conf.bak
cp -p /etc/profile /etc/profile.bak


cp -p /etc/services /etc/services.bak
cp -p /etc/syslog-ng/syslog-ng.conf  /etc/rsyslog.conf.bak


## Hardening Account
sed s/bash/false/g /etc/passwd | grep -v root  > /etc/passwd.tmp
cat /etc/passwd | grep root >> /etc/passwd.tmp
cat /etc/passwd.tmp > /etc/passwd
rm /etc/passwd.tmp

pam-config -a \
    --pwhistory --pwhistory-remember=5 \
    --cracklib-dcredit=-1 \
    --cracklib-ucredit=-1 \
    --cracklib-lcredit=-1 \
    --cracklib-ocredit=-1 \
    --cracklib-minlen=8 \
    --cracklib-retry=5 \
    --cracklib \
    --cracklib-dictpath=/usr/lib/null_dict 
    




##############
tar -xvpPf /tmp/Hardening/tar_iso_suse11_20180416.tar
chmod 644 /etc/cron.allow /etc/issue /etc/issue.net /etc/login.defs
chmod 644 /etc/profile.local /etc/profile /etc/services
chmod 644 /etc/pam.d/common-auth-pc
chmod 644 /root/.profile
chmod 640 /etc/audit/audit.rules /etc/audit/auditd.conf /etc/ssh/sshd_config
chmod 600 /etc/syslog-ng/syslog-ng.conf
chmod 660 /etc/sudoers

service sshd restart
service syslog restart
service auditd restart

# chkconfig list-unit-files
chkconfig --del autofs 
chkconfig --del lvm2-monitor
chkconfig --del mdmonitor
chkconfig --del nfs
chkconfig --del cups


mkdir -p /aulog/audreport
chmod -R 700 /aulog/audreport
chmod -R 700 /root
chkconfig --add auditd
chkconfig |grep auditd


## Add Accounts
groupadd -g 800 datactrl
groupadd -g 700 sp


useradd spos1 -c spos1 -g 700 -m -u 701 -s /bin/bash
useradd spos2 -c spos2 -g 700 -m -u 702 -s /bin/bash
useradd spos3 -c spos3 -g 700 -m -u 703 -s /bin/bash
useradd spos4 -c spos4 -g 700 -m -u 705 -s /bin/bash
useradd opusr -c opusr -g 800 -m -u 802 -s /bin/bash
useradd spadmin -c spadmin -g 700 -m -u 712 -s /bin/bash
