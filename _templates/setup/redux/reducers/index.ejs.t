---
to: src/reducers/index.ts
unless_exists: true
---
import {combineReducers} from '@reduxjs/toolkit';
import {additional} from './additional';
import {global} from './global';

// ADD IMPORT

export const rootReducer = combineReducers({
  global,
  additional,
  // ADD NEW REDUCER
});
