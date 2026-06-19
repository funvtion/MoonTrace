# Testing Strategy

MoonTrace uses a small set of behavior tests during the proposal stage. The goal
is to keep checks fast while protecting the API examples that reviewers will run.

## Current Checks

- Level ordering supports logger filtering.
- Logger returns no record below the configured minimum level.
- Logger output can be converted to JSONL.
- Span context can be read from a started span.
- Finished spans can be exported to Chrome Trace style JSON.

## CI Checks

The CI workflow installs the MoonBit CLI, runs moon check, and then runs moon
test. README examples are kept compatible with moon check so the documentation
does not drift away from the package API.

## Future Checks

- Snapshot tests for JSON escaping.
- Field serialization coverage.
- Nested span parent/child relationships.
- Deterministic clock behavior.
- Example output checks for command line demos.
