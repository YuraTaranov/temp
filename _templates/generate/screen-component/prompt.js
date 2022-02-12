module.exports = [
  {
    type: "input",
    name: "name",
    message: "Enter component name..."
  },
  {
    type: "select",
    name: "folder",
    message: "Select screen folder...",
    choices: [
      "Onboarding",
      "SignIn",
      "Home"
      //ADD MORE SCREENS
    ]
  }
];
