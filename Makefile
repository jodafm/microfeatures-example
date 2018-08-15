DESTINATION = "platform=iOS Simulator,name=iPhone 6,OS=11.4"

bootstrap:
	bundle install;
	brew tap tuist/tuist https://github.com/tuist/tuist.git;
	brew install tuist;
generate-project:
	tuist generate;
carthage-fetch:
	carthage update --platform iOS;	
setup-project: generate-project
	bundle exec pod install;
sha-256:
	shasum -a 256 bin/tuistenv;
build-core:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uCore -config Debug clean build
build-ui:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uUI -config Debug clean build
build-testing:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uTesting -config Debug clean build
build-dependencies:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uDependencies -config Debug clean build
build-search:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uSearch -config Debug clean build
build-home:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uHome -config Debug clean build
build-app:
	xcodebuild -workspace uFeatures.xcworkspace -scheme App -config Debug clean build CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO
test-core:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uCore -config Debug clean test -destination $(DESTINATION)
test-ui:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uUI -config Debug clean test -destination $(DESTINATION)
test-testing:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uTesting -config Debug clean test -destination $(DESTINATION)
test-search:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uSearch -config Debug clean test -destination $(DESTINATION)
test-home:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uHome -config Debug clean test -destination $(DESTINATION)
test-app:
	xcodebuild -workspace uFeatures.xcworkspace -scheme App -config Debug clean test -destination $(DESTINATION)