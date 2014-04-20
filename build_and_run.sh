LOVE_ANDROID_PATH=~/projects/opensource/love-android-sdl2

#build game package
sh ./build.sh $LOVE_ANDROID_PATH

#package apk package and run on android device
sh ./package.sh $LOVE_ANDROID_PATH
