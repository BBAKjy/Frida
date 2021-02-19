#!/bin/bash
grep "pts/" /etc/securetty > /dev/null 2>&1

if [ $? == 0 ]
then
	echo "[1] Vuln"

else
	echo "[1] Not Vuln"
fi



cat /etc/login.defs | grep "pass_warn_age" > /dev/null 2>&1
if [ $? == 0 ]
then
	pass_warn_age=`cat /etc/login.defs |grep "pass_warn_age"`
		
	for i in $pass_warn_age;
	do
		continue
	done	

	if [ $i -le 7 ]
	then
		echo "[2-1] Not Vuln"
	else
		echo "[2-1] Vuln"
	fi 
else
	echo "[2-1] Vuln"
fi

cat /etc/login.defs | grep "pass_max_days" > /dev/null 2>&1
if [ $? == 0 ]
then
	pass_max_days=`cat /etc/login.defs |grep "pass_max_days"`
		
	for i in $pass_max_days;
	do
		continue
	done

	if [ $i -le 60 ]
	then
		echo "[2-2] Not Vuln"
	else
		echo "[2-2] Vuln"
	fi 
else
	echo "[2-2] Vuln"
fi

cat /etc/login.defs | grep "pass_min_day" > /dev/null 2>&1
if [ $? == 0 ]
then
	pass_min_day=`cat /etc/login.defs |grep "pass_min_day"`
		
	for i in $pass_min_day;
	do
		continue
	done

	if [ $i -le 1 ]
	then
		echo "[2-3] Not Vuln"
	else
		echo "[2-3] Vuln"
	fi 
else
	echo "[2-3] Vuln"
fi

##--------------------------------------------------------------------------------------------
##--------------------------------------------------------------------------------------------
##-------------------------------------TODO 1-------------------------------------------------
##--------------------------------------------------------------------------------------------
##--------------------------------------------------------------------------------------------

lcredit=`cat /etc/security/pwquality.conf |grep "lcredit"`
if [ $? == 0 ]
then	
	vuln=0
	for i in $lcredit;
	do
		if [ $i == "#" ]
		then
			vuln=1
		fi
	done

	if [ $i -ne 0 ] && [ $vuln -ne 1 ]
	then
		vuln=0
	else
		vuln=1
	fi 
else
	vuln=1
fi

if [ $vuln == 1 ]
then
	echo "[2-4] Vuln"
else
	echo "[2-4] Not Vuln"
fi

ucredit=`cat /etc/security/pwquality.conf |grep "ucredit"`

if [ $? == 0 ]
then	
	vuln=0
	for i in $ucredit;
	do
		if [ $i == "#" ]
		then
			vuln=1
		fi
	done

	if [ $i -ne 0 ] && [ $vuln -ne 1 ]
	then
		vuln=0
	else
		vuln=1
	fi 
else
	vuln=1
fi

if [ $vuln == 1 ]
then
	echo "[2-5] Vuln"
else
	echo "[2-5] Not Vuln"
fi

dcredit=`cat /etc/security/pwquality.conf |grep "dcredit"`

if [ $? == 0 ]
then	
	vuln=0
	for i in $dcredit;
	do
		if [ $i == "#" ]
		then
			vuln=1
		fi
	done

	if [ $i -ne 0 ] && [ $vuln -ne 1 ]
	then
		vuln=0
	else
		vuln=1
	fi 
else
	vuln=1
fi

if [ $vuln == 1 ]
then
	echo "[2-6] Vuln"
else
	echo "[2-6] Not Vuln"
fi

ocredit=`cat /etc/security/pwquality.conf |grep "ocredit"`

if [ $? == 0 ]
then	
	vuln=0
	for i in $ocredit;
	do
		if [ $i == "#" ]
		then
			vuln=1
		fi
	done

	if [ $i -ne 0 ] && [ $vuln -ne 1 ]
	then
		vuln=0
	else
		vuln=1
	fi 
else
	vuln=1
fi

if [ $vuln == 1 ]
then
	echo "[2-7] Vuln"
else
	echo "[2-7] Not Vuln"
fi

minlen=`cat /etc/security/pwquality.conf |grep "minlen"`

if [ $? == 0 ]
then	
	vuln=0
	for i in $minlen;
	do
		if [ $i == "#" ]
		then
			vuln=1
		fi
	done

	if [ $i -lt 8 ] && [ $vuln -ne 1 ]
	then
		vuln=0
	else
		vuln=1
	fi 
else
	vuln=1
fi

if [ $vuln == 1 ]
then
	echo "[2-8] Vuln"
else
	echo "[2-8] Not Vuln"
fi

retry=`cat /etc/security/pwquality.conf |grep "retry"`
if [ $? == 0 ]
then	
	vuln=0
	for i in $retry;
	do
		if [ $i == "#" ]
		then
			vuln=1
		fi
	done

	if [ $i -gt 3 ] && [ $vuln -ne 1 ]
	then
		vuln=0
	else
		vuln=1
	fi 
else
	vuln=1
fi

if [ $vuln == 1 ]
then
	echo "[2-9] Vuln"
else
	echo "[2-9] Not Vuln"
fi

difok=`cat /etc/security/pwquality.conf |grep "difok"`
if [ $? == 0 ]
then	
	vuln=0
	for i in $difok;
	do
		if [ $i == "#" ]
		then
			vuln=1
		fi
	done

	if [ $i -lt 10 ] && [ $vuln -ne 1 ]
	then
		vuln=0
	else
		vuln=1
	fi 
else
	vuln=1
fi

if [ $vuln == 1 ]
then
	echo "[2-10] Vuln"
else
	echo "[2-10] Not Vuln"
fi

pass_limit=`cat /etc/pam.d/system-auth | grep "deny"`

if [ $? == 1 ]
then
	vuln=1
else 
	eval `echo $pass_limit | sed "s/ /;/g"` > /dev/null 2>&1

	if [ $deny -gt 5 ]
	then
		vuln=1
	else
		vuln=0	
	fi
fi

if [ $vuln == 1 ]
then
	echo "[3-1] Vuln"
else
	echo "[3-1] Not Vuln"
fi 

vuln=0 # initialize FLAG variable

test -f /etc/shadow # Check exist /etc/shadow
if [ $? == 1 ]
then
	vuln=1 # Not exist /etc/shadow File -> FLAG ON
else
	if grep -Evq '^[^:]*:x:' /etc/passwd
	then
		vuln=1
	else
		vuln=0
	fi
fi

if [ $vuln == 1 ] 
# Print Result

then
	echo "[4-1] Vuln"
else
	echo "[4-1] Not Vuln"
fi 

##--------------------------------------------------------------------------------------------
##--------------------------------------------------------------------------------------------
##-------------------------------------CLEAR--------------------------------------------------
##--------------------------------------------------------------------------------------------
##--------------------------------------------------------------------------------------------

# initialize FLAG variable
vuln=0

# grep True -> return 0, v -> Non-matching lines, E -> regular expression
dir_path=`cat ~/.profile | grep -i "path=" | sed 's/ //g'`

for i in $dir_path;
do
	temp=`echo $i | cut -d'"' -f 2`

	if [ "${temp:0:1}" == '.' ]
	then	
		vuln=1
	fi
done

# Print Result
if [ $vuln == 1 ] 
then
	echo "[5-1] Vuln"
else
	echo "[5-1] Not Vuln"
fi 

# initialize FLAG variable
vuln=0

# grep True -> return 0, v -> Non-matching lines, E -> regular expression
dir_path=`cat /etc/profile | grep -i "path=" | sed 's/ //g'`

for i in $dir_path;
do
	temp=`echo $i | cut -d'"' -f 2`

	if [ "${temp:0:1}" == '.' ]
	then	
		vuln=1
	fi
done

# Print Result
if [ $vuln == 1 ] 
then
	echo "[5-2] Vuln"
else
	echo "[5-2] Not Vuln"
fi 

# initialize FLAG variable
vuln=0

nouser=`sudo find / -nouser -print 2>&1`
for i in $nouser;
do
	if [ "${i:0:1}" == '/' ]
	then
		vuln=1
	fi
done

# Print Result
if [ $vuln == 1 ] 
then
	echo "[6-1] Vuln"
else
	echo "[6-1] Not Vuln"
fi

# initialize FLAG variable
vuln=0

nogroup=`sudo find / -nogroup -print 2>&1`
for i in $nogroup;
do
	if [ "${i:0:1}" == '/' ]
	then
		vuln=1
	fi
done

# Print Result
if [ $vuln == 1 ] 
then
	echo "[6-2] Vuln"
else
	echo "[6-2] Not Vuln"
fi 





sudo chown root /etc/passwd
echo "Change Owner /etc/passwd"
sudo chmod 644 /etc/passwd
echo "Change Permission /etc/passwd"

sudo chown root /etc/shadow
echo "Change Owner /etc/shadow"
sudo chmod 400 /etc/shadow
echo "Change Permission /etc/shadow"

sudo chown root /etc/hosts
echo "Change Owner /etc/hosts"
sudo chmod 600 /etc/hosts
echo "Change Permission /etc/hosts"

sudo chown root /etc/inetd.conf > /dev/null 2>&1
echo "Change Owner /etc/inetd.conf"
sudo chmod 600 /etc/inetd.conf > /dev/null 2>&1
echo "Change Permission /etc/inetd.conf"

sudo chown root /etc/xinetd.conf > /dev/null 2>&1
echo "Change Owner /etc/xinetd.conf"
sudo chmod 600 /etc/xinetd.conf > /dev/null 2>&1
echo "Change Permission /etc/xinetd.conf"

sudo chown -R root /etc/xinetd.d > /dev/null 2>&1
echo "Change Owner /etc/xinetd.d (Recursive)"
sudo chmod -R 600 /etc/xinetd.d > /dev/null 2>&1
echo "Change Permission /etc/xinetd.d (Recursive)"

sudo chown root /etc/syslog.conf > /dev/null 2>&1
echo "Change Owner /etc/syslog.conf"
sudo chmod 644 /etc/syslog.conf > /dev/null 2>&1
echo "Change Permission /etc/syslog.conf"

sudo chown root /etc/rsyslog.conf > /dev/null 2>&1
echo "Change Owner /etc/rsyslog.conf"
sudo chmod 644 /etc/rsyslog.conf > /dev/null 2>&1
echo "Change Permission /etc/rsyslog.conf"

sudo chown root /etc/services > /dev/null 2>&1
echo "Change Owner /etc/services"
sudo chmod 644 /etc/services > /dev/null 2>&1
echo "Change Permission /etc/services"

sudo find / -user root -type f \( -perm -04000 -o -perm -02000 \) -exec ls -al {} \;




