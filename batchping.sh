#!/bin/bash
count=4
all=''
echo "Start to ping all the servers..."
for ip in `cat server.txt|head -n 2000`
do
  avg="`ping -t ${count} ${ip}`"
  #echo "${avg}"
  unknown_host=`echo "${avg}"|grep -i avg`
  if [[ -z "${unknown_host}" ]]
  then
      avg="unknown host ${ip}"
      all+="${avg}ms ${ip}\n"
  else
      avg="`echo "${avg}"|grep avg|cut -d "=" -f2|cut -d "/" -f2|cut -d "." -f1`"
#      echo "${avg}"
      all+="${avg}ms ${ip}\n"
  fi

  echo ${avg} ${ip}
done

echo ""
echo "The rank list:"
echo -e "$all"|grep -v "^$"|sort -k1n|grep -n ""
