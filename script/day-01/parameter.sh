#!/bin/bash
test (){
   echo $*
   echo $@
   echo "-----------\$@---------"
   for n1 in "$@"
   do echo $n1
   done
   echo "-----------\$*---------"
   for n2 in "$*"
   do echo $n2
   done
}
test 11 22 33 44
