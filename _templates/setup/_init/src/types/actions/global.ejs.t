---
to: src/types/actions/global.ts
unless_exists: true
---
import {Languages} from '@constants';

export type TSetLangAsync = {
	type: string;
	data: Languages;
}