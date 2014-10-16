VERSION = $(shell defaults read `pwd`/Hammerspoon/Hammerspoon-Info CFBundleVersion)
APPFILE = build/Hammerspoon.app
ZIPFILE = build/Hammerspoon-$(VERSION).zip

$(APPFILE): $(shell find Hammerspoon -type f)
	rm -rf $@
	mkdir -p build
	xcodebuild -workspace Hammerspoon.xcworkspace -scheme Release clean build > build/release-build.log
	cp -R build/Hammerspoon/Build/Products/Release/Hammerspoon.app $@

clean:
	rm -rf build

.PHONY: release clean
