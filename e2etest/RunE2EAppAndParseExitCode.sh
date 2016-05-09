RunE2EAppOutput=$(./RunE2EApp.sh $1 $2 $3 $4 $5 2> errFile)
ERR=$(<errFile)

echo $RunE2EAppOutput
echo $ERR

if [[ "$RunE2EAppOutput" == *"disengage"* ]]; then
echo disengage
exit 1
fi

if [[ "$RunE2EAppOutput" == *"Specified target process is invalid"* ]]; then
echo Specified target process is invalid
exit 1
fi

if [[ "$RunE2EAppOutput" == *"Script threw an uncaught"* ]]; then
echo Script threw an uncaught
exit 1
fi