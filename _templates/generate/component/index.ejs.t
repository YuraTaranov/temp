---
to: src/components/<%= folder %>/<%= h.changeCase.pascal(name) %>/index.tsx
---
import React from 'react'
import { useState, useCallback, useMemo, useTranslation } from '@hooks'
import { View, Text, Image, TouchableOpacity } from '@components'
import {connect} from 'react-redux';
import {navigate} from '@services';
import styles from './styles'
import type {TGlobalState} from '@types';

type TProps = {

}

const <%= h.changeCase.pascal(name) %>: React.FC<TProps> = ({}) => {
	const {t} = useTranslation();

	return (
		<View style={styles.container}>

		</View>
	)
}

const mapStateToPros = (state: TGlobalState) => ({
  // data: state.data
});
export default connect(mapStateToPros)(<%= h.changeCase.pascal(name) %>);