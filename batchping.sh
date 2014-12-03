#!/bin/bash
count=4
all=''
echo "Start to ping all the servers..."
for ip in `cat server.txt|head -n 30`
do
  avg="`ping -t ${count} ${ip}|grep avg|cut -d "=" -f2|cut -d "/" -f2|cut -d "." -f1` ms-${ip}"
  echo "${avg}"
  all+="${avg}\n"
done

echo ""
echo "The rank list:"
echo -e "$all"|grep -v "^$"|sort -k1n|grep -n ""

