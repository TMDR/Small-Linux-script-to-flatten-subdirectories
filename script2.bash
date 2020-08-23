#!/bin/bash
read -p 'give path to FOLDERA : ' fa
read -p 'give path to FOLDERB : ' fb
		find $fa -type f | sort > /tmp/d1.txt
		find $fb -type f | sort > /tmp/d2.txt
		s=`comm -12 /tmp/d1.txt /tmp/d2.txt`

		for filename in `comm -12 /tmp/d1.txt /tmp/d2.txt`; do
		fn=${filename##*/}
		a=`cat $fa/$fn`
		b=`cat $fb/$fn`
		if [ "$a" != "$b" ];then
		echo $fn
		fi;
		done

for foldernamea in $(find $fa -type d)
do
	for foldernameb in $(find $fb -type d)
	do 
		find $foldernamea -type f | sort > /tmp/d1.txt
		find $foldernameb -type f | sort > /tmp/d2.txt
		s=`comm -12 /tmp/d1.txt /tmp/d2.txt`

		for filename in `comm -12 /tmp/d1.txt /tmp/d2.txt`; do
		fn=${filename##*/}
		a=`cat $foldernamea/$fn`
		b=`cat $foldernameb/$fn`
		if [ "$a" != "$b" ];then
		echo $fn
		fi;
		done
	done
done
