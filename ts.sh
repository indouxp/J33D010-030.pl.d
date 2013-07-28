#!/bin/sh

main() {
  init
  run1
  init
  run2
}

init() {
  echo "init"
  [ -d test.d ] && chmod -R 777 ./test.d && rm -rf ./test.d

  mkdir test.d
  #touch test.d/test.txt
}

run1() {
	echo "run1"
  chmod a-x test.d
  ls -ld test.d

  ./ts.pl
  echo $?

  ls -ld test.d
  ls -l test.d

}

run2() {
	echo "run2"
  chmod a-rwx test.d
  ls -ld test.d

  ./ts.pl
  echo $?

  ls -ld test.d
  ls -l test.d

}

main
