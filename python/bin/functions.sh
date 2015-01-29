#!/bin/bash
PRGNM=$(basename $0)
if [[ ! -z ${LOGDIR} ]]
then
  LOGFILE=${LOGDIR}/$(date +%Y%m%d_)${PRGNM}.log
  if [[ ! -d ${LOGDIR} ]]
  then
    mkdir -p ${LOGDIR}
  fi
else
  echo "FAILURE: ${PRGNM}: No log directory defined. Please configure reporting."
 exit 1
fi
function tstamp {
  date +%Y-%m-%d_%H:%M:%S
}
function emit_log {
  ENTRY="$(tstamp):${PRGNM}:${HST}:${LOGNAME}:$$:: $*"
  echo ${ENTRY} >> ${LOGFILE}
  echo ${ENTRY}
}

function check_error {
  if [[ ${RC} == 0 ]]
  then
    return
  else
    MSG=$*
    if [[ ! -z ${ERRORRECIPIENT} ]]
    then
      mailx -s"Error output from ${PRGNM}" ${ERRORRECIPIENT} << EOFAILM
ERROR: ${MSG}
Logfile: ${LOGFILE}
Host: ${HST}
EOFAILM
      exit ${RC}
    else
      emit_log "Failed. Exit code ${RC} ERROR: ${MSG}"
      exit ${RC}
    fi
  fi
}

