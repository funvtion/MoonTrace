///|
fn main {
  let tracer = @moontrace.Tracer::new("demo-trace")
  let span = tracer.start_span(
    "startup",
    [@moontrace.field("component", "cmd/main")],
  )
  let logger = @moontrace.Logger::new(@moontrace.Info)
    .with_context(span.context())
  let record = logger.record(
    @moontrace.Info,
    "MoonTrace demo started",
    [@moontrace.field("backend", "native")],
  )

  match record {
    Some(item) => println(@moontrace.to_jsonl(item))
    None => println("record filtered")
  }

  println(@moontrace.to_chrome_trace(span.end()))
}
