---
to: src/App.tsx
unless_exists: true
---
import React from 'react';
import {StatusBar, View} from 'react-native';
import {AppNavigator} from './AppNavigator/AppNavigator';
import {themeLight, ThemeProvider} from '@services';

export const App: React.FC = () => {
  return (
    <ThemeProvider theme={themeLight}>
      <StatusBar backgroundColor={'transparent'} barStyle={'dark-content'} translucent={true} />
      <AppNavigator />
    </ThemeProvider>
  );
};
