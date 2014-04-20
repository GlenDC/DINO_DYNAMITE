SCRIPTS=${0%/*}

#build game package
sh $SCRIPTS/build.sh $1

#package apk package and run on android device
sh $SCRIPTS/package.sh $1
