# MoonTrace

MoonTrace is a structured logging and span tracing toolkit for MoonBit. See [README.md](README.md) for the full proposal-stage overview.

```mbt check
fn readme_example() -> String {
  let tracer = @moontrace.Tracer::new("trace-demo")
  let span = tracer.start_span(
    "startup",
    [@moontrace.field("component", "readme")],
  )
  let logger = @moontrace.Logger::new(@moontrace.Info)
    .with_context(span.context())
  let record = logger.record(@moontrace.Info, "MoonTrace ready", [])
  let output = match record {
    Some(item) => @moontrace.to_jsonl(item)
    None => "missing"
  }
  output
}
```
