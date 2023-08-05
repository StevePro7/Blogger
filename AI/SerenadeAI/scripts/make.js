/* Serenade Custom Commands

In this file, you can define your own custom commands with the Serenade API.

For instance, here's a custom automation that opens your terminal and runs a command:



And, here's a Python snippet for creating a test method:

serenade.language("python").snippet(
  "test method <%identifier%>",
  "def test_<%identifier%>(self):<%newline%><%indent%>pass",
  { "identifier": ["underscores"] }
  "method"
);

For more information, check out the Serenade API documentation: https://serenade.ai/docs/api

*/


serenade.global().command("make clean", api => {
  api.focusApplication("terminal");
  api.typeText("make clean");
  api.pressKey("return");
});

serenade.global().command("make build", api => {
  api.focusApplication("terminal");
  api.typeText("make build");
  api.pressKey("return");
});

serenade.global().command("make image", api => {
  api.focusApplication("terminal");
  api.typeText("make image");
  api.pressKey("return");
});
