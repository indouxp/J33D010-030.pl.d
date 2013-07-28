#!/bin/sh
# 権限により削除できないディレクトリがある

chmod -R a+x ./base
rm -rf ./base

for base in DB listener AP
do
  for yyyy in "2012"
  do
    for mm in `awk 'BEGIN{for (i = 12; i <= 12; i++) {printf("%02d\n", i);}}'`
    do
      for dd in `awk 'BEGIN{for (i = 1; i <= 31; i++) {printf("%02d\n", i);}}'`
      do
        mkdir -p ./base/$base/$yyyy$mm$dd
        for file in \
        `awk 'BEGIN{srand();for(i = 1; i <= int(rand()*5)+1; i++) {printf("%1d\n", i)}}'`
        do
          touch ./base/$base/$yyyy$mm$dd/$file.txt
        done
      done
    done
  done
  for yyyy in "2013"
  do
    for mm in `awk 'BEGIN{for (i = 1; i <= 2; i++) {printf("%02d\n", i);}}'`
    do
      for dd in `awk 'BEGIN{for (i = 1; i <= 31; i++) {printf("%02d\n", i);}}'`
      do
        mkdir -p ./base/$base/$yyyy$mm$dd
        for file in \
        `awk 'BEGIN{srand();for(i = 1; i <= int(rand()*5)+1; i++) {printf("%1d\n", i)}}'`
        do
          touch ./base/$base/$yyyy$mm$dd/$file.txt
        done
        if [ $yyyy -eq 2013 -a $mm -eq 1 -a $dd -eq 1 ]; then
          ls -l ./base/$base/$yyyy$mm$dd
          chmod a-x ./base/$base/$yyyy$mm$dd
          ls -ld ./base/$base/$yyyy$mm$dd
        fi
      done
    done
  done
done

find ./base -exec ls -1d {} \; > `basename $0`.before
wc -l `basename $0`.before

./J33D010-030.pl
echo $?

find ./base -type d -exec chmod a+x {} \;

find ./base -exec ls -1d {} \; > `basename $0`.after
wc -l `basename $0`.after

diff `basename $0`.before `basename $0`.after > `basename $0`.diff


