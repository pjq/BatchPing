Ping all the servers address 
==========
Put your servers address in the server.txt, and add it line by line

How to run the shell
==========
```
chmod +x batchping.sh
./batchping.sh
```
Then you can choose the fastest server.



```
#!/bin/bash
count=2
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
```
```
Jianqings-MBP:ytvpn pjq$ ./batchping.sh 
Start to ping all the servers...
266 ms-jp1.flyhide.com
197 ms-jp2.flyhide.com
158 ms-jp3.flyhide.com
468 ms-us1.flyhide.com
457 ms-us2.flyhide.com
265 ms-us3.flyhide.com
328 ms-us4.flyhide.com
315 ms-us5.flyhide.com
135 ms-sg1.flyhide.com
140 ms-sg2.flyhide.com
120 ms-tw1.flyhide.com
115 ms-hk1.flyhide.com
113 ms-hk2.flyhide.com
395 ms-uk1.flyhide.com

The rank list:
1:113 ms-hk2.flyhide.com
2:115 ms-hk1.flyhide.com
3:120 ms-tw1.flyhide.com
4:135 ms-sg1.flyhide.com
5:140 ms-sg2.flyhide.com
6:158 ms-jp3.flyhide.com
7:197 ms-jp2.flyhide.com
8:265 ms-us3.flyhide.com
9:266 ms-jp1.flyhide.com
10:315 ms-us5.flyhide.com
11:328 ms-us4.flyhide.com
12:395 ms-uk1.flyhide.com
13:457 ms-us2.flyhide.com
14:468 ms-us1.flyhide.com
```
