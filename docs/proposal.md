# MoonTrace: MoonBit Structured Logging and Span Tracing Toolkit

## Background

MoonBit is moving toward practical use in CLI tools, services, WebAssembly modules, and teaching projects. These programs need observability, but a full tracing stack is often too heavy for early MoonBit projects. MoonTrace proposes a small, dependency-light library that standardizes structured logs, trace context, span timing, and export formats.

## Goal

MoonTrace will provide a reusable MoonBit package with:

- Structured log records with stable level filtering and key/value fields.
- `Context` propagation for trace id and span id.
- `Tracer`, `Span`, and `FinishedSpan` APIs for instrumenting nested work.
- JSONL export for log pipelines.
- Chrome Trace export for visual timeline analysis.

## Technical Plan

The core package stays zero-dependency and portable across native, JS, and Wasm-oriented MoonBit targets. The first implementation keeps deterministic timestamps for tests; later milestones add pluggable clocks and richer exporters. The API favors explicit data types over global state so that tests, CLI tools, and browser runtimes can share the same model.

## Milestones

- 2026-07-10: publish repository, submit this proposal, and keep a minimal compiling demo.
- 2026-07-15: apply review feedback and freeze the v0.1 API shape.
- 2026-08-15: complete logger, context propagation, span nesting, JSONL exporter, Chrome Trace exporter, and tests.
- 2026-09-20: publish to Mooncakes, add examples, write final report, and prepare demo material.

## Acceptance Criteria

- `moon check` and `moon test` pass in CI.
- README examples compile and match the implementation.
- JSONL output is valid JSON per line.
- Chrome Trace output can be opened by browser timeline tooling.
- Mooncakes package contains docs, examples, license, and changelog.

## Risks and Mitigation

- MoonBit ecosystem APIs may evolve during the contest; mitigation: keep the public API small and use official `moon.pkg` / `moon.mod.json` formats.
- Export escaping and time sources are easy to get subtly wrong; mitigation: add snapshot tests and deterministic clock fixtures before v0.1.
- Project may look like a generic logger; mitigation: emphasize trace context, span export, and timeline visualization as the differentiating scope.
