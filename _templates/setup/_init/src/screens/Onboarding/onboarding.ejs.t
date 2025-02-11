---
to: src/screens/Onboarding/Onboarding.tsx
unless_exists: true
---
import React from 'react';
import {View, Text} from '@components';
import {useTranslation, useTheme} from '@hooks';
import styles from './styles';

const Onboarding: React.FC = () => {
  const {t} = useTranslation();
  const {colors} = useTheme();

  return (
    <View style={styles.container}>
      <Text>Welcome Screen</Text>
    </View>
  );
};

export default Onboarding;

