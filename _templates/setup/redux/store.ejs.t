---
to: src/store.tsx
unless_exists: true
---
import AsyncStorage from '@react-native-async-storage/async-storage';
import {configureStore} from '@reduxjs/toolkit';
import {persistStore, persistReducer} from 'redux-persist';
import {
  // ADD NEW API SLICE
  todosApiSlice,
} from '@api';
import {rootReducer} from './reducers';

const persistConfig = {
  timeout: 10000,
  key: 'root',
  storage: AsyncStorage,
  whitelist: ['global'],
};
const persistedReducer = persistReducer(persistConfig, rootReducer);

export const store = configureStore({
  reducer: persistedReducer,
  devTools: true,
  middleware: getDefaultMiddleware =>
    getDefaultMiddleware({
      serializableCheck: {
        ignoreActions: true,
      },
    }).concat(
      // ADD NEW MIDDLEWARE
      todosApiSlice.middleware,
    ),
});

export type RootState = ReturnType<typeof rootReducer>;
export type AppDispatch = typeof store.dispatch;

export const persistor = persistStore(store);
