VERSION = 1.0

all: GAEuploader-$(VERSION)-mac.zip

SDK_MAC = google-cloud-sdk-135.0.0-darwin-x86_64.tar.gz

GAEuploader-$(VERSION)-mac.zip: $(SDK_MAC)
	rm -rf staging/linux
	mkdir -p staging/linux/GAEuploader
	git archive master -- README uploader appengine | tar -C staging/linux/GAEuploader -xvf -
	tar -C staging/linux/GAEuploader -xf $(SDK_MAC)
	cd staging/linux && zip -q -r -9 "../../$@" GAEuploader
