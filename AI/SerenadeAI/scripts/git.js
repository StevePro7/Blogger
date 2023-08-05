/* Common git Commands
*/

serenade.global().command("git branch", api => {
  api.focusApplication("terminal");
  api.typeText("git branch");
  api.pressKey("return");
});

serenade.global().command("git pull", api => {
  api.focusApplication("terminal");
  api.typeText("git pull");
  api.pressKey("return");
});

serenade.global().command("git push", api => {
  api.focusApplication("terminal");
  api.typeText("git push");
  api.pressKey("return");
});

serenade.global().command("git status", api => {
  api.focusApplication("terminal");
  api.typeText("git status");
  api.pressKey("return");
});
