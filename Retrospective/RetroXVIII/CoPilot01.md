CoPilot 01
22-Sep-2026

https://chatgpt.com/c/6aabf907-121c-83eb-81e0-4b708005d1eb

#### STRUCTURE
.github structure is the physical implementation
```
.github/
├── agents/
├── instructions/
├── prompts/
└── skills/
```

#### FOLDERS

| Artifact                    | Purpose                                           |
| --------------------------- | ------------------------------------------------- |
| **Instructions**            | Rules Copilot should follow                       |
| **Agents**                  | Define a specialized engineering persona/workflow |
| **Skills**                  | Reusable capabilities/workflows                   |
| **Prompts**                 | User-invoked tasks                                |
| **Examples/reference docs** | Knowledge Copilot can consult                     |
| **Tests/tooling**           | Prove the rules are actually being followed       |


#### LAYERS
.github = 4x layers

                 YOUR ENGINEERING KNOWLEDGE
                           │
          ┌────────────────┼────────────────┐
          │                │                │
          ▼                ▼                ▼
     INSTRUCTIONS       SKILLS           EXAMPLES
       "WHAT"           "HOW"            "SHOW ME"
          │                │                │
          └────────────────┼────────────────┘
                           ▼
                         AGENTS
                    "ORCHESTRATE"
                           │
                           ▼
                       COPILOT

#### MAPPING

| Your engineering knowledge      | Copilot artifact   |
| ------------------------------- | ------------------ |
| Architectural invariant         | Instruction        |
| Coding convention               | Instruction        |
| Testing methodology             | Instruction/Skill  |
| Feature implementation workflow | Skill              |
| Code review methodology         | Agent              |
| Architecture review             | Agent              |
| Reusable task                   | Prompt             |
| Canonical implementation        | Reference/example  |
| "Why do we do this?"            | Reference/ADR      |
| Machine-enforceable rule        | CI/static analysis |


#### EXERCISE
```
REAL CODE
↓
REVERSE ENGINEER
↓
IDENTIFY YOUR ACTUAL ENGINEERING RULES
↓
CLASSIFY:
├── instruction
├── skill
├── agent
├── prompt
└── reference example
↓
GENERATE .github FILES
↓
USE COPILOT TO IMPLEMENT A NEW FEATURE
↓
COMPARE GENERATED CODE WITH YOUR ORIGINAL
↓
REFINE THE MD FILES
```

#### ENFORCEMENT

```
LEVEL 1
────────────────────────────
Markdown instructions

"Controllers MUST NOT contain
business logic."
          ↓
Copilot interprets it


LEVEL 2
────────────────────────────
Agent / Skill workflow

"Before implementing a controller,
inspect the application-service boundary."
          ↓
Copilot follows a prescribed process


LEVEL 3
────────────────────────────
Executable enforcement

Architecture tests
Static analysis
Lint rules
Unit tests
Integration tests
CI
          ↓
Machine actually rejects violations
```

#### CONVERT  
I know how to build Production Software  
to  
I can express [this] how to build Production Software so an agent can build Production Software


#### TAXONOMY
GitHub now has a fairly explicit taxonomy for these things:

NB: Taxonomy = structured way of classifying and organizing things into categories

```
.github/
│
├── copilot-instructions.md       ← repo-wide instructions
│
├── instructions/
│   └── *.instructions.md         ← path-specific instructions
│
├── prompts/
│   └── *.prompt.md               ← reusable prompts
│
├── agents/
│   └── *.agent.md / *.md         ← specialized agents
│
└── skills/
    └── <skill>/
        └── SKILL.md              ← reusable capabilities
```

#### EXPERIMENT

1. Which parts are schema/configuration
2. Which parts are free-form instructions
3. How Copilot is likely interpreting them
4. How I'd reverse-engineer your existing production code into that exact format
5. Where your company should use an instruction vs skill vs agent vs prompt
6. Which rules should not be left to Copilot at all and should become executable tests/CI


#### AGENTS
Specialized operating mode for CoPilot: instructions + expertise / context + tool restrictions + particular workflow

GitHub describes custom agents as specialist personas with their own instructions, tool restrictions and context.

#### DISTICTION
Instructions = rules of the codebase that CoPilot should follow  
"Always do X"

Agent = specialist that I want you to be for this task  
"Act as X"

Skill = Here is a reusable procedure for accomplishing this kind of work  
"How to do X"

Prompt = Do this particular thing  
"Do X right now"


#### SYSTEM
.github directory = the engineering knowledge system

The reverse engineering process is simply how you discover what should go into it

Learn how to compile senior engineering judgement into the customization primitives that Copilot already understands


#### DISTINCTION
Instructions shape coding behavior  
Skills and prompts encapsulate workflows  
Agents define who the AI acts as and what tools it can use  


#### CATEGORIES

##### 1 Instructions
Engineering rules = constraints [e.g. coding standards]

##### 2 Skills
Repeatable engineering procedures = capabilities / workflows

##### 3 Agents
Specialized roles = orchestrators [with tool configurations]

##### 4 Prompts
Repeatable task requests


#### CLASSIFICATION
```
Observed behavior
        │
        ▼
Is this an invariant?
        │
        ├── Yes → Instruction
        │
        ▼
Is this a repeatable procedure?
        │
        ├── Yes → Skill
        │
        ▼
Is this a specialist responsibility?
        │
        ├── Yes → Agent
        │
        ▼
Is this a reusable task request?
        │
        ├── Yes → Prompt
        │
        ▼
Example/reference only
```
