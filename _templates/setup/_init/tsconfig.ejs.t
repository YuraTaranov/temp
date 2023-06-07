---
inject: true
to: tsconfig.json
before: extends
skip_if: assets
---
  "compilerOptions": {
    "baseUrl": "./",
    "paths": {
      "@assets": ["src/assets/index"],
      "@components": ["src/components/index"],
      "@constants": ["src/constants/index"],
      "@helpers": ["src/helpers/index"],
      "@hooks": ["src/hooks/index"],
      "@reducers/*": ["src/reducers/*"],
      "@screens": ["src/screens/index"],
      "@services": ["src/services/index"],
      "@types": ["src/types/index"],
	  "@api": ["src/services/api/index"]
    },
	"typeRoots": ["src/types"],
    "skipLibCheck": true
  },