# Reviewer Notes

MoonTrace is currently in proposal stage. The repository intentionally keeps
the implementation small so reviewers can inspect the API shape, examples, and
delivery plan quickly.

## What To Review First

- README.md for the project goal and quick start.
- moontrace.mbt for the public API sketch.
- moontrace_test.mbt for proposal-stage behavior checks.
- docs/proposal.md and docs/proposal_zh.md for the competition proposal.
- docs/implementation_roadmap.md for planned delivery work.

## Current Scope

The current implementation demonstrates structured log records, trace context,
span lifecycle methods, JSONL export, and Chrome Trace style export. It does not
yet claim production completeness.

## Planned Follow-up

The next phase will focus on JSON escaping, field serialization, nested span
relationships, deterministic clocks for tests, richer examples, and Mooncakes
publishing metadata.
