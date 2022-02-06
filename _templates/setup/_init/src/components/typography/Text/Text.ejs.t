---
to: src/components/typography/Text/index.tsx
unless_exists: true
---
import React from 'react';
import {Text as RNText, TextProps} from 'react-native';
import styles from './styles';

const Text: React.FC<TextProps> = ({children, style, ...otherProps}) => {
  
  return (
    <RNText style={[styles.container, style]} {...otherProps}>
      {children}
    </RNText>
  );
};

export default Text;
