RunE2EAppOutput=$(./RunE2EApp.sh $1 $2 $3 $4 $5 2>&1 >/dev/null)

echo $RunE2EAppOutput

if [[ "$RunE2EAppOutput" == *"disengage"* ]]; then
echo "fail";
exit 1
fi

if [[ "$RunE2EAppOutput" == *"exit 1"* ]]; then
echo "fail exit";
exit 1
fi

if [[ "$RunE2EAppOutput" == *"Script threw an uncaught"* ]]; then
echo "fail";
exit 1
fi
