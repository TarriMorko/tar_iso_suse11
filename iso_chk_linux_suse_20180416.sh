#!/bin/ksh
wrkdir=/home/spos2
hname=`hostname`
outfil=/home/spos2/$hname.iso_chk_linux.txt
echo "############################"  > $outfil
echo "# LINUX�t�αj���ˮ֪����  #" >> $outfil
echo "#        �Ĥ@���j��        #" >> $outfil
echo "############################"  >> $outfil
echo "  " >> $outfil
echo  Hostname: $hname >> $outfil
echo "  " >> $outfil
echo "1-1 �n���e����welcome message�O�_�t���t�θ�T�H" >> $outfil
echo "==================================" >> $outfil
echo " cat /etc/issue" >> $outfil
cat /etc/issue >> $outfil
echo "---------   ----------  ----------- " >> $outfil
echo "cat /etc/issue.net" >> $outfil
cat /etc/issue.net >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil
echo "  " >> $outfil

 
echo "2-1 �T�{�K�X�~��̺޲z�n�I�]�w�H" >> $outfil
echo "==================================" >> $outfil
echo " cat /etc/login.defs|grep PASS_MAX_DAYS"  >> $outfil
cat /etc/login.defs|grep PASS_MAX_DAYS |grep -v "^#" >> $outfil
echo "---------   ----------  ----------- " >> $outfil
echo "pam-config -q --cracklib" >> $outfil 
pam-config -q --cracklib >> $outfil
echo "----------------------------------" >> $outfil
echo "pam-config -q --pwhistory ">> $outfil
pam-config -q --pwhistory >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil
echo "  " >> $outfil


echo "2-2 �T�{�ϥΪ̱b�����i��O�ʡH" >> $outfil
echo "==================================" >> $outfil
echo " cat /etc/passwd "  >> $outfil
cat /etc/passwd   >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil
echo "  " >> $outfil


echo "2-3�T�{root�b�����޲z�O�_�A��H " >> $outfil
echo "==================================" >> $outfil
echo "2-3-2 �T�{/etc/passwd��/etc/group�Aroot��uid��gid "  >> $outfil
echo "�P 2-2 /etc/passwd ��" >> $outfil
echo "----------------------------------" >> $outfil
echo " cat /etc/group  "  >> $outfil
cat /etc/group   >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil

echo "2-3-3 �C�X/etc/passwd��/etc/group���Auid��gid��0���Ҧ��ϥΪ�"  >> $outfil
echo "==================================" >> $outfil
cat /etc/passwd |grep ':0:0' >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil
echo "  " >> $outfil


echo "2-4 �T�{�����n�t�ιw�]�b���O�_��������w " >> $outfil
echo "==================================" >> $outfil
echo "2-4-1 �ˬd/etc/passwd�b���C��A�O�_�d��guest�b���H "  >> $outfil
id guest >/dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "���t�Φ� GUEST �b���C" >> $outfil
else
    echo "���t�εL GUEST �b���C" >> $outfil
fi
echo "----------------------------------" >> $outfil
echo "  " >> $outfil
echo "  " >> $outfil


echo "2-4-2 �C�ܼt�ӨϥΤ��b�� "  >> $outfil
echo "==================================" >> $outfil
echo "�p2-2 /etc/passwd ��"  >> $outfil
echo "�L�t�ӨϥΤ��b��"  >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil
echo "  " >> $outfil

echo "2-4-3 �C�ܩҦ��t�ιw�]�b��" >> $outfil
echo "==================================" >> $outfil
echo "cat /etc/passwd |awk 'FS=":"  {print $1,$3}'|awk '$2 < 200 {print $1}'"  >> $outfil
cat /etc/passwd |awk 'FS=":"  {print $1,$3}'|awk '$2 < 200 {print $1}'  >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil
echo "  " >> $outfil


echo "2-5 �@��b���޲z" >> $outfil
echo "==================================" >> $outfil
echo "2-5-1,2 cat /etc/passwd "  >> $outfil
echo "�P 2-2 /etc/passwd ��" >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil
echo "  " >> $outfil

echo "2-5-3 �ˬd�O�_�����ݱK�X�Y�i�n�J���b�� "  >> $outfil
echo " ����:LK����w�APS�ݱK�X�n�J�ANP���ݱK�X�n�J" >> $outfil
echo " cat /etc/passwd | awk -F':' '{print $1}' | xargs -I {} passwd -S {} | awk '{print $1, $2}'" >> $outfil
cat /etc/passwd | awk -F':' '{print $1}' | xargs -I {} passwd -S {} | awk '{print $1, $2}' >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil

echo "2-6 �T�{�j���ϥΪ̥�����ʧ@�W�L�@�w�ɶ��ɡA���H�j���n�X�H" >> $outfil
echo "==================================" >> $outfil
echo "cat /etc/login.defs |grep LOGIN_TIMEOUT"  >> $outfil
cat /etc/login.defs |grep LOGIN_TIMEOUT >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil
echo "  " >> $outfil

echo "2-7 �T�{�t�ιw�]�ϥΪ̱b����umask��" >> $outfil
echo "==================================" >> $outfil
echo "cat /etc/login.defs |grep UMASK |grep 027"  >> $outfil
cat /etc/login.defs |grep UMASK |grep 027 >> $outfil
echo "----------------------------------" >> $outfil
echo "cat /root/.profile |grep umask"  >> $outfil
cat /root/.profile |grep umask  >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil
echo "  " >> $outfil


echo "2-8 �ˬdroot�n�J�ɬO�_����Droot���{��?"  >> $outfil
echo "==================================" >> $outfil
echo "ls -l /root/.profile" >> $outfil
ls -l /root/.profile >> $outfil
cat /root/.profile  >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil
echo "  " >> $outfil


echo "2-9 �T�{�O�_���������ݭn�n�J�v�����t�ιw�]�b��"  >> $outfil
echo "==================================" >> $outfil
# �T�{adm, bin, daemon, listen, lp, nobody, noaccess, nuucp, smtp, sys, uucp���b���Ҥw���ΥB�����login shell�C
system_default_accouts=(adm bin daemon listen lp nobody noaccess nuucp smtp sys uucp)
for system_default_accout in ${system_default_accouts[@]}; do
    login_sh=$(awk -v S=$system_default_accout -F':' '$1 == S {print $NF}' /etc/passwd)
    if [[ -z "$login_sh" ]]; then
        echo "���t�εL $system_default_accout �b���C"  >> $outfil
    else
        if 	[ "$login_sh" == "/bin/false" ]; then
            echo "���t�Φ� $system_default_accout ���t�ιw�]�b���A�� $system_default_accout �b���w���ΥB�����LoginShell�C"   >> $outfil
        else    
            echo "�b�� $system_default_accout �����ΡC"  >> $outfil
        fi

    fi
done
echo "----------------------------------" >> $outfil
echo "  " >> $outfil
echo "  " >> $outfil


echo "2-10 �t�ιw�]�b�����A���"  >> $outfil
echo "==================================" >> $outfil
echo "2-10-1 �ˬd�b���C��A�O�_�d��guest�b���H"    >> $outfil
# 2. �C�ܼt�ӨϥΤ��b���C
# 3. �C�ܩҦ��t�αb���C
id guest >/dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "���t�Φ� GUEST �b���C" >> $outfil
else
    echo "���t�εL GUEST �b���C" >> $outfil
fi
echo "----------------------------------" >> $outfil
echo "  " >> $outfil
echo "  " >> $outfil

echo "2-10-2 �C�ܼt�ӨϥΤ��b���C" >> $outfil
echo "==================================" >> $outfil
# getent passwd | awk -F: '$3 > 999 {print $1}'  >> $outfil
echo "�P2-2�ˬd/etc/passwd"    >> $outfil
echo "���t�εL�t�ӱb��"    >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil
echo "  " >> $outfil

echo "2-10-3 �C�ܩҦ��t�αb���C" >> $outfil
echo "==================================" >> $outfil
getent passwd | awk -F: '$3 < 999 {print $1}' >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil
echo "  " >> $outfil


echo "3-1 �T�{����telnet�A��" >> $outfil
echo "==================================" >> $outfil
echo "check_services=(telnet)" >> $outfil
check_services=(telnet)

for service in ${check_services[@]}; do
    echo "�ˬd�A�� $service ���A"           >> $outfil
    cat /etc/services | grep "^$service "  >> $outfil
    service_enabled=$?

    cat /etc/services | grep "^#$service " >> $outfil
    service_disabled=$?

    if [ $service_enabled -eq 0 ]; then
        echo "$service �A�Ȥw�Ұ�"          >> $outfil
    fi

    if [ $service_disabled -eq 0 ]; then
        echo "$service �A�Ȥw����"          >> $outfil
    fi

    if [ $service_disabled -gt 0 ] && [ $service_enabled -gt 0 ]; then
        echo "���t�εL $service �A��"       >> $outfil
    fi
    echo "----------------------------------" >> $outfil
    echo "  " >> $outfil
done
    echo "  " >> $outfil


echo "3-2 �T�{�ҥ�SSH�s�u���A���H" >> $outfil
echo "==================================" >> $outfil
echo "netstat -an |grep 22|grep LISTEN"  >> $outfil
netstat -an |grep :22|grep LISTEN  >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil
echo "  " >> $outfil


echo "4-1 �T�{�t�Τ��]�֥\��O�_�w�g�ҰʡH "  >> $outfil
echo "==================================" >> $outfil
echo "4-1-1 ps -ef|grep audit |grep -v grep "  >> $outfil
ps -ef|grep audit |grep -v grep   >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil
echo "  " >> $outfil
echo "4-1-2 cat auditd.conf |grep -v \"#\" "  >> $outfil
echo "==================================" >> $outfil
cat /etc/audit/auditd.conf |grep -v "^#"  >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil
echo "  " >> $outfil


echo "4-2 �T�{log file�Ȧ�root�㦳�g�J�v���C"  >> $outfil
echo "==================================" >> $outfil
echo "ls -l /var/log/audit/audit.log "  >> $outfil
ls -l /var/log/audit/audit.log  >> $outfil

echo "----------------------------------" >> $outfil
echo "  " >> $outfil
echo "  " >> $outfil


echo "5-1 �T�{cron�]�w���A���,��crontab file(/var/spool/cron/tabs)�O�_�A��O�@? "  >> $outfil
echo '5-1-1 crontab -l |grep -v "^#"'  >> $outfil
echo "==================================" >> $outfil
crontab -l |grep -v "^#"  >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil
echo '5-1-2 cat /etc/cron.allow'  >> $outfil
echo "==================================" >> $outfil
cat /etc/cron.allow  >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil
echo "  " >> $outfil


echo "6-1 �T�{�@�~�t�άO�_�w���������n�������A��(inetd) "  >> $outfil
echo "==================================" >> $outfil
echo "/etc/xinetd.conf" >> $outfil
check_services=(finger ftp gopher imap  pop2 talk ntalk telnet uucp nfs nis)

for service in ${check_services[@]}; do
    echo "�ˬd�A�� $service ���A"           >> $outfil
    cat /etc/services | grep "^$service "  >> $outfil
    service_enabled=$?

    cat /etc/services | grep "^#$service " >> $outfil
    service_disabled=$?

    if [ $service_enabled -eq 0 ]; then
        echo "$service �A�Ȥw�Ұ�"          >> $outfil
    fi

    if [ $service_disabled -eq 0 ]; then
        echo "$service �A�Ȥw����"          >> $outfil
    fi

    if [ $service_disabled -gt 0 ] && [ $service_enabled -gt 0 ]; then
        echo "���t�Υ��w�� $service �A��"       >> $outfil
    fi
    echo "----------------------------------" >> $outfil
    echo "  " >> $outfil
done
    echo "  " >> $outfil

echo "6-2 �T�{�u�}�ҥ��n���q�T���TCP/IP�A��"  >> $outfil
echo "==================================" >> $outfil
echo "�ˬd /etc/xinetd.conf" >> $outfil
xinetd_services=(ftp telnet shell login exec talk ntalk imap pop2 pop3 finger auth)

for xinetd in ${xinetd_services[@]}; do
    echo "�ˬd�A�� $xinetd ���A" >> $outfil
    cat /etc/xinetd.d/$xinetd 2>/dev/null  | grep "service\|disable" >> $outfil
    if ! [ -f /etc/xinetd.d/$xinetd ]; then
        echo "���t��$xinetd�A�Ȥw�����A�G���}��$xinetd���q�T���TCP/IP�A��" >> $outfil
        echo "  " >> $outfil
		fi
done
echo "----------------------------------" >> $outfil
echo "  " >> $outfil
echo "  " >> $outfil

echo "7-1 �T�{�ثe�O�_�w��s�ܭ׸ɵ{�����̾A�����C " >> $outfil
echo "==================================" >> $outfil
echo "�����b�~�e���̾A����"   >> $outfil
cat /etc/SuSE-release  >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil
echo "  " >> $outfil

echo "8-1 �T�{�O�_����t�ήz�I���y�C "  >> $outfil
echo "==================================" >> $outfil
echo "��w�짡�w������z�I���y"  >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil
echo "  " >> $outfil


echo "9-1 �D�����餧�_�ͬO�_�w�����O�ޡB�ϥΡH"  >> $outfil
echo "==================================" >> $outfil
echo "�D�����餧�_�;��г]ï�n�O�ި�"  >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil
echo "  " >> $outfil


echo "9-2 �T�{���о����ϥΫY�ݾA��H"  >> $outfil
echo "==================================" >> $outfil
echo "�w�˳n��B�}�ӽг�֭��i���Шϥ�"  >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil
echo "  " >> $outfil
