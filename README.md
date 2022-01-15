# Get Started

- [Initialization](#Initialization)
- [Splash screen](#Splash-screen)

## Initialization

1. Initialize project

```
npx react-native init YourProjectName --template react-native-template-typescript
```

2. Install hygen (if you don't have it)

```
brew install hygen
```

3. Navigate to your project folder and paste this code

```
git clone --branch v1 git@github.com:YuraTaranov/temp.git && cp -rf ./temp/_templates ./ && cp -rf ./temp/src ./ && cp -f ./temp/initialize.js ./ && rm -rf temp && rm -f App.tsx && yarn add enquirer && node ./initialize.js
```

If you have problems with git permissions try with https

```
git clone --branch v1 https://github.com/YuraTaranov/temp.git && cp -rf ./temp/_templates ./ && cp -rf ./temp/src ./ && cp -f ./temp/initialize.js ./ && rm -rf temp && rm -f App.tsx && yarn add enquirer && node ./initialize.js
```

## Splash screen

[Use this library (react-native-bootsplash)](https://github.com/zoontek/react-native-bootsplash)
