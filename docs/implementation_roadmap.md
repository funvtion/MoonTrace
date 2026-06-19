# MoonTrace Implementation Roadmap

## Proposal Stage

- Keep the public API small and reviewable.
- Make the package layout match official MoonBit module and package configuration.
- Provide a runnable demo and README examples.
- Submit `docs/MoonTrace_OSC2026_Proposal.pdf` plus the public repository URL.

## v0.1 Core

- Add JSON string escaping for messages, field keys, and field values.
- Serialize fields into JSONL output.
- Add `Clock` abstraction with deterministic test clock and host-backed production clock.
- Track parent/child span ids and support nested spans.
- Add snapshot tests for JSONL and Chrome Trace exports.

## v0.2 Usability

- Add file-oriented exporter examples.
- Add CLI example that writes `trace.json` for browser timeline inspection.
- Add API docs for common instrumentation patterns.
- Publish to Mooncakes after CI is green.

## Final Delivery

- Include final report, demo output, and package link.
- Confirm README examples compile.
- Tag a release and keep the repository public for review.
