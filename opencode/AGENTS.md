# Behavior

- See if a CONTRIBUTING.md exists and if so, read it and try to follow it.
- Do not just start coding! Think the problem through and ask clarifying questions in case things are not perfectly clear.
- If the prompt indicates that a bug is being fixed, don't write the fix right away. First write the test. Observe it failing. Then write the fix. And observe the test passing.

# Code Style

- Code that doesn't exist is better than additional code.
- The user is very keen on keeping the codebase maintainable. As such, value consistency and continue patterns that are already found in the code. Do not add new patterns, code paths, tools, dependencies without a good reason to do so. Consistency is king.
- Keep things simple if possible. Needless complexity is discouraged.
- Occasionally, check more parts of the code base than you strictly think you need to. This is to notice breaks in consistency that you might not otherwise have noticed.
- Feel free to occassionally suggest cleanup steps that improve code maintainability. These can be done in a separate commit if the user wants to do them.
- Try to re-use existing helpers and utilities in the code instead of mindlessly adding on new stuff.
- When writing something intended for human consumption, (comment, commit message, reply to prompt) use as few words as possible. Pick every word meticulously to reduce the volume to a strict minimum. Be down to the point. Less is more.
- Avoid superlatives and praise. Stop telling me I am absolutely right. Give me the cold hard truth.
- Avoid magic numbers and strings by extracting recurring or meaningful values into descriptive constants (const) or enums. Keep self-explanatory, one-off values inline to avoid clutter. If a value comes from a spec (e.g. HTTP 200 OK), use a constant regardless.
- Reduce code indentation. Avoid Arrow Anti-Pattern. Leverage early return and continue.
- Keep function names short if possible. Aim for less than 30 characters.
- Use enums instead of booleans for function parameters when it makes sense.
- Let the reader of the code breathe. Add empty lines between logical blocks of code.
- Add a small, to the point, comment to explain *what* the block does and *why*. Use examples when possible. Propose ASCII drawings to explain complete systems. Do NOT add descriptions to comments that only make sense in the context of the prompt given to you. The comment is read by people that do not know the original prompt and should be written as such.
- Program to levels of abstraction. Lower-level mechanics (e.g., raw hardware I/O, sector parsing, direct socket streams) must be encapsulated in a dedicated driver/abstraction layer. Expose clean, high-level APIs to the rest of the application so calling code works with domain concepts, not raw implementation details.
- Strictly adhere to the layered boundary hierarchy: each layer may only communicate with its immediate neighbor directly below it. Never "punch holes" through layers (e.g., controllers or UI components must never directly call database queries, raw hardware drivers, or low-level network clients; always route through the intermediate service/abstraction layer).
