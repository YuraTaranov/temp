---
to: src/AppNavigator/AppNavigator.tsx
unless_exists: true
---
import React from 'react';
import {NavigationContainer} from '@react-navigation/native';
import {createStackNavigator} from '@react-navigation/stack';
import {
  Start,
  // ADD NEW SCREEN
} from '@screens';
import {navigationRef, onStateChange} from '@services';

const RootStack = createStackNavigator();
const AuthStack = createStackNavigator();
const HomeStack = createStackNavigator();

const AuthNavigator: React.FC = () => {
  return (
    <AuthStack.Navigator>
      <AuthStack.Screen name="Start" component={Start} />
    </AuthStack.Navigator>
  );
};

const HomeNavigator: React.FC = () => {
  return (
    <HomeStack.Navigator>
      <HomeStack.Screen name="Start" component={Start} />
    </HomeStack.Navigator>
  );
};

export const AppNavigator: React.FC = () => {
  return (
    <NavigationContainer ref={navigationRef} onStateChange={onStateChange}>
      <RootStack.Navigator screenOptions={{headerShown: false}}>
        {false ? (
          <RootStack.Screen name="HomeNavigator" component={HomeNavigator} />
        ) : (
          <RootStack.Screen name="AuthNavigator" component={AuthNavigator} />
        )}
      </RootStack.Navigator>
    </NavigationContainer>
  );
};
