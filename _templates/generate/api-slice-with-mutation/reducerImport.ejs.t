---
inject: true
to: src/reducers/index.ts
after: // ADD NEW API SLICE
---
  <%=h.changeCase.camelCase(name)%>ApiSlice,