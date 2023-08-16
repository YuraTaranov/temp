---
to: src/helpers/httpErrorHandler.ts
unless_exists: true
---
export const errorHandler = (error: any, method?: string) => {
  __DEV__ && console.log('--- REQUEST ERROR', method || 'Pass the method', error);
  const message = error.data?.message || 'error message empty';
  const errors = error?.data?.errors || [];

  let resultString = '';

  if (errors.length) {
    resultString = `${message}\n${errors.join('\n')}`;
  } else {
    resultString = message;
  }

  __DEV__ && console.warn(resultString);
};
