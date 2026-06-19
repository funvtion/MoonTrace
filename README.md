# MoonTrace

MoonTrace is a structured logging and span tracing toolkit for MoonBit. It is proposed for OSC2026 as an observability building block for MoonBit tests, CLI tools, services, and WebAssembly applications.

The current repository is the proposal-stage package: it includes the public API sketch, a minimal compilable implementation, examples, tests, CI, and the one-page proposal draft required for registration.

## Why This Project

MoonBit already has a fast toolchain and a growing package ecosystem, but application developers still need a small, dependency-light observability layer. MoonTrace fills that gap with:

- Structured log records instead of plain strings.
- Trace context propagation through `Context`.
- Span lifecycle APIs for nested work.
- JSONL and Chrome Trace export paths for machines and timeline viewers.

## Quick Start

```bash
moon check
moon test
moon run cmd/main
```

```mbt check
let tracer = Tracer::new("trace-demo")
let span = tracer.start_span("startup", [field("component", "readme")])
let logger = Logger::new(Info).with_context(span.context())
let record = logger.record(Info, "MoonTrace ready", [])
match record {
  Some(item) => inspect(to_jsonl(item), content="{\"level\":\"info\",\"message\":\"MoonTrace ready\",\"trace_id\":\"trace-demo\",\"span_id\":\"span-1\",\"timestamp_us\":0}")
  None => fail("expected log record")
}
```

## API Draft

- `Level`: `Trace`, `Debug`, `Info`, `Warn`, `Error`.
- `Field`: key/value metadata for records and spans.
- `Context`: trace id and current span id.
- `Logger::record(level, message, fields)`: emits a structured `LogRecord?`.
- `Tracer::start_span(name, fields)`: creates a `Span`.
- `Span::end()`: finishes a span for export.
- `to_jsonl(record)`: exports a log record as a JSONL line.
- `to_chrome_trace(span)`: exports a finished span in Chrome Trace event format.

## OSC2026 Milestones

- By 2026-07-10: submit proposal PDF and public repository link.
- By 2026-07-15: revise proposal after review feedback.
- By 2026-08-15: implement stable logger, context, span lifecycle, and exporters.
- By 2026-09-20: finish tests, examples, Mooncakes release, and final documentation.

## Repository Layout

- `moontrace.mbt`: proposal-stage library implementation.
- `moontrace_test.mbt`: core behavior tests.
- `cmd/main`: runnable demo used by CI and reviewers.
- `examples/basic`: small example for README users.
- `docs/proposal.md`: one-page OSC2026 proposal source.
- `docs/proposal_zh.md`: Chinese proposal source for registration copy.
- `docs/OSC2026_checklist.md`: registration and delivery checklist.
- `docs/submission_form_draft.md`: form-ready project description.

## Status

This package is intentionally small at the registration stage. The next implementation phase will add JSON escaping, richer field encoding, nested span parenting, deterministic clocks for tests, browser-friendly Chrome Trace output files, and Mooncakes publishing metadata.

## License

MIT
