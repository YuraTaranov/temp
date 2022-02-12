---
to: src/components/index.ts
unless_exists: true
---
export {
  ActivityIndicator,
  Alert,
  FlatList,
  SectionList,
  Keyboard,
  Linking,
  PermissionsAndroid,
  Platform,
  RefreshControl,
  SafeAreaView,
  ScrollView,
  Share,
  StatusBar,
  Switch,
  TouchableHighlight,
  TouchableOpacity,
  TouchableWithoutFeedback,
  ImageBackground,
  View,
} from 'react-native';

// MODULES
export {default as Modal} from 'react-native-modal';
export {default as Image} from 'react-native-fast-image';

// BEHAVIOR

// BUTTONS

// CONTROL

// DATAVIEW

// INPUTS

// LAYOUT
export {KeyboardAvoidingView} from './layout/KeyboardAvoidingView/KeyboardAvoidingView';

// MODAL

// NAVIGATION

// TYPOGRAPHY
export {Icon} from './typography/Icon/Icon';
export {default as Text} from './typography/Text';
export {default as TextInput} from './typography/TextInput';
