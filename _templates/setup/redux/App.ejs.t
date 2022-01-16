---
to: src/App.tsx
unless_exists: true
---
import React from 'react';
import {StatusBar} from 'react-native';
import {Provider} from 'react-redux';
import {PersistGate} from 'redux-persist/integration/react';
import {AppNavigator} from './AppNavigator/AppNavigator';
import {store, persistor} from './store';
import {themeLight, ThemeProvider} from '@services';

export const App: React.FC = () => {
  return (
    <Provider store={store}>
      <PersistGate loading={null} persistor={persistor}>
        <ThemeProvider theme={themeLight}>
          <StatusBar backgroundColor={'transparent'} barStyle={'dark-content'} translucent={true} />
          <AppNavigator />
        </ThemeProvider>
      </PersistGate>
    </Provider>
  );
};
