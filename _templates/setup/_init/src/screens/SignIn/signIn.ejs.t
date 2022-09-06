---
to: src/screens/SignIn/SignIn.tsx
unless_exists: true
---
import React from 'react'
import { useEffect, useState, useCallback, useMemo, useTranslation, useRoute } from '@hooks'
import { View, Text, Image, TouchableOpacity } from '@components'
import {navigate} from '@services';
import {useDispatch, useSelector} from 'react-redux';
import styles from './styles'
import { SignInRouteProp } from '@types';

const SignIn: React.FC = () => {
	const { t } = useTranslation()
	const dispatch = useDispatch();
    // const data = useSelector(selectData);
	const {params} = useRoute<SignInRouteProp>();

	return (
	<View style={styles.container}>
		<Text>
			SignInScreen
		</Text>
	</View>
	)
}

export default SignIn;