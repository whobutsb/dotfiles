# React Native

Notes, reminders, and info

## Components

Libraries to use: 

- [NativeBase.io](https://docs.nativebase.io);

## Audio/Media Libraries

- [react-native-audio-toolkit](https://github.com/futurice/react-native-audio-toolkit)

Handles audio playback - BEST ONE
- [react-native-video](https://github.com/react-native-community/react-native-video)

Control of the System Music Control and iOS Notification Center

https://github.com/tanguyantoine/react-native-music-control

## Navigation 

- [React Navigation](https://reactnavigation.org/docs)

- [Getting Started with React Navigation](https://hackernoon.com/getting-started-with-react-navigation-the-navigation-solution-for-react-native-ea3f4bd786a4)

## XCode iOS Security Settings 

Use these to setup HTTP transport and white listing urls to be used with the app.

  https://stackoverflow.com/questions/30731785/how-do-i-load-an-http-url-with-app-transport-security-enabled-in-ios-9

- Info.plist > App Transport Security Settings > Exception Domains
- Create new: Set to `Dictionary` add the domain `cloudfront.net`
- Add `Boolean` property: `NSExceptionAllowsInsecureHTTPLoads`: `YES`
- Add `Boolean` property: `NSIncludeSubdomains`: `YES`

- Add domains for `localhost`, `ensemble.dev`, `etc`

## Persistence

- https://github.com/rt2zz/redux-persist

## Network

Thunk/Axios Info - https://github.com/gaearon/redux-thunk/issues/146

## React Native Libraries

- [Linking Libraries](https://facebook.github.io/react-native/docs/linking-libraries-ios.html)

- [How to uninstall libraries](https://stackoverflow.com/a/42381023/135881)

