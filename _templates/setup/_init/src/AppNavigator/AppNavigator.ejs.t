---
to: src/AppNavigator/AppNavigator.tsx
unless_exists: true
---
import React from 'react';
import {NavigationContainer} from '@react-navigation/native';
import {createNativeStackNavigator} from '@react-navigation/native-stack';
import {
  Onboarding, // ADD NEW SCREEN
} from '@screens';
import {navigationRef, onStateChange} from '@services';
import {connect} from 'react-redux';
import {TGlobalState} from '@types';
import {AuthNavigator} from './stacks/authNavigator';
import {HomeNavigator} from './stacks/homeNavigator';

type TProps = {
  global: TGlobalState['global'];
};

const RootStack = createNativeStackNavigator();

const AppNavigator: React.FC<TProps> = ({global}) => {
  return (
    <NavigationContainer ref={navigationRef} onStateChange={onStateChange}>
      <RootStack.Navigator screenOptions={{headerShown: false, gestureEnabled: false}}>
        {global.firstOpenApp ? (
		 <RootStack.Screen
              name={'Onboarding'}
              component={Onboarding}
              options={{headerShown: false}}
		  />
		) :
		 global.token ? (
          <RootStack.Screen name="HomeNavigator" component={HomeNavigator} />
        ) : (
          <RootStack.Screen name="AuthNavigator" component={AuthNavigator} />
        )}
      </RootStack.Navigator>
    </NavigationContainer>
  );
};

const mapStateToProps = (state: TGlobalState) => ({
  global: state.global,
});

export default connect(mapStateToProps)(AppNavigator);
