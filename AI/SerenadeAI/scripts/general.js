serenade.global().command("clear", api => {
  api.focusApplication("terminal");
  api.typeText("clear");
  api.pressKey("return");
});

serenade.global().command("exit", api => {
  api.focusApplication("terminal");
  api.typeText("exit");
  api.pressKey("return");
});

