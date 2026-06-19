# MoonTrace

MoonTrace is a structured logging and span tracing toolkit for MoonBit. See [README.md](README.md) for the full proposal-stage overview.

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
