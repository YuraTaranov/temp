---
to: src/types/reducers.ts
unless_exists: true
---
export type TGlobalState = {
	global: {
	  firstOpenApp: boolean;
	  token: string;
   	  lang: string;
	},
}