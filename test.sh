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

pass_limit=`cat /etc/pam.d/system-auth`

if [ $? == 1 ]
then
	vuln=1
else
	
fi























