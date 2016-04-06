#!/bin/sh

cd `dirname $0`
echo $1
export DEVICE_ARG=
export DEVICE_CMD_ARG=$1

# Check if Simulator is running
if pgrep "Simulator" > /dev/null
then
killall "Simulator"
echo "Waiting to kill simulator..."
fi

sleep 5

# Get the sim list with the UUIDs
OUTPUT="$(xcrun simctl list)"
# Parse out the UUIDs and saves them to file
echo $OUTPUT | awk -F "[()]" '{ for (i=2; i<NF; i+=2) print $i }' | grep '^[-A-Z0-9]*$' > output.txt
# Iterate through file and reset sim
echo "Resetting Simulator..."
for UUID in `awk '{ print $1 }' output.txt`
do
xcrun simctl erase $UUID
done

if [ "$DEVICE_CMD_ARG" == "iPad2Sim" ]; then
echo Using iPad 2 Simulator
export DEVICE_ARG=iPad\ 2\ \(9.1\)
fi

if [ "$DEVICE_CMD_ARG" == "iPadSimAir" ]; then
echo Using iPad Air Simulator
export DEVICE_ARG=iPad\ Air\ \(9.1\)
fi

if [ "$DEVICE_CMD_ARG" == "iPadSimAir2" ]; then
echo Using iPad Air 2 Simulator
export DEVICE_ARG=iPad\ Air\ 2\ \(9.1\)
fi

if [ "$DEVICE_CMD_ARG" == "iPadSimPro" ]; then
echo Using iPad Pro Simulator
export DEVICE_ARG=iPad\ Pro\ \(9.1\)
fi

if [ "$DEVICE_CMD_ARG" == "iPadSimRetina" ]; then
echo Using iPad Retina Simulator
export DEVICE_ARG=iPad\ Retina\ \(9.1\)
fi

if [ "$DEVICE_CMD_ARG" == "iPhoneSim4s" ]; then
echo Using iPhone 4s Simulator
export DEVICE_ARG=iPhone\ 4s\ \(9.1\)
fi

if [ "$DEVICE_CMD_ARG" == "iPhoneSim5" ]; then
echo Using iPhone 5 Simulator
export DEVICE_ARG=iPhone\ 5\ \(9.1\)
fi

if [ "$DEVICE_CMD_ARG" == "iPhoneSim5s" ]; then
echo Using iPhone 5s Simulator
export DEVICE_ARG=iPhone\ 5s\ \(9.1\)
fi

if [ "$DEVICE_CMD_ARG" == "iPhoneSim6" ]; then
echo Using iPhone 6 Simulator
export DEVICE_ARG=iPhone\ 6\ \(9.1\)
fi

if [ "$DEVICE_CMD_ARG" == "iPhoneSim6Plus" ]; then
echo Using iPhone 6 Plus Simulator
export DEVICE_ARG=iPhone\ 6\ Plus\ \(9.1\)
fi

if [ "$DEVICE_CMD_ARG" == "iPhoneSim6s" ]; then
echo Using iPhone 6s Simulator
export DEVICE_ARG=iPhone\ 6s\ \(9.1\)
fi

if [ "$DEVICE_CMD_ARG" == "iPhoneSim6sWatch" ]; then
echo Using iPhone 6s Simulator + Apple Watch
export DEVICE_ARG=iPhone\ 6s\ \(9.1\)\ +\ Apple\ Watch\ -\ 38mm\ \(2.0\)
fi

if [ "$DEVICE_CMD_ARG" == "iPhoneSim6sPlus" ]; then
echo Using iPhone 6s Plus Simulator
export DEVICE_ARG=iPhone\ 6s\ \(9.1\)
fi

if [ "$DEVICE_CMD_ARG" == "iPhoneSim6sPlusWatch" ]; then
echo Using iPhone 6s Plus Simulator + Apple Watch
export DEVICE_ARG=iPhone\ 6s\ Plus\ \(9.1\)\ +\ Apple\ Watch\ -\ 42mm\ \(2.0\)

echo $DEVICE_ARG
fi
if [ "$DEVICE_ARG" == "" ]
then
echo Unsupported device: "$0"
exit 1
fi
instruments -w "$DEVICE_ARG"

echo "waiting for simulator ...."
sleep 60
