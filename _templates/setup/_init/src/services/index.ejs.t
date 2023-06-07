---
to: src/services/index.ts
unless_exists: true
---
export {navigationRef, onStateChange, navigate, push, pop, popToTop, goBack, reset} from './route';
export {default as i18n} from './i18n';
