# Examples

This directory contains runnable examples for MoonTrace users and reviewers.

## basic

The basic example creates a logger, emits a warning-level record, and prints the
JSONL representation when the record passes the level filter.

## cmd/main

The command demo starts a span, attaches the span context to a logger, prints a
JSONL log record, and prints a Chrome Trace style event for the finished span.

## Future Examples

Planned examples include a nested span demo, a deterministic test clock demo,
and a command that writes a trace file for browser timeline inspection.
