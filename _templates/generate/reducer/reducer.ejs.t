---
to: src/reducers/<%=h.changeCase.camelCase(name)%>.ts
---
import {takeLatest, put, call, select} from 'redux-saga/effects';
import {httpGet, httpPost, navigate, errorHandler} from '@services';
import {urls} from '@constants';
// import { Service } from '@httpServices'
import {TGlobalState, IGet<%=h.changeCase.pascal(name)%>, ISet<%=h.changeCase.pascal(name)%>, IAction} from '@types';

type TData = TGlobalState['data'];

const GET_<%=h.changeCase.constant(name)%> = '[<%=h.changeCase.camelCase(name)%>] GET_<%=h.changeCase.constant(name)%>';
const SET_<%=h.changeCase.constant(name)%> = '[<%=h.changeCase.camelCase(name)%>] SET_<%=h.changeCase.constant(name)%>';

const RESET_<%=h.changeCase.constant(name)%> = '[<%=h.changeCase.camelCase(name)%>] RESET_<%=h.changeCase.constant(name)%>';

const initialstate: TData = {
	data: [],
};

export default (state = initialstate, action: any) => {
  switch (action.type) {
    case SET_<%=h.changeCase.constant(name)%>:
      return Object.assign({}, {...state, data: action.data});
    case RESET_<%=h.changeCase.constant(name)%>:
      return initialstate;
    default:
      return state;
  }
};

export const get<%=h.changeCase.pascal(name)%>: () => IGet<%=h.changeCase.pascal(name)%> = () => ({type: GET_<%=h.changeCase.constant(name)%>});
export const set<%=h.changeCase.pascal(name)%>: (data: ISet<%=h.changeCase.pascal(name)%>['data']) => ISet<%=h.changeCase.pascal(name)%> = (data) => ({data, type: SET_<%=h.changeCase.constant(name)%>});

export const reset<%=h.changeCase.pascal(name)%> = () => ({type: RESET_<%=h.changeCase.constant(name)%>});

export function* watch<%=h.changeCase.pascal(name)%>() {
  yield takeLatest(GET_<%=h.changeCase.constant(name)%>, get<%=h.changeCase.pascal(name)%>Async);
}

export function* get<%=h.changeCase.pascal(name)%>Async(action: IAction) {
  // const state: TGlobalState = yield select(state => state)
  try {
    // const {data}: IData[] = yield call(() => Service.method(args));
    // if (data.data.length) {
      // yield put(set<%=h.changeCase.pascal(name)%>(data.data));
      // navigate('Route');
    // }
  } catch (e) {
	errorHandler(e, 'get<%=h.changeCase.pascal(name)%>Async')
  } finally {
	  
  }
}
