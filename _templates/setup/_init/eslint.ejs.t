---
to: .eslintrc.js
force: true
---
module.exports = {
  root: true,
  extends: '@react-native-community',
  parser: '@typescript-eslint/parser',
  plugins: ['@typescript-eslint'],
  overrides: [
    {
      files: ['*.ts', '*.tsx', '*.js'],
      rules: {
        '@typescript-eslint/no-shadow': ['error'],
        'no-shadow': 'off',
        'no-undef': 'off',
        'no-unused-vars': 'warn',
        '@typescript-eslint/no-unused-vars': 'warn',
        'no-console': 'warn',
        'react-hooks/exhaustive-deps': 'warn',
        'prettier/prettier': 'off',
        semi: 'off',
        'comma-dangle': 'off',
      },
    },
  ],
};
