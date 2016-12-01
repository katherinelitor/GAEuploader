SDK_MAC = google-cloud-sdk-135.0.0-darwin-x86_64.tar.gz
SDK_MAC_URL = https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/$(SDK_MAC)

all: $(SDK_MAC) GAEuploader
	echo $(SDK_MAC)

GAEuploader:
	cp -r 
