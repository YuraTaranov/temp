---
to: src/reducers/index.ts
unless_exists: true
---
import {todosSlice} from '@api';
import {combineReducers} from '@reduxjs/toolkit';
import {additional} from './additional';
import {global} from './global';

// ADD IMPORT

export const rootReducer = combineReducers({
  global,
  additional,
  [todosSlice.reducerPath]: todosSlice.reducer,
  // ADD NEW REDUCER
});
