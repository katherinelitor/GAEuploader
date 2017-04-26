VERSION = 1.0-beta

all: GAEuploader-$(VERSION)-mac.zip GAEuploader-$(VERSION)-linux.zip

# You can download the Google Cloud SDK for Mac OS X at https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-137.0.0-darwin-x86_64.tar.gz
# for Linux at https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-137.0.0-linux-x86_64.tar.gz

SDK_MAC = google-cloud-sdk-145.0.0-darwin-x86_64.tar.gz
SDK_LINUX = google-cloud-sdk-145.0.0-linux-x86_64.tar.gz

GAEuploader-$(VERSION)-mac.zip: $(SDK_MAC)
	rm -rf staging/mac
	mkdir -p staging/mac/GAEuploader
	git archive master -- README LICENSE uploader appengine | tar -C staging/mac/GAEuploader -xvf -
	tar -C staging/mac/GAEuploader -xf $(SDK_MAC)
	cd staging/mac && zip -q -r -9 "../../$@" GAEuploader
	rm -rf staging/

GAEuploader-$(VERSION)-linux.zip: $(SDK_LINUX)
	rm -rf staging/linux
	mkdir -p staging/linux/GAEuploader
	git archive master -- README LICENSE uploader appengine | tar -C staging/linux/GAEuploader -xvf -
	tar -C staging/linux/GAEuploader -xf $(SDK_LINUX)
	cd staging/linux && zip -q -r -9 "../../$@" GAEuploader
	rm -rf staging/
