#!/usr/bin/python
###############################################################
#pull_chunk.py.sh
#Usage   "pull_chunk.py -f FILE  -d DIR -u USER -s SERV
#
#
#       This command will pull  remote files from $server for the process
#       section with trailing  "START, PROCWESSING,DONE, and FAULT" fields 
#       to indicate completion status.
#
#       The processing section will do the following:
#       
#       The $FILE argument will be processed as a file to be transferred
#       from the $SERV remote host to the local host server as $user
#
#       The $DIR argument will be processed as a remote directory 
#       that contains files that the find command concatenates in to 
#       a file   that is then split into 3 files that will be transferred 
#       from $server as $user
#
#
#import functions for use

import argparse
import os
from os import listdir
from os.path import isfile
import cmd
import logging
import datetime
import time
from datetime import date
import paramiko

logging.basicConfig(filename='pull_chunk.py.log',level=logging.DEBUG)
logging.debug('This message should go to the log file')
logging.info('I like cookies')
logging.warning('but, I love apples')

#READ in the command line information and set it to variable names for use
 
parser = argparse.ArgumentParser(description='This is a script. ')
parser.add_argument('-f','--file', help='metadata file name',required=True)
parser.add_argument('-d','--dir',help='Directory where files exist', required=True)
parser.add_argument('-u','--user',help='user acct to use', required=True)
parser.add_argument('-s','--server',help='server to retrieve from ', required=True)
args = parser.parse_args()
WORK_DIR = os.getcwd()
FILE_NAME = args.file
DIR_NAME = args.dir
USER_ACCT = args.user
SRVR_NAME = args.server
WORK_SCRIPT=('/home/ICCOHIO/jbougor/dev/local_chunk.sh')
WORK_PROP=('/home/ICCOHIO/jbougor/dev/prop_local.sh')
WORK_PARALLEL=('/home/ICCOHIO/jbougor/bin/parallel')
PARALLEL_IN=('/tmp/parallel_in')
## show values ##
print ("Metadata file: %s" % FILE_NAME )
print ("target directory: %s" % DIR_NAME )
print ("User account: %s" % USER_ACCT )
print ("Target server: %s" % SRVR_NAME )
print ("Current Directory: %s" % WORK_DIR )

#Get metadata file from remote host
ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect(SRVR_NAME, username=USER_ACCT, password='')
ftp = ssh.open_sftp() 
ftp.get(FILE_NAME, '/tmp/hold/meta_hold') 
ftp.put(WORK_SCRIPT,'/home/ICCOHIO/jbougor/work_dir/local_chunk.sh')
ftp.put(WORK_PROP,'/home/ICCOHIO/jbougor/work_dir/properties.sh')
ftp.put(WORK_PARALLEL,'/home/ICCOHIO/jbougor/work_dir/parallel')
ftp.put(PARALLEL_IN,'/tmp/parallel_in')
ftp.close()



START = "START-"
now = str(datetime.datetime.now())
logging.info('creating START File')
open(START + now  , "w")

# execute remote script to gather data and bring it back







PROCESS = "PROCESS-"
now = str(datetime.datetime.now())
logging.info('creating PROCESS File')
open(PROCESS + now , "w")

DONE = "DONE-"
now = str(datetime.datetime.now())
logging.info('creating DONE File')
open(DONE + now  , "w")


FAULT = "FAULT-"
now = str(datetime.datetime.now())
logging.info('creating FAULT File')
open(FAULT + now  , "w")

