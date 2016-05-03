RunE2EAppOutput=$(./RunE2EApp.sh $1 $2 $3 $4 $5 2> errFile)
ERR=$(<errFile)

echo $RunE2EAppOutput
echo $ERR

if [[ "$RunE2EAppOutput" == *"disengage"* ]]; then
exit 1
fi

if [[ "$RunE2EAppOutput" == *"exit 1"* ]]; then
echo "fail exit";
fi

if [[ "$RunE2EAppOutput" == *"Script threw an uncaught"* ]]; then
exit 1
fi