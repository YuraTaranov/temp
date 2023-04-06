---
to: src/AppNavigator/options.ts
unless_exists: true
---
import {NativeStackNavigationOptions} from '@react-navigation/native-stack';
import {colors} from '@constants';
import styles from './styles';

export const defaultStackOptions: NativeStackNavigationOptions = {
  headerBackTitleVisible: false,
  headerStyle: styles.headerStyle,
  headerTintColor: colors.white_FFFFFF,
  headerTitleAlign: 'center',
  headerTitleStyle: styles.headerTitleStyle,
};

