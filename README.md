# Get Started

- [Initialization](#Initialization)
- [Splash screen](#Splash-screen)

## Initialization

1. Initialize project

```
npx react-native init YourProjectName
```

2. Install hygen (if you don't have it)

mac

```
brew install hygen
```

linux

```
sudo npm i -g hygen
```

windows

```
npm i -g hygen
```

3. Navigate to your project folder and paste this code

```
git clone --branch rtk-query https://github.com/YuraTaranov/temp.git && cp -rf ./temp/_templates ./ && cp -f ./temp/initialize.js ./ && rm -rf temp && rm -f App.tsx && node ./initialize.js
```

## Splash screen

[Use this library (react-native-bootsplash)](https://github.com/zoontek/react-native-bootsplash)

## Api slice example

You can find api slice example here:

```
./src/services/api/todosApiSliceExample
./src/components/dataview/TodosListExample
```

Also you can generate new api slices with npm scripts (look in package.json)
