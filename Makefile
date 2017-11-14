VERSION = 1.2-beta

all: mac linux windows
mac: GAEuploader-$(VERSION)-mac.zip
linux: GAEuploader-$(VERSION)-linux.zip
windows: GAEuploader-$(VERSION)-windows.zip

# You can download the Google Cloud SDK for Mac OS X at https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-137.0.0-darwin-x86_64.tar.gz
# for Linux at https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-137.0.0-linux-x86_64.tar.gz
# for Windows at https://dl.google.com/dl/cloudsdk/channels/rapid/GoogleCloudSDKInstaller.exe

SDK_VERSION = 179.0.0
SDK_MAC = google-cloud-sdk-$(SDK_VERSION)-darwin-x86_64.tar.gz
SDK_LINUX = google-cloud-sdk-$(SDK_VERSION)-linux-x86_64.tar.gz
SDK_WINDOWS = google-cloud-sdk

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

GAEuploader-$(VERSION)-windows.zip: $(SDK_WINDOWS)
	rm -rf staging/windows
	mkdir -p staging/windows/GAEuploader
	git archive master -- README LICENSE uploader appengine win.cmd | tar -C staging/windows/GAEuploader -xvf -
	cp -a $(SDK_WINDOWS) staging/windows/GAEuploader/
	cd staging/windows && zip -q -r -9 "../../$@" GAEuploader
	rm -rf staging/