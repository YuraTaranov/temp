---
to: src/reducers/index.ts
unless_exists: true
---
import { combineReducers } from '@reduxjs/toolkit';
import {global} from './globalSlice'
// ADD IMPORT

export const rootReducer = combineReducers({
	global,
    // ADD NEW REDUCER
});