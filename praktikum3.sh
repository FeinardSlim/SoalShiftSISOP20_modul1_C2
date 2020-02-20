#!/bin/bash
#crontab-e 05 6/8 * * 0-5 praktikum3.sh >> wget.log
iter=0
while [[ $iter -ne 28 ]]
do
  sort_name="pdkt_Kusuma"
  i=1
  c="${sort_name}_${i}"
  if [[ -e $c || -L $c ]]
    then
      while [[ -e $c || -L $c ]] ;
        do
          let  i++;
          c="${sort_name}_${i}"
        done
      name=pdkt_Kusuma_$i
  else
    name=pdkt_Kusuma_1
  fi
  echo "TEST"
  wget -O $name https://loremflickr.com/320/240/cat -o temp.log
  let iteration++
  grep -r "Location" temp.log >> wget.log
  let iter++
  echo "$name" >> name.log
done
rm temp.log
