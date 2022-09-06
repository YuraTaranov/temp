---
to: src/AppNavigator/AppNavigator.tsx
unless_exists: true
---
import React from 'react';
import {NavigationContainer} from '@react-navigation/native';
import {createNativeStackNavigator} from '@react-navigation/native-stack';
import {
  Onboarding, 
  // ADD NEW SCREEN
} from '@screens';
import {navigationRef, onStateChange} from '@services';
import {useDispatch, useSelector} from 'react-redux';
import {selectGlobal} from '@reducers/globalSlice';
import {AuthNavigator} from './stacks/authNavigator';
import {HomeNavigator} from './stacks/homeNavigator';

const RootStack = createNativeStackNavigator();

const AppNavigator: React.FC = () => {
  const dispatch = useDispatch();
  const {token, firstOpenApp} = useSelector(selectGlobal);

  return (
    <NavigationContainer ref={navigationRef} onStateChange={onStateChange}>
      <RootStack.Navigator screenOptions={{headerShown: false, gestureEnabled: false}}>
        {firstOpenApp ? (
		 <RootStack.Screen
              name={'Onboarding'}
              component={Onboarding}
              options={{headerShown: false}}
		  />
		) :
		 token ? (
          <RootStack.Screen name="HomeNavigator" component={HomeNavigator} />
        ) : (
          <RootStack.Screen name="AuthNavigator" component={AuthNavigator} />
        )}
      </RootStack.Navigator>
    </NavigationContainer>
  );
};

export default AppNavigator;
