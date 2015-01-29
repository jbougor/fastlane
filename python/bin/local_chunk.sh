#!/bin/bash
###############################################################
#local_chunk.sh
#Usage   "local_chunk.sh" 
#
#
#       This command will create  remote files on  the server
#       from the properties file for the process
#       section with trailing  "START, PROCESSING,DONE, and FAULT" fields
#       to indicate completion status.
#
#       This file is copied from the source server and executed as the
#       user from the properties file.
#
#       This script is highly dependent on the info gathered from
#       the properties fiile that is transferred over from the source server
#
#       The processing section will do the following:
#
#       The file in the properties file will be processed as a file to
#       be transferred
#       from the local host to the specified server as the specified user
#
#       The directoryname argument will be processed as a directory
#       that contains files that the find command concatenates in to
#       a file   that is then split into 3 files that will be transferred
#       to $server as $user
#
#
cd $(dirname $0)
if [[ -e ./properties.sh ]]
then
  . ./properties.sh
#  . ./functions.sh
else
echo "Please configure $0 with properties.sh " >&2
echo "in the same directory!" >&2
exit 1
fi

#lets start clean
rm -r /tmp/hold_dir > /dev/null 2>&1
rm /tmp/hold_file > /dev/null 2>&1
rm /tmp/parallel_in > /dev/null 2>&1
# Set some defaults
VERSION=1.0.0
USAGE="Usage: local_chunk.sh "

echo $FILE_NAME
echo $DIR_NAME
echo $USER_NAME
echo $SRVR_NAME
echo $LOG_DIR
# create begin file on remote host
#ssh $USER_NAME\@$SRVR_NAME touch $(tstamp).START
#touch $(tstamp).START


# scp file to remote machine
#
#/usr/bin/scp $FILE_NAME $USER_NAME\@$SRVR_NAME:.



#generate file list from directory
cd $(dirname $0)/$DIR_NAME
echo $(pwd)

BIG_LIST=$(find $(pwd) -print)

#COUNT=0

for i in $BIG_LIST
do
echo $i >>$TEMP_FILE
COUNT=$((COUNT+1))
echo $COUNT
done


#COUNT=$((COUNT+1))
#
#SPLIT_VAR=$((COUNT/3))
#echo $SPLIT_VAR
#
#echo $BIG_LIST > $TEMP_FILE

#if [[ -e $TEMP_DIR ]]
#then
#        cd $TEMP_DIR
#        /usr/bin/split -l $SPLIT_VAR $TEMP_FILE new
#else
#        mkdir $TEMP_DIR
#        cd $TEMP_DIR
#        /usr/bin/split -l $SPLIT_VAR $TEMP_FILE new
#fi
        
# create Process file on remote host
#ssh $USER_NAME\@$SRVR_NAME touch $(tstamp).PROCESS
#touch $(tstamp).START

#Start the tar pipe section
#generate the tar pipe commands in an array
#COWNT=1
#for i in $(ls $TEMP_DIR)
#do
#        CMD_LINE[$COWNT]="/bin/tar cvfT - $i | /usr/bin/gzip -c | /usr/bin/ssh -
#o compression=no  $USER_NAME\@$SRVR_NAME \"/usr/bin/gunzip -c | /bin/tar xvf - \
#""
#        echo ${CMD_LINE[COWNT]} >> $PARALLEL_FILE
#COWNT=$((COWNT+1))
#done

#Run parallel command  
#cat $PARALLEL_FILE
#        /home/ICCOHIO/jbougor/bin/parallel -a $PARALLEL_FILE



# create DONE file on remote host
#ssh $USER_NAME\@$SRVR_NAME touch $(tstamp).DONE

