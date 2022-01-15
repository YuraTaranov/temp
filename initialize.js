const { Toggle, Select } = require("enquirer");
const { execSync } = require("child_process");
const { name } = require("./app.json");

(async () => {
  execSync("git init", { stdio: "inherit" });

  execSync(
    "npm i --save-dev @trivago/prettier-plugin-sort-imports @types/lodash babel-plugin-module-resolver @commitlint/config-conventional @commitlint/cli @types/react-native-vector-icons",
    { stdio: "inherit" }
  );

  execSync(
    "npm i -s axios lodash react-native-modal @react-native-async-storage/async-storage i18next react-i18next react-native-vector-icons @react-navigation/native @react-navigation/stack @react-navigation/elements react-native-reanimated react-native-gesture-handler react-native-screens react-native-safe-area-context react-native-fast-image",
    { stdio: "inherit" }
  );

  execSync("HYGEN_OVERWRITE=1 hygen setup _init", { stdio: "inherit" });

  execSync(`hygen setup _native --appName ${name}`, { stdio: "inherit" });

  const select = await new Select({
    name: "store",
    message: "Select store",
    choices: ["redux", "none"]
  }).run();

  if (select === "redux") {
    console.log("Redux Installation...");
    execSync("npm i --save-dev redux-devtools-extension @types/react-redux", {
      stdio: "inherit"
    });
    execSync("npm i -s redux redux-saga react-redux redux-persist", {
      stdio: "inherit"
    });
  }

  execSync(`hygen setup ${select}`, { stdio: "inherit" });

  const needSentry = await new Toggle({
    message: "Do you need sentry?",
    enabled: "Yes",
    disabled: "No"
  }).run();

  console.log(needSentry, "TOGGLE");

  if (needSentry) {
    execSync("npm install --save @sentry/react-native", { stdio: "inherit" });
    execSync("hygen setup sentry", { stdio: "inherit" });
  }

  console.log("Installation finished!");
})();
