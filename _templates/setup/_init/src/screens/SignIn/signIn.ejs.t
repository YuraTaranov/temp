---
to: src/screens/SignIn/SignIn.tsx
unless_exists: true
---
import React from 'react';
import {View, Text, Image, TouchableOpacity} from '@components';
import {
  useEffect,
  useState,
  useCallback,
  useMemo,
  useTranslation,
  useRoute,
  useAppDispatch,
  useAppSelector,
  useTheme,
} from '@hooks';
import {navigate} from '@services';
import {SignInRouteProp} from '@types';
import styles from './styles';

const SignIn: React.FC = () => {
  const {t} = useTranslation();
  const {params} = useRoute<SignInRouteProp>();
  const dispatch = useAppDispatch();
  // const data = useAppSelector(selectData);
  const {colors} = useTheme();

  return (
    <View style={styles.container}>
      <Text>SignInScreen</Text>
    </View>
  );
};

export default SignIn;
