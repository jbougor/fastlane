#!/bin/bash
###############################################################
#creeate_files.sh
#Usage   "create_file.sh"
#
#
#
#
cd $(dirname $0)
if [[ -e ./prop_create.sh ]] && [[ -e ./functions.sh ]]
then
  . ./prop_create.sh
  . ./functions.sh
else
echo "Please configure $0 with prop_create.sh and functions.sh" >&2
echo "in the same directory!" >&2
exit 1
fi

echo $DIR_NAME
echo $FILE_COPIES
echo $USER_NAME
echo $TEMP_FILE
mkdir $TEMP_DIR
cd $DIR_NAME
echo $(pwd)
BIG_LIST=$(find . -print)

COUNT=0

for i in $BIG_LIST
do
echo $i >>$TEMP_FILE
COUNT=$((COUNT+1))
#echo $COUNT  $i
done

COUNTME=1
COUNTTHEM=1
while  [ $FILE_COPIES -ge $COUNTTHEM ]
do
for i in $BIG_LIST
	do
	#echo $COUNTME
	echo $i
	cp $i $TEMP_DIR/$i$COUNTME
	done
COUNTTHEM=$((COUNTTHEM+1))
COUNTME=$((COUNTME+1)) 
echo $COUNTTHEM
echo $COUNTME
done
