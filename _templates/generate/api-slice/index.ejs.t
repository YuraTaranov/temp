---
inject: true
to: src/services/api/index.ts
after: // ADD NEW API SLICE
---
export * from './<%=h.changeCase.camelCase(name)%>ApiSlice/<%=h.changeCase.camelCase(name)%>ApiSlice';
export * from './<%=h.changeCase.camelCase(name)%>ApiSlice/types';
