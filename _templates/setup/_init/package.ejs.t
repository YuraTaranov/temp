---
inject: true
to: package.json
after: scripts
skip_if: watchman
---
		"start": "react-native start",
		"android:reverse": "adb reverse tcp:8081 tcp:8081",
		"android": "react-native run-android",
		"ios": "react-native run-ios",
		"g:screen": "hygen generate screen",
		"g:component": "hygen generate component",
		"g:screenComponent": "hygen generate screen-component",
		"g:reducer": "hygen generate reducer",
		"g:helper": "hygen generate helper",
		"yarn:clean": "watchman watch-del-all && rm -rf $TMPDIR/react-native-packager-cache-* && rm -rf $TMPDIR/metro-bundler-cache-* && rm -rf node_modules/ && yarn cache clean && yarn install",
		"android:build": "cd android && ./gradlew assembleRelease && cd .. && open ./android/app/build/outputs/apk/release",
		"android:clean": "cd android/ && ./gradlew clean && cd ..",
		"android:menu": "adb shell input keyevent KEYCODE_MENU",
		"android:reload": "adb shell input text \"RR\"",
		"generateKeystore": "keytool -genkeypair -v -keystore release.keystore -alias release -keyalg RSA -keysize 2048 -validity 10000",
		"getReleaseSHA1": "keytool -list -v -alias release -keystore ./android/app/release.keystore",
		"lint": "eslint . --ext .js,.jsx,.ts,.tsx",
		"test": "jest",
		"build:ios": "react-native bundle --entry-file ./index.js --platform ios --bundle-output ios/main.jsbundle --assets-dest ios --dev=false",