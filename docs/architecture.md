# MoonTrace Architecture

MoonTrace is organized as a small MoonBit package with explicit data types and
pure export functions. The design avoids global state at proposal stage so the
API remains simple to test and review.

## Core Types

- Level defines filtering order for log records.
- Field represents structured key/value metadata.
- Context carries trace and span identifiers.
- Logger filters records and attaches context.
- Tracer starts spans for a trace id.
- Span represents active work.
- FinishedSpan represents completed work ready for export.

## Export Path

Log records are exported as JSONL strings for command line tools, CI logs, and
log pipelines. Finished spans are exported in a Chrome Trace compatible shape so
future examples can be inspected in browser timeline tools.

## Design Principles

- Keep the core dependency-light.
- Make values explicit and inspectable.
- Prefer stable examples over broad feature surface.
- Add richer exporters only after the minimal API is reviewed.
