---
to: src/store.tsx
unless_exists: true
---
import {createStore, applyMiddleware} from 'redux';
import {composeWithDevTools} from 'redux-devtools-extension';
import createSagaMiddleware from 'redux-saga';
import reducers from './reducers';
import rootSaga from './reducers/sagas';
import {persistStore, persistReducer} from 'redux-persist';
import AsyncStorage from '@react-native-community/async-storage';
import reduxFlipper from 'redux-flipper';

const sagaMiddleware = createSagaMiddleware();

const middlewares = [sagaMiddleware];

const persistConfig = {
  timeout: 10000,
  key: 'root',
  storage: AsyncStorage,
  whitelist: ['global'],
};

if (__DEV__) {
  const createFlipperDebugger = require('redux-flipper').default;
  middlewares.push(createFlipperDebugger());
}

const persistedReducer = persistReducer(persistConfig, reducers);

const storeCreation = () => {
  const enhancer = composeWithDevTools(applyMiddleware(...middlewares));
  const store = createStore(persistedReducer, enhancer);
  const persistor = persistStore(store);

  sagaMiddleware.run(rootSaga);
  return {store, persistor};
};

export default storeCreation();
