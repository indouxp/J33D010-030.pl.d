#!/bin/sh
banner "log"

SCRIPT="J33D010-030.pl"
echo ${SCRIPT:?}
expand -t2 ${SCRIPT:?}

cat <<EOT
�e�X�g���e
EOT

for file in case?.sh
do
  echo $file
  sed -n "/cat <<EOT/,/EOT/p" $file | grep -v EOT
done

for run in case?.sh
do
  ./$run
done

cat <<EOT
�e�X�g�X�N���v�g
EOT
for file in case?.sh
do
  echo $file
  expand -t2 $file
done
