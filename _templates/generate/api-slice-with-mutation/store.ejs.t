---
inject: true
to: src/store.tsx
after: // ADD NEW API SLICE
---
  <%=h.changeCase.camelCase(name)%>ApiSlice,