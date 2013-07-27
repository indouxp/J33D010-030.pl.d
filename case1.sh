#!/bin/sh
# $B@5>o%1!<%9(B

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
      done
    done
  done
done

find ./base -exec ls -1d {} \; > `basename $0`.before
wc -l `basename $0`.before

./ts.pl
echo $?

find ./base -exec ls -1d {} \; > `basename $0`.after
wc -l `basename $0`.after

diff `basename $0`.before `basename $0`.after > `basename $0`.diff


