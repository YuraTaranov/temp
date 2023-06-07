---
to: src/services/api/todosApiSliceExample/types.ts
unless_exists: true
---
export interface ITodo {
  id: number;
  title: string;
  completed: boolean;
}
