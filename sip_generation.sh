#!/bin/bash
echo -n "Введите номер отсчета для номера > "
read text
first=$text
echo -n "Введите номер конца счета пула  > "
read text2
second=$text2
diap=`eval echo {$text..$text2}`
c=`for i in $diap; do echo $i ; done`
for i in $c
do
for a in $(pwgen)
do
cat  << EOF
[$i]
type=friend
host=dynamic
insecure=invite
username=$i
secret=$a
context=outcoling
disallow=all
allow=alaw
EOF
echo
done
done >> "$(date +"%d.%m.%Y-%H:%M:%S").log"
