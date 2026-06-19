///|
test "level ordering supports filtering" {
  assert_eq(Trace < Info, true)
  assert_eq(Error > Warn, true)
}

///|
test "logger filters records below minimum level" {
  let logger = Logger::new(Info)
  let record = logger.record(Debug, "hidden", [])
  assert_eq(record, None)
}

///|
test "logger emits jsonl-ready records" {
  let logger = Logger::new(Info)
  let record = logger.record(Info, "startup", [field("component", "demo")])
  match record {
    Some(item) =>
      assert_eq(
        to_jsonl(item),
        "{\"level\":\"info\",\"message\":\"startup\",\"trace_id\":\"local\",\"span_id\":\"root\",\"timestamp_us\":0}",
      )
    None => panic()
  }
}

///|
test "span can be finished and exported" {
  let tracer = Tracer::new("trace-demo")
  let span = tracer.start_span("load-config", [field("file", "moon.pkg")])
  let finished = span.end()
  assert_eq(span.context(), { trace_id: "trace-demo", span_id: "span-1" })
  assert_eq(
    to_chrome_trace(finished),
    "{\"name\":\"load-config\",\"cat\":\"moontrace\",\"ph\":\"X\",\"ts\":0,\"dur\":0,\"pid\":1,\"tid\":\"trace-demo\"}",
  )
}
