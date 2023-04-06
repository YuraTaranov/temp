---
to: src/services/http/services/auth/types.ts
unless_exists: true
---
import {IFormatResponse} from '@types';

export interface ILoginRequest {
  phoneNumber: string;
  password: number;
}

export interface ILoginResponse extends IFormatResponse {
  data: {};
}

