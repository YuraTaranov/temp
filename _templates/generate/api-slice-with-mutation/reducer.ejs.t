---
inject: true
to: src/reducers/index.ts
before: // ADD NEW REDUCER
---
  [<%=h.changeCase.camelCase(name)%>ApiSlice.reducerPath]: <%=h.changeCase.camelCase(name)%>ApiSlice.reducer,