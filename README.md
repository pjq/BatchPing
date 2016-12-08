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
```
```
Jianqings-MBP:ytvpn pjq$ ./batchping.sh 
Start to ping all the servers...
The rank list:
1:unknown host jp3.flyhide.comms jp3.flyhide.com
2:unknown host jp3.jumpko.comms jp3.jumpko.com
3:unknown host p1.jp3.flyhide.comms p1.jp3.flyhide.com
4:unknown host p1.jp3.jumpko.comms p1.jp3.jumpko.com
5:unknown host p1.sg2.flyhide.comms p1.sg2.flyhide.com
6:unknown host p1.sg2.jumpko.comms p1.sg2.jumpko.com
7:unknown host p1.us1.jumpko.comms p1.us1.jumpko.com
8:unknown host p1.us2.flyhide.comms p1.us2.flyhide.com
9:unknown host p1.us2.jumpko.comms p1.us2.jumpko.com
10:unknown host p1.us4.flyhide.comms p1.us4.flyhide.com
11:unknown host p1.us4.jumpko.comms p1.us4.jumpko.com
12:unknown host p2.us6.flyhide.comms p2.us6.flyhide.com
13:unknown host p2.us6.jumpko.comms p2.us6.jumpko.com
14:unknown host p4.hk1.flyhide.comms p4.hk1.flyhide.com
15:unknown host p4.hk1.jumpko.comms p4.hk1.jumpko.com
16:unknown host p4.hk2.flyhide.comms p4.hk2.flyhide.com
17:unknown host p4.hk3.flyhide.comms p4.hk3.flyhide.com
18:unknown host p4.hk3.jumpko.comms p4.hk3.jumpko.com
19:unknown host p4.sg1.flyhide.comms p4.sg1.flyhide.com
20:unknown host p4.sg1.jumpko.comms p4.sg1.jumpko.com
21:unknown host p4.uk1.flyhide.comms p4.uk1.flyhide.com
22:unknown host p4.uk1.jumpko.comms p4.uk1.jumpko.com
23:unknown host p4.us2.flyhide.comms p4.us2.flyhide.com
24:unknown host p4.us3.flyhide.comms p4.us3.flyhide.com
25:unknown host sg2.flyhide.comms sg2.flyhide.com
26:unknown host sg2.jumpko.comms sg2.jumpko.com
27:unknown host us1.jumpko.comms us1.jumpko.com
28:unknown host us2.flyhide.comms us2.flyhide.com
29:unknown host us2.jumpko.comms us2.jumpko.com
30:unknown host us4.flyhide.comms us4.flyhide.com
31:unknown host us4.jumpko.comms us4.jumpko.com
32:63ms p1.sg1.flyhide.com
33:64ms p1.sg1.jumpko.com
34:68ms sg1.jumpko.com
35:72ms p2.sg2.jumpko.com
36:73ms p2.sg1.jumpko.com
37:85ms p2.sg1.flyhide.com
38:93ms sg1.flyhide.com
39:94ms p4.sg2.flyhide.com
40:98ms p1.hk3.flyhide.com
41:101ms hk2.flyhide.com
42:101ms p1.hk2.flyhide.com
43:102ms p2.hk1.jumpko.com
44:102ms p2.hk3.jumpko.com
45:104ms p1.hk1.flyhide.com
46:104ms p2.hk2.jumpko.com
47:105ms p1.hk3.jumpko.com
48:106ms hk1.jumpko.com
49:106ms hk2.jumpko.com
50:106ms p1.hk1.jumpko.com
51:106ms p4.sg2.jumpko.com
52:108ms p1.hk2.jumpko.com
53:109ms p2.sg2.flyhide.com
54:117ms hk1.flyhide.com
55:129ms p2.hk2.flyhide.com
56:131ms p2.tw1.jumpko.com
57:132ms p1.tw1.flyhide.com
58:134ms p1.jp2.jumpko.com
59:134ms p4.jp2.jumpko.com
60:136ms jp2.flyhide.com
61:137ms p1.tw1.jumpko.com
62:141ms p2.jp2.flyhide.com
63:142ms p2.jp2.jumpko.com
64:143ms p2.tw1.flyhide.com
65:144ms p1.jp2.flyhide.com
66:145ms jp2.jumpko.com
67:145ms tw1.jumpko.com
68:150ms p2.jp3.flyhide.com
69:150ms p2.jp3.jumpko.com
70:151ms p2.jp1.jumpko.com
71:152ms jp1.jumpko.com
72:152ms p2.jp4.jumpko.com
73:158ms p1.jp1.flyhide.com
74:159ms p1.jp4.flyhide.com
75:160ms p2.jp4.flyhide.com
76:161ms p1.jp1.jumpko.com
77:163ms p2.hk1.flyhide.com
78:164ms p1.jp4.jumpko.com
79:165ms p4.hk2.jumpko.com
80:174ms jp1.flyhide.com
81:179ms p4.jp1.flyhide.com
82:180ms p4.tw1.flyhide.com
83:184ms p2.jp1.flyhide.com
84:184ms p4.jp1.jumpko.com
85:184ms p4.tw1.jumpko.com
86:187ms p2.hk3.flyhide.com
87:190ms p4.jp4.flyhide.com
88:193ms tw1.flyhide.com
89:198ms p4.jp4.jumpko.com
90:202ms p4.jp3.jumpko.com
91:205ms p4.jp2.flyhide.com
92:207ms p4.jp3.flyhide.com
93:236ms p1.us3.jumpko.com
94:237ms p2.us3.flyhide.com
95:239ms p2.us5.flyhide.com
96:242ms p2.us4.flyhide.com
97:243ms p4.us4.jumpko.com
98:248ms p1.us6.flyhide.com
99:251ms p2.us1.flyhide.com
100:251ms us5.flyhide.com
101:252ms p1.us5.flyhide.com
102:254ms p2.us5.jumpko.com
103:255ms us1.flyhide.com
104:257ms p1.us6.jumpko.com
105:257ms p2.us4.jumpko.com
106:258ms p4.us1.jumpko.com
107:259ms p4.us3.jumpko.com
108:261ms p4.us4.flyhide.com
109:265ms p4.us2.jumpko.com
110:271ms p2.us2.jumpko.com
111:271ms p4.us6.jumpko.com
112:272ms p1.us3.flyhide.com
113:273ms p2.us2.flyhide.com
114:273ms p4.us5.flyhide.com
115:276ms p4.us1.flyhide.com
116:276ms p4.us6.flyhide.com
117:278ms us3.jumpko.com
118:279ms p2.us1.jumpko.com
119:281ms p1.us1.flyhide.com
120:285ms p2.us3.jumpko.com
121:290ms p1.us5.jumpko.com
122:308ms uk1.flyhide.com
123:310ms p4.us5.jumpko.com
124:314ms us3.flyhide.com
125:322ms p1.uk1.flyhide.com
126:328ms p2.uk1.jumpko.com
127:353ms uk1.jumpko.com
128:356ms p1.uk1.jumpko.com
129:358ms p2.uk1.flyhide.com
130:368ms us5.jumpko.com```
