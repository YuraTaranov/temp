---
inject: true
to: src/ios/Podfile
after: config = use_native_modules!
---
permissions_path = '../node_modules/react-native-permissions/ios'
pod 'Permission-AppTrackingTransparency', :path => "#{permissions_path}/AppTrackingTransparency"