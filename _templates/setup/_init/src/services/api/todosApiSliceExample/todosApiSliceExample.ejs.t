---
to: src/services/api/todosApiSliceExample/todosApiSliceExample.ts
unless_exists: true
---
import {API_URL} from '@env';
import {createApi, fetchBaseQuery} from '@reduxjs/toolkit/query/react';
import {TGlobalState} from '@types';
import {ITodo} from './types';

export const todosApiSlice = createApi({
  reducerPath: 'todosApi',
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
  tagTypes: ['Todos'], // used to mark query results with tags and use them to invalidate the cache during mutations
  endpoints: builder => ({
    getTodos: builder.query<ITodo[], void>({
      query: () => '/todos',
      transformResponse: (res: ITodo[]) => res.sort((a: ITodo, b: ITodo) => b.id - a.id), // we can transform the response before receiving it (optional)
      providesTags: ['Todos'],
    }),
    addTodo: builder.mutation<ITodo, ITodo>({
      query: todo => ({
        url: '/todos',
        method: 'POST',
        body: todo,
      }),
      // Updates data in the cache after an addTodo request locally instead of sending a getTodos request
      onQueryStarted: (newTodo, {dispatch, queryFulfilled, getState}) => {
		// Here we can execute some code at the beginning of the addTodo request
        queryFulfilled.then(_data => { 
		  // Here we can execute the code after a successful response from the server
		  // _data - response from server
		  // With the updateQueryData method, we can locally update the state of another reducer (if needed)
          dispatch(
            todosApiSlice.util.updateQueryData('getTodos', undefined, prevTodos => {
              prevTodos.push(newTodo);
            }),
          );
          // or we can store the data with dispatch in a regular separate reducer, like example token
          // dispatch(setToken(_data))
        });
      },
    }),
    updateTodo: builder.mutation<ITodo, ITodo>({
      query: todo => ({
        url: `/todos/${todo.id}`,
        method: 'PATCH',
        body: todo,
      }),
      invalidatesTags: ['Todos'], // used to update the todo list after mutation (getTodos request)
    }),
    deleteTodo: builder.mutation<ITodo, number>({
      query: id => ({
        url: `/todos/${id}`,
        method: 'DELETE',
        body: id,
      }),
      invalidatesTags: ['Todos'],
    }),
  }),
});

export const {useGetTodosQuery, useAddTodoMutation, useUpdateTodoMutation, useDeleteTodoMutation} = todosApiSlice;

// instead of onQueryStarted you can use this approach in your reducer if data is stored in redux

// todosSlice = createSlice({
//   // other code
//   extraReducers: builder => {
// 		builder.addMatcher(todosApiSlice.endpoints.addTodo.matchFulfilled, (state, {payload}) => {
// 			state.todos = {...state.todos, payload};
//   	});
//   },
// });

// If we need to use any of the slice methods outside of the react component, then we can access it by importing directly from a file.

// import {store} from './path/to/store'
// import { todosApiSlice } from './path/to/todosApiSlice';
// const dispatch = store.dispatch
// const state = store.getState();

// send request
// const getTodos = async () => {
//   const response = await dispatch(todosApiSlice.endpoints.getTodos.initiate())
//   return response
// }

// get data from the store
// state.todosApi.queries['getTodos(undefined)'].data

// Example of a combination of several queries
// import {useGetUsersQuery, useGetPostsQuery, useGetProductsQuery} from '@api';

// export const useInitial = () => {
//  const users = useGetUsersQuery();
//  const products = useGetProductsQuery();
//  const posts = useGetPostsQuery();

//  return {users, products, posts};
// };