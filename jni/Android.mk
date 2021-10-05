# THANKS for initial guidance:
# https://code.tutsplus.com/tutorials/advanced-android-getting-started-with-the-ndk--mobile-2152
# original location:
# http://mobile.tutsplus.com/tutorials/android/ndk-tutorial/

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)  

LOCAL_LDLIBS := -llog
LOCAL_MODULE := sqlc-native-driver

# This should get passed in, but set it otherwise.
MY_LIBSTEMMER_VERSION ?= 2.1.0

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../sqlite-amalgamation
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../sqlite3-regexp-cached
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../libb64-encode
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../sqlite3-base64
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../search-tokenizers/src
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../search-tokenizers/uthash/src
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../search-tokenizers/snowball/dist/libstemmer_c-$(MY_LIBSTEMMER_VERSION)/include

LOCAL_CFLAGS += -DSQLITE_THREADSAFE=1
LOCAL_CFLAGS += -DSQLITE_DEFAULT_SYNCHRONOUS=3
LOCAL_CFLAGS += -DSQLITE_DEFAULT_MEMSTATUS=0
LOCAL_CFLAGS += -DSQLITE_OMIT_DECLTYPE
LOCAL_CFLAGS += -DSQLITE_OMIT_DEPRECATED
LOCAL_CFLAGS += -DSQLITE_OMIT_PROGRESS_CALLBACK
LOCAL_CFLAGS += -DSQLITE_OMIT_SHARED_CACHE
LOCAL_CFLAGS += -DSQLITE_TEMP_STORE=2
LOCAL_CFLAGS += -DSQLITE_OMIT_LOAD_EXTENSION
LOCAL_CFLAGS += -DSQLITE_ENABLE_FTS3 -DSQLITE_ENABLE_FTS3_PARENTHESIS
LOCAL_CFLAGS += -DSQLITE_ENABLE_FTS4
LOCAL_CFLAGS += -DSQLITE_ENABLE_FTS5
LOCAL_CFLAGS += -DSQLITE_ENABLE_RTREE
LOCAL_CFLAGS += -DSQLITE_ENABLE_JSON1
LOCAL_CFLAGS += -DSQLITE_CORE # for building static extensions

# LOCAL_CFLAGS += -DSQLC_KEEP_ANDROID_LOG

# new stable default page size ref:
# - http://sqlite.org/releaselog/3_12_0.html
# - http://sqlite.org/pgszchng2016.html
LOCAL_CFLAGS += -DSQLITE_DEFAULT_PAGE_SIZE=4096
LOCAL_CFLAGS += -DSQLITE_DEFAULT_CACHE_SIZE=-2000

MY_LOCAL_SRC_FILES := $(wildcard $(LOCAL_PATH)/../search-tokenizers/snowball/dist/libstemmer_c-$(MY_LIBSTEMMER_VERSION)/src_c/*.c)
MY_LOCAL_SRC_FILES += $(wildcard $(LOCAL_PATH)/../search-tokenizers/snowball/dist/libstemmer_c-$(MY_LIBSTEMMER_VERSION)/runtime/*.c)
MY_LOCAL_SRC_FILES += $(LOCAL_PATH)/../search-tokenizers/snowball/dist/libstemmer_c-$(MY_LIBSTEMMER_VERSION)/libstemmer/libstemmer.c
MY_LOCAL_SRC_FILES += $(LOCAL_PATH)/../native/sqlc_all.c

MY_LOCAL_SRC_FILES := $(MY_LOCAL_SRC_FILES:$(LOCAL_PATH)/%=%)

LOCAL_SRC_FILES := $(MY_LOCAL_SRC_FILES)

include $(BUILD_SHARED_LIBRARY)
