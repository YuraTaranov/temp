---
to: src/screens/Home/Home.tsx
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
import {HomeRouteProp} from '@types';
import styles from './styles';

const Home: React.FC = () => {
  const {t} = useTranslation();
  const {params} = useRoute<HomeRouteProp>();
  const dispatch = useAppDispatch();
  // const data = useAppSelector(selectData);
  const {colors} = useTheme();

  return (
    <View style={styles.container}>
      <Text>HomeScreen</Text>
    </View>
  );
};

export default Home;
