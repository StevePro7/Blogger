#!/bin/bash

echo "hello"

HOST="localhost"
DATA="<database>"
USER="<user>"
PASS="<pass>"

QUERY_FILE=$1
START_DATE=$2
END_DATE=$3
BUSINESS=$4
PRODUCT=$5
GROUPBY=%6

export PGPASSWORD=$PASS

psql -h $HOST -U $USER -d $DATA		\
	-v start_date="'$START_DATE'" 	\
	-v start_date="'$START_DATE'"	\
	-v end_date="'$END_DATE'"		\
	-v business_unit="'$BUSINESS'"	\
	-v product="'$PRODUCT'"			\
	-v group_by="'$GROUPBY'"		\
	-f $QUERY_FILE

unset PGPASSWORD

echo "-end-"
