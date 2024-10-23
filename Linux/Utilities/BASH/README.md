BASH Debugging
23-Oct-2024

VS Code
Extensions

Bash Debug
Install

create BASH script
e.g.
app.sh
chmod +x app.sh

Create .vscode directory and
launch.json

{
    "version": "0.2.0",
    "configurations": [
        {
            "type": "bashdb",
            "request": "launch",
            "name": "Bash-Debug (simplest configuration)",
            "program": "${file}"
        }
    ]
}

Now can F5 in app.sh BASH script to debug step thru!