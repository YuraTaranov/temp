---
to: src/screens/Onboarding/Onboarding.tsx
unless_exists: true
---
import React from 'react';
import {useTranslation} from '@hooks';
import {View, Text} from '@components';
import styles from './styles';

type TProps = {};

const Onboarding: React.FC<TProps> = () => {
  const {t} = useTranslation();

  return (
    <View style={styles.container}>
      <Text>
	    Welcome Screen
	  </Text>
    </View>
  );
};

export default Onboarding;
