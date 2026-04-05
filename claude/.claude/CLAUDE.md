## Core Principles
- Simplicity first. Minimal code impact. No speculative changes.
- Find root causes. No temporary fixes. Senior developer standards.
- Verify correctness before marking done.
- For non-trivial changes, pause and ask: is there a more elegant solution?
- Fix bugs autonomously — don't ask for hand-holding.

## Python Coding Style

**Stack:** Python, pandas, numpy, matplotlib, plotly, streamlit, Jupyter notebooks

**Strings:**
- Single quotes by default: `'hello'`
- Double quotes only when the string contains a single quote: `"didn't"`, `"it's"`
- Never escape a quote when switching quote style avoids it

**Formatting:**
- Max line length: 135
- Use f-strings for all string interpolation

**Type hints:**
- Use extensively on all functions and methods
- Use built-in types: `list`, `tuple`, `dict`, `set` — never import `List`, `Tuple` etc. from `typing`

**Imports:**
- Order: standard library → third-party → local, each group separated by a blank line
- Alphabetical within each group
- No wildcard imports

**Pandas/numpy:**
- Prefer vectorized operations over loops where it makes sense
- Avoid `iterrows()` unless no vectorized alternative exists

**Docstrings:**
- Always add docstrings to functions and classes
- One-liner for simple functions; add Args/Returns only when non-obvious

**Commits:**
- Format: `type: brief description`
- Types: `feat`, `fix`, `chore`, `docs`, `refactor`, `perf`, `test`, `style`, `build`, `ci`
