///|
test "level ordering supports filtering" {
  assert_eq(@moontrace.Trace < @moontrace.Info, true)
  assert_eq(@moontrace.Error > @moontrace.Warn, true)
}

///|
test "logger filters records below minimum level" {
  let logger = @moontrace.Logger::new(@moontrace.Info)
  let record = logger.record(@moontrace.Debug, "hidden", [])
  let result = match record {
    None => "none"
    Some(item) => @moontrace.to_jsonl(item)
  }
  assert_eq(result, "none")
}

///|
test "logger emits jsonl-ready records" {
  let logger = @moontrace.Logger::new(@moontrace.Info)
  let record = logger.record(
    @moontrace.Info,
    "startup",
    [@moontrace.field("component", "demo")],
  )
  let result = match record {
    Some(item) => @moontrace.to_jsonl(item)
    None => "missing"
  }
  assert_eq(
    result,
    "{\"level\":\"info\",\"message\":\"startup\",\"trace_id\":\"local\",\"span_id\":\"root\",\"timestamp_us\":0}",
  )
}

///|
test "span can be finished and exported" {
  let tracer = @moontrace.Tracer::new("trace-demo")
  let span = tracer.start_span(
    "load-config",
    [@moontrace.field("file", "moon.pkg")],
  )
  let finished = span.end()
  let context = span.context()
  assert_eq(context.trace_id, "trace-demo")
  assert_eq(context.span_id, "span-1")
  assert_eq(
    @moontrace.to_chrome_trace(finished),
    "{\"name\":\"load-config\",\"cat\":\"moontrace\",\"ph\":\"X\",\"ts\":0,\"dur\":0,\"pid\":1,\"tid\":\"trace-demo\"}",
  )
}
