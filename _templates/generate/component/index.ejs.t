---
to: src/components/<%= folder %>/<%= h.changeCase.pascal(name) %>/index.tsx
---
import React from 'react'
import { useState, useCallback, useMemo, useTranslation } from '@hooks'
import { View, Text, Image, TouchableOpacity } from '@components'
import {navigate} from '@services';
import styles from './styles'
import {useDispatch, useSelector} from 'react-redux';

type TProps = {

}

const <%= h.changeCase.pascal(name) %>: React.FC<TProps> = ({}) => {
	const {t} = useTranslation();
	const dispatch = useDispatch();
    // const data = useSelector(selectData);

	return (
		<View style={styles.container}>

		</View>
	)
}

export default <%= h.changeCase.pascal(name) %>;