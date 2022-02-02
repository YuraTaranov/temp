---
to: src/reducers/global.ts
unless_exists: true
---
import {Alert} from '@components';
import {call, put, takeLatest} from '@redux-saga/core/effects';
import {all, select} from 'redux-saga/effects';
import {TGlobalState, TSetLangAsync} from '@types';
import {httpGet, httpPost, navigate, errorHandler} from '@services';

const INITIAL = '[global] INITIAL';
const SET_FIRST_OPEN_APP = '[global] SET_FIRST_OPEN_APP';
const SET_TOKEN = '[global] SET_TOKEN';
const SET_LANG = '[global] SET_LANG';
const LOG_OUT = '[global] LOG_OUT',
const RESET_GLOBAL = '[global] RESET_GLOBAL';

type TGlobal = TGlobalState['global'];

const initialState: TGlobal = {
  firstOpenApp: true,
  token: '',
  lang: '',
};

export default (state = initialState, action: any) => {
  switch (action.type) {
    case SET_FIRST_OPEN_APP:
      return Object.assign({}, {...state, firstOpenApp: action.data});
	case SET_TOKEN:
      return Object.assign({}, {...state, token: action.data});
	case SET_LANG:
      return Object.assign({}, {...state, lang: action.data});
    case RESET_GLOBAL:
      return initialState;
    default:
      return state;
  }
};

export const initial = () => ({type: INITIAL});
export const setFirstOpenApp = (data: TGlobal['firstOpenApp']) => ({
  data,
  type: SET_FIRST_OPEN_APP,
});
export const setToken = (data: TGlobal['token']) => ({
  data,
  type: SET_TOKEN,
});
export const setLang = (data: TGlobal['lang']) => ({
  data,
  type: SET_LANG,
});
export const logOut = () => ({type: LOG_OUT});

export const resetGlobal = () => ({
  type: RESET_GLOBAL,
});

export function* watchGlobal() {
  yield takeLatest(INITIAL, initialAsync);
  yield takeLatest(LOG_OUT, logOutAsync);
  yield takeLatest(SET_LANG, setLangAsync);
}

export function* initialAsync() {
  try {
      // yield all([
      // call(getData),
      // call(getData),
      // call(getData),
      // ]);
  } catch (e) {
    // 	errorHandler(e, 'initialAsync error')
  } finally {

  }
}

export function* logOutAsync() {
  yield put(setToken(''))
  console.log('logout');
}

export function* setLangAsync(action: TSetLangAsync) {
  const lang = action.data
  yield i18next.changeLanguage(lang);
  yield put(setLang(lang));
}
