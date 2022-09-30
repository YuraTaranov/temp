const { Toggle, Select } = require("enquirer");
const { execSync } = require("child_process");
const { name } = require("./app.json");

(async () => {
  execSync("git init", { stdio: "inherit" });

  execSync(
    "yarn add -D @trivago/prettier-plugin-sort-imports babel-plugin-module-resolver @commitlint/config-conventional @commitlint/cli @types/react-native-vector-icons @types/react-native-snap-carousel @types/uuid @types/validator",
    { stdio: "inherit" }
  );

  execSync(
    "yarn add axios react-native-gesture-handler react-native-reanimated react-native-flipper react-native-bootsplash react-native-modal @react-native-community/async-storage i18next react-i18next react-native-vector-icons @react-navigation/native @react-navigation/native-stack @react-navigation/bottom-tabs react-native-reanimated react-native-screens react-native-safe-area-context react-native-fast-image @react-native-community/checkbox moment react-native-device-info react-native-keyboard-aware-scroll-view react-native-snap-carousel react-native-tab-view form-data uuid @react-native-community/netinfo @react-native-community/datetimepicker validator react-native-dotenv react-native-skeleton-content",
    { stdio: "inherit" }
  );

  execSync("HYGEN_OVERWRITE=1 hygen setup _init", { stdio: "inherit" });

  execSync(`hygen setup _native --appName ${name}`, { stdio: "inherit" });

  const select = await new Select({
    name: "store",
    message: "Select store",
    choices: ["redux toolkit", "none"]
  }).run();

  if (select === "redux toolkit") {
    console.log("Redux Installation...");
    execSync("yarn add -D @types/react-redux", {
      stdio: "inherit"
    });
    execSync("yarn add @reduxjs/toolkit react-redux redux-persist redux-flipper", {
      stdio: "inherit"
    });
  }

  execSync(`hygen setup ${select}`, { stdio: "inherit" });

  execSync("rm -rf __tests__", { stdio: "inherit" });
  execSync("rm -rf _templates/setup", { stdio: "inherit" });

  execSync("npm uninstall enquirer", { stdio: "inherit" });

  console.log("Installation finished!");

  execSync("rm -rf initialize.js", { stdio: "inherit" });
})();
