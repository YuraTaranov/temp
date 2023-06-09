---
to: src/reducers/global.ts
unless_exists: true
---
import {createSlice} from '@reduxjs/toolkit';
import {TGlobalState} from '@types';

type TInitialState = TGlobalState['global'];

const initialState: TInitialState = {
  token: '',
  firstOpenApp: true,
  language: '',
};

const globalSlice = createSlice({
  name: '@@global',
  initialState,
  reducers: {
    setToken: (state, action) => {
      state.token = action.payload;
    },
    setFirstOpenApp: (state, action) => {
      state.firstOpenApp = action.payload;
    },
    setLanguage: (state, action) => {
      state.language = action.payload;
    },
    resetGlobal: () => initialState,
  },
});

// actions
export const {setToken, setFirstOpenApp, setLanguage, resetGlobal} = globalSlice.actions;

// reducer
export const global = globalSlice.reducer;

// selectors
export const selectGlobal = (state: TGlobalState) => state.global;
