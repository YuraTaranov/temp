---
to: src/helpers/capitalize.ts
unless_exists: true
---
export const capitalize = (str: string): string =>
  str.slice(0, 1).toLocaleUpperCase() + str.slice(1).toLocaleLowerCase();
