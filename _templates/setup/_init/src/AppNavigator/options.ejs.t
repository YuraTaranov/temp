---
to: src/AppNavigator/options.ts
unless_exists: true
---
import styles from './styles';
import {colors} from '@constants';
import {StackNavigationOptions} from '@react-navigation/stack';

export const defaultStackOptions: StackNavigationOptions = {
  headerBackTitleVisible: false,
  headerStyle: styles.headerStyle,
  headerTintColor: colors.white_FFFFFF,
  headerTitleAlign: 'center',
  headerTitleStyle: styles.headerTitleStyle,
  headerLeftContainerStyle: styles.headerLeftContainerStyle,
  headerRightContainerStyle: styles.headerRightContainerStyle,
  cardStyle: styles.cardStyle,
};
