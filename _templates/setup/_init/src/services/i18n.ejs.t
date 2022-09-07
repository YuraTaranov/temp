---
to: src/services/i18n.ts
unless_exists: true
---
import {initReactI18next} from 'react-i18next';
import i18n from 'i18next';
import {Languages} from '@constants';

const en = require('./localization/en.json');

const defaultLanguage = Languages.EN;

export default i18n.use(initReactI18next).init({
  resources: {
    [Languages.EN]: {translation: en},
  },
  lng: defaultLanguage,
  fallbackLng: Languages.EN,
  compatibilityJSON: 'v2',
  react: {
    nsMode: 'default',
  },
  interpolation: {
    escapeValue: false, // react already safes from xss
  },
  nsSeparator: false,
  keySeparator: '.',
  debug: true, // disable if don't need logs
});
