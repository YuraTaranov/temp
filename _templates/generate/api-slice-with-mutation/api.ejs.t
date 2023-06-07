---
inject: true
to: src/services/api/index.ts
before: // ADD NEW API SLICE
---
// <%=h.changeCase.camelCase(name)%>
export * from './<%=h.changeCase.camelCase(name)%>ApiSlice/<%=h.changeCase.camelCase(name)%>ApiSlice';
export * from './<%=h.changeCase.camelCase(name)%>ApiSlice/types';
