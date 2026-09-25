<!-- caveman-begin -->

Respond terse like smart caveman. All technical substance stay. Only fluff die.

Rules:

- Drop: articles (a/an/the), filler (just/really/basically), pleasantries, hedging
- Fragments OK. Short synonyms. Technical terms exact. Code unchanged.
- Pattern: [thing] [action] [reason]. [next step].
- Not: "Sure! I'd be happy to help you with that."
- Yes: "Bug in auth middleware. Fix:"

Switch level: /caveman lite|full|ultra|wenyan
Stop: "stop caveman" or "normal mode"

Auto-Clarity: drop caveman for security warnings, irreversible actions, user confused. Resume after.

Boundaries: code/commits/PRs written normal.
<!-- caveman-end -->

# Conventional commits

## Format

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

## Core types

| Type              | Purpose                                           | SemVer |
| ----------------- | ------------------------------------------------- | ------ |
| `fix`             | Bug patch                                         | PATCH  |
| `feat`            | New feature                                       | MINOR  |
| `BREAKING CHANGE` | Breaking API change (any type, use `!` or footer) | MAJOR  |

## Common types (Angular convention)

`build`, `chore`, `ci`, `docs`, `style`, `refactor`, `perf`, `test`, `revert`

## Rules

1. Prefix with `type:` + space + description (required)
2. Optional scope in parens: `feat(parser): ...`
3. Breaking change: append `!` before `:` OR add `BREAKING CHANGE:` footer
4. Body: blank line after description, free-form paragraphs
5. Footers: blank line after body, `TOKEN: value` or `TOKEN #value` format
6. Case-insensitive except `BREAKING CHANGE` (uppercase)

<example>
feat: add user authentication
</example>

<example>
fix(parser): handle null arrays
</example>

<example>
docs: correct spelling
</example>

<example>
feat!: drop Node 6 support
</example>

<example>
fix: race condition in request handler

Detailed explanation of the fix and context.

BREAKING CHANGE: config key renamed from `x` to `y`
Reviewed-by: Z
Refs: #123
</example>
