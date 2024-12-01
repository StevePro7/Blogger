BASH PostgreSQL
01-Dev-2024

01.
QUERY="SELECT * FROM <table>"
psql -h $HOST -U $USER -d $DATA -c "$QUERY"


02.
SQL_FILE="query.sql"
psql -h $HOST -U $USER -d $DATA -f $SQL_FILE


03.
SQL_FILE=query.sql
QUERY=$(cat SQL_FILE)
psql -h $HOST -U $USER -d $DATA -c "$QUERY"


04.
SQL_FILE="query.sql"
TIMEFRAME=$1
psql -h $HOST -U $USER -d $DATA -v timeframe="'$TIMEFRAME'" -f $SQL_FILE