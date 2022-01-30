---
to: src/types/http.ts
unless_exists: true
---
export type TGenerateOptions = {
  method: 'POST' | 'GET' | 'PUT' | 'DELETE';
  url: string;
  data?: any;
  params?: any;
};

export interface IFormatResponse {
  data: any;
  status: number;
  statusText: string;
};