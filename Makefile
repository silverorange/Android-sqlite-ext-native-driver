
all: ndkbuild

init:
	git submodule update --init --recursive

# Gluegen is no longer used to maintain bindings.
# See https://github.com/OutSystems/Android-sqlite-native-driver/pull/1/
#regen:
#	java -cp gluegentools/antlr.jar:gluegentools/gluegen.jar com.jogamp.gluegen.GlueGen -I. -Ecom.jogamp.gluegen.JavaEmitter -CSQLiteNative.cfg native/sqlc.h
#	sed -i.orig 's/^import/\/\/import/' java/io/liteglue/SQLiteNative.java

# NOTE: adding v (verbose) flag for the beginning stage:

MY_LIBSTEMMER_VERSION := $(shell cd search-tokenizers/snowball && grep '^SNOWBALL_VERSION = [0-9.]\+' GNUmakefile | grep -o '[0-9.]\+')

snowball_src:
	cd search-tokenizers/snowball && \
	make dist_libstemmer_c && \
	cd dist && \
	tar -xzvf libstemmer_c*.tar.gz

ndkbuild: snowball_src
	echo "Using libstemmer-"$(MY_LIBSTEMMER_VERSION)
	rm -rf lib libs
	ndk-build MY_LIBSTEMMER_VERSION=$(MY_LIBSTEMMER_VERSION)
	zip sqlite-native-driver-libs.zip libs/*/*
	mv libs lib
	jar cf sqlite-native-driver.jar lib

clean:
	rm -rf obj lib libs sqlite-native-driver.jar *.zip

