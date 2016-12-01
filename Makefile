VERSION = 1.0

all: GAEuploader-$(VERSION)-mac.zip

# You can download the Google Cloud SDK for Mac OS X at https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-135.0.0-darwin-x86_64.tar.gz

SDK_MAC = google-cloud-sdk-135.0.0-darwin-x86_64.tar.gz

GAEuploader-$(VERSION)-mac.zip: $(SDK_MAC)
	rm -rf staging/mac
	mkdir -p staging/mac/GAEuploader
	git archive master -- README uploader appengine | tar -C staging/mac/GAEuploader -xvf -
	tar -C staging/mac/GAEuploader -xf $(SDK_MAC)
	cd staging/mac && zip -q -r -9 "../../$@" GAEuploader
	rm -rf staging/
