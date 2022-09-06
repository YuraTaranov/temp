---
to: src/screens/<%=h.changeCase.pascal(name)%>/<%=h.changeCase.pascal(name)%>.tsx
---
import React from 'react'
import { useEffect, useState, useCallback, useMemo, useTranslation, useRoute } from '@hooks'
import { View, Text, Image, TouchableOpacity } from '@components'
import {navigate} from '@services';
import {useDispatch, useSelector} from 'react-redux';
import {<%= h.changeCase.pascal(name) %>RouteProp} from '@types';
import styles from './styles'

const <%= h.changeCase.pascal(name) %>: React.FC = () => {
	const { t } = useTranslation()
	const dispatch = useDispatch();
    // const data = useSelector(selectData);
	const {params} = useRoute<<%= h.changeCase.pascal(name) %>RouteProp>();

	return (
		<View style={styles.container}>
			<Text>
				<%= h.changeCase.pascal(name) %>Screen
			</Text>
		</View>
	)
}

export default <%= h.changeCase.pascal(name) %>;