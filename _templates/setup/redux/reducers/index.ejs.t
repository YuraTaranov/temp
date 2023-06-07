---
to: src/reducers/index.ts
unless_exists: true
---
import {combineReducers} from '@reduxjs/toolkit';
import {
  // ADD NEW API SLICE
  todosApiSlice,
} from '@api';
import {additional} from './additional';
import {global} from './global';

// ADD IMPORT

export const rootReducer = combineReducers({
  global,
  additional,
  [todosApiSlice.reducerPath]: todosApiSlice.reducer,
  // ADD NEW REDUCER
});
