---
to: src/App.tsx
unless_exists: true
---
import React from 'react';
import {StatusBar, View} from 'react-native';
import {AppNavigator} from './AppNavigator/AppNavigator';

export const App: React.FC = () => {
  return (
    <>
      <StatusBar backgroundColor={'transparent'} barStyle={'dark-content'} translucent={true} />
      <AppNavigator />
    </>
  );
};
