## About these instructions

These are my default preferences that apply to all projects.

If a repository contains local agent instructions, those should take precedence over these where there is a conflict.

## Version Control

### Tooling: Use `jj` when initialized in repo

*If a `.jj` directory is present at the root of the repository, default to `jj` commands and methodology exclusively, rather than `git`. This holds even in colocated repositories where a `.git` directory is also present.*

You can explore `jj help` subtopics if you need any help with the jj syntax or conventions.

### Commit message style

Write Conventional Commits: `type: subject` or `type(scope): subject`. Types in regular use: `feat`, `fix`, `docs`, `test`, `refactor`, `perf`, `build`, `ci`, `chore`. Scope is lowercase and narrow — a package or area — and should only be included on projects containing genuinely broad scope where the disambiguation holds weight. The subject is imperative mood, lowercase after the colon, no trailing period, ~35–50 chars and never past 72. Never hand-append a `(#123)` suffix; GitHub adds that on squash-merge. Trivial changes (version bumps, typo fixes, config tweaks) are a subject line and nothing else — don't pad them with a body that restates the subject.

Anything non-trivial gets a body, blank-line separated and hard-wrapped at 72 columns. Lead with the problem and its root cause in present tense — what the code actually does wrong and the user-visible consequence — then the fix, then notable secondary changes (new tests, deprecations, retractions) as prose or a short `-` list. Explain *why*; the diff already shows *what*.

For `perf` work, include the measurement: paste the `benchstat` table indented by four spaces, with the machine/`-count` context, and state honestly when a result is noise rather than an effect — negative results are worth committing, since they stop the next person from redoing the experiment.

Close with issue references on their own line (`Fixes #143`, `Closes #28`, comma-joined for several), then `Co-Authored-By:` trailers for AI assistance.

Before writing, check the repo's recent history (`git log`, or `jj log` where a `.jj` directory is present) and follow its existing convention when it differs from this — including repos that don't use Conventional Commits at all, where you should match their subject style instead. A contributor's job is to match the project, not to import a personal style.

Example of the full form:

```
fix: detect color support via stderr TTY and NO_COLOR env var

The status command is typically invoked via a shell wrapper which
captures stdout in a subshell, so the color library's default TTY
detection (against stdout) always sees a pipe. Instead, check stderr
(which remains connected to the user's terminal) and honor the
NO_COLOR convention (<https://no-color.org/>).

Add integration test verifying both NO_COLOR and non-TTY detection
through the full shell wrapper across bash/zsh/fish.

Fixes #143
```

### When merging PRs with `gh`, use `--author-email` to respect organization

For any repositories in the `classdojo` organization use `--author-email` set to `mroth@dojo.com`, for any other repositories use `mroth@mroth.xyz`. This is mandatory to ensure the email identity matches norms.

### Check for latest version of GitHub Actions workflows

When adding GitHub Actions workflows such as `actions/checkout` and `actions/setup-*`, you must check to see what the latest major version is and use that.

### GitHub Actions workflows must always contain a `permissions:` block

Default to the most restrictive permissions that will enable the workflow to run.

## Coding Conventions

### General Philosophy

In general, I favor code that is simple, understandable, and minimal. Be conservative about introducing layers of abstraction prior to them holding their weight.

### Go Ecosystem

*For new projects, my default selection is typically Go.*

Some preferences for working within the Go ecosystem:

- Prefer using the gopls integration (the `gopls-mcp` MCP server tools, e.g. `go_diagnostics`, `go_search`, `go_symbol_references`) when available for all functionality it provides. If you are in a Go project and those tools are not available, ask me if I would like to enable them.
- For looking up package documentation for modules installed locally, prefer `go doc` from the CLI versus grepping the source code.
- Testing
    - Favor idiomatic table driven tests. Use the minimal set of test cases that can capture common use cases and edge cases.
    - For test names, for the general case prefer the `TestFunction` and `TestType_Method` convention.
    - Never add any assertion modules such as `testify`. The only common third-party testing import to add to a project is `go-cmp`, and bring it in only when it would carry weight with reducing code complexity and making output easier to understand. If in doubt, ask first.
    - When testing concurrent code, reach for `synctest`.

### JavaScript/TypeScript Ecosystem

- For greenfield projects, always prefer `bun` and the related ecosystem.
    - For new projects, use my default starter template via `bun create mroth/bunyip` which introduces a number of my preferences.
- Be ruthless about not introducing new third party modules without explicit confirmation from me.
