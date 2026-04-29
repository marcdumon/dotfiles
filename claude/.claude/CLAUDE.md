## Python
- Never install packages into system Python. Never use `--break-system-packages`.
- Always use `uv` for Python package management (`uv venv`, `uv pip install`).

## File handling rules
- Do not re-read files that were already loaded in the current session.
- Assume previously read files remain available in context.
- Only re-read if explicitly required due to missing or inconsistent information.
- Prefer search, grep, or targeted line-range reads instead of full file reads.
- Prefer patch-based edits over reloading full files.

## Commits
- Format: `type: short description` (imperative, no period)
- Types: `feat`, `fix`, `chore`, `docs`, `refactor`, `perf`, `test`, `style`, `build`, `ci`
- Breaking changes: `feat!: description`
- No AI attribution or co-author trailers.

## Communication
- Responses are short and direct. No preamble, no trailing summaries.
- Lead with the answer or action, not the reasoning.
- Don't restate what was asked. Don't explain what you're about to do — just do it.
- Offer reasoning only when non-obvious or when a decision needs the user's input.
- No unsolicited suggestions, caveats, or "you might also want to..."
- Never use the em dash (—).

@RTK.md
