---
to: src/types/reducers.ts
unless_exists: true
---
export enum EDataLoadingStatus {
	 IDLE = 'idle',
	 LOADING = 'loading',
	 FULFILLED = 'fulfilled',
	 REJECTED = 'rejected',
}

export type TGlobalState = {
	global: {
	  token: string;
	  loading: boolean;
	  firstOpenApp: boolean;
	  currentRouteName: string;
	  language: string;
	},
}