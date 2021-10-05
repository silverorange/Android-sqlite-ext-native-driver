# Includes deprecated armeabi platform:
# APP_ABI := all
APP_ABI := armeabi-v7a x86 x86_64 arm64-v8a

# Explicit setting ref: https://developer.android.com/ndk/guides/stable_apis
# Mike: I bumped this from 14 to 21 as that is the minimum SDK we target.
# See also https://github.com/OutSystems/Android-sqlite-native-driver/pull/1/files#r530635884
APP_PLATFORM := android-21

# APP_DEBUG := true