# Get Started

- [Initialization](#Initialization)
- [Splash screen](#Splash-screen)

## Initialization

1. Initialize project

```
npx react-native init YourProjectName
```

2. Install hygen (if you don't have it)

(on mac)

```
brew tap jondot/tap
brew install hygen
```

(on linux)

```
sudo npm i -g hygen
```

(on windows)

```
npm i -g hygen
```

3. Navigate to your project folder and paste this code

```
git clone --branch v2 https://github.com/YuraTaranov/temp.git && cp -rf ./temp/_templates ./ && cp -f ./temp/initialize.js ./ && rm -rf temp && rm -f App.tsx && node ./initialize.js
```

## Splash screen

[Use this library (react-native-bootsplash)](https://github.com/zoontek/react-native-bootsplash)
