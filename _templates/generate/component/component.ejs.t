---
to: src/components/<%= folder %>/<%= h.changeCase.pascal(name) %>/<%= h.changeCase.pascal(name) %>.tsx
---
import React from 'react';
import {View, Text, Image, TouchableOpacity} from '@components';
import {useState, useCallback, useMemo, useTranslation, useAppDispatch, useAppSelector, useTheme} from '@hooks';
import {navigate} from '@services';
import styles from './styles';

type TProps = {};

const <%= h.changeCase.pascal(name) %>: React.FC<TProps> = ({}) => {
  const {t} = useTranslation();
  const dispatch = useAppDispatch();
  // const data = useAppSelector(selectData);
  const {colors} = useTheme();

  return (
    <View style={styles.container}>

    </View>
  );
};

export default <%= h.changeCase.pascal(name) %>;