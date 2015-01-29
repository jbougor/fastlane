#Local variables
FILE_COPIES=10
DIR_DEPTH=2
DIR_FIELD=abcd
PARALLEL_FILE=/tmp/parallel_in
TEMP_FILE=/tmp/hold_file
TEMP_DIR=/tmp/hold_dir
DIR_NAME=/home/ICCOHIO/jbougor/xml_files/
USER_NAME=jbougor
SRVR_NAME=oh01vlbi045.icc.local



# The top-level BigInsights logging directory; "hadoop" should be there
BILOGDIR=/home/ICCOHIO/jbougor/dev/out
# A log directory we will write progress into
LOGDIR=${BILOGDIR}/push_chunk.log
# A hive database for putting reporting information in
#REPORTINGDB=usage_reporting
# The name of our system
HST=$(hostname)
# A place to store data files to be loaded
SCRATCHDIR=/tmp/bougor_hold
# Who to notify when things go wrong
ERRORRECIPIENT='jbougor@icct.com'
# Email sending account for report
SENDEREMAIL=donotreplyReport@${HST}
# Email recipient for report
EMAILDEST='jbougor@icct.com'
# Oldest files we will keep
CLEANUPDAYS2KEEP=3
# HDFS location for staging information
#URLOC=/user/biadmin/usage_reporting
# HDFS location of external table for auth summary staging
#AUTHSTAGELOC=${URLOC}/stage_auth.csv
# HDFS location of external table for job summary staging
#STAGEJOBLOC=${URLOC}/stage_usage.csv
# Single-quote for use in HEREDOCs
#SQT="'"

