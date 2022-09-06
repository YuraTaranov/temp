---
to: src/store.tsx
unless_exists: true
---
import { configureStore } from "@reduxjs/toolkit";
import { persistStore, persistReducer } from "redux-persist";
import AsyncStorage from '@react-native-community/async-storage';
import { rootReducer } from "./reducers";

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
  middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware({
      serializableCheck: {
        ignoreActions: true
      },
    })
});

export const persistor = persistStore(store);
