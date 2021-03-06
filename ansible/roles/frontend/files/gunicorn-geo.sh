#!/bin/bash
set -e
export ROLLBAR_TOKEN=ab7eb8f58e6e49eb97df24b045b39396
LOGFILE=/home/btl/logs/geo.log
LOGDIR=$(dirname $LOGFILE)
NUM_WORKERS=2
BIND=unix:/home/btl/run/geo.sock
#BIND=0.0.0.0:8000
# user/group to run as
USER=btl
GROUP=btl
cd /home/btl/site/api
source /home/btl/python/bin/activate
test -d $LOGDIR || mkdir -p $LOGDIR
#sorry about the long line, it just adds all the above params
exec gunicorn --workers $NUM_WORKERS --user=$USER --group=$GROUP --log-level=info --log-file=$LOGFILE 2>>$LOGFILE --bind $BIND division:app
