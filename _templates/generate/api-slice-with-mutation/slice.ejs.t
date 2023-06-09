---
to: src/services/api/<%=h.changeCase.camelCase(name)%>ApiSlice/<%=h.changeCase.camelCase(name)%>ApiSlice.ts
---
import {API_URL} from '@env';
import {createApi, fetchBaseQuery} from '@reduxjs/toolkit/query/react';
import {TGlobalState} from '@types';
import {I<%=h.changeCase.pascal(name)%>} from './types';

export const <%=h.changeCase.camelCase(name)%>ApiSlice = createApi({
  reducerPath: '<%=h.changeCase.camelCase(name)%>Api',
  baseQuery: fetchBaseQuery({
    baseUrl: API_URL,
    prepareHeaders: (headers, {getState}) => {
      const token = (getState() as TGlobalState).global.token;
      if (token) {
        headers.set('Authorization', `Bearer ${token}`);
      }
      return headers;
    },
  }),
  tagTypes: ['<%=h.changeCase.pascal(name)%>'],
  endpoints: builder => ({
    get<%=h.changeCase.pascal(name)%>: builder.query<I<%=h.changeCase.pascal(name)%>, void>({
      query: () => '/<%=h.changeCase.camelCase(name)%>',
      providesTags: ['<%=h.changeCase.pascal(name)%>'],
    }),
    add<%=h.changeCase.pascal(name)%>: builder.mutation<I<%=h.changeCase.pascal(name)%>, I<%=h.changeCase.pascal(name)%>>({
      query: payload => ({
        url: '/<%=h.changeCase.camelCase(name)%>',
        method: 'POST',
        body: payload,
      }),
      onQueryStarted: (payload, {getState, dispatch, queryFulfilled}) => {
        queryFulfilled.then(response => {});
      },
      // invalidatesTags: ['<%=h.changeCase.pascal(name)%>'],
    }),
  }),
});

export const {useGet<%=h.changeCase.pascal(name)%>Query, useAdd<%=h.changeCase.pascal(name)%>Mutation} = <%=h.changeCase.camelCase(name)%>ApiSlice;
