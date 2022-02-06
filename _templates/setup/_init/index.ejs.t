---
to: index.js
force: true
---
import {AppRegistry, LogBox} from 'react-native';
import {enableScreens} from 'react-native-screens';
import './src/services/i18n';  // need for React i18n initialization
import {name} from './app.json';
import {App} from './src/App';

LogBox.ignoreAllLogs();

enableScreens();
AppRegistry.registerComponent(name, () => App);
