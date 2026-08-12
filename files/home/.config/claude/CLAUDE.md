# Global Instructions

## Tooling

- Prefer `fd` over `find`
- `jq` is installed

## Git

- Commit messages are always in English, matching the repo's existing voice.
- Never add a `Co-Authored-By` trailer or any other attribution to commit messages.
- Never create a branch on your own initiative.

## Working Style

- Code comments are always in English.
- Match existing style, even if you'd do it differently.
- Touch only what you must. Clean up only your own mess.
- Prefer inlining over one-off abstractions.
- Work through review findings one at a time. List them prioritized, then ask per
  finding (or in pairs) whether to apply it, including a recommendation and a skip
  option, rather than fixing everything at once. Exceptions are `/code-review --fix`
  and `/simplify`, where the invocation already means "apply everything".
- For style and tidiness questions, answer with a recommendation instead of
  running tests or the app to verify.
