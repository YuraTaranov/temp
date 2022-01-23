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

export const theme = {
  dark: false,
  colors: {
    primary: '', // The primary color of the app used to tint various elements. Usually you'll want to use your brand color for this.
    background: '', // The color of various backgrounds, such as background color for the screens.
    card: '', // The background color of card-like elements, such as headers, tab bars etc.
    text: '', // The text color of various elements.
    // border: colors.RED, // The color of borders, e.g. header border, tab bar border etc.
  },
};
