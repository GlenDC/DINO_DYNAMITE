cd $1
ant debug && \
    adb -d install -r bin/love_android_sdl2-debug.apk && \
    adb -d shell am start -n com.fishingcactus.dinodynamite/.DinoDynamiteActivity
