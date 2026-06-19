///|
pub(all) enum Level {
  Trace
  Debug
  Info
  Warn
  Error
} derive(Eq, Compare, Debug)

///|
pub(all) struct Field {
  key : String
  value : String
} derive(Eq, Debug)

///|
pub(all) struct Context {
  trace_id : String
  span_id : String
} derive(Eq, Debug)

///|
pub(all) struct Logger {
  min_level : Level
  context : Context
} derive(Eq, Debug)

///|
pub(all) struct LogRecord {
  level : Level
  message : String
  trace_id : String
  span_id : String
  timestamp_us : Int64
  fields : Array[Field]
} derive(Eq, Debug)

///|
pub(all) struct Tracer {
  trace_id : String
  next_span_id : Int
} derive(Eq, Debug)

///|
pub(all) struct Span {
  trace_id : String
  span_id : String
  parent_span_id : String
  name : String
  start_us : Int64
  fields : Array[Field]
} derive(Eq, Debug)

///|
pub(all) struct FinishedSpan {
  trace_id : String
  span_id : String
  parent_span_id : String
  name : String
  start_us : Int64
  end_us : Int64
  fields : Array[Field]
} derive(Eq, Debug)

///|
pub fn field(key : String, value : String) -> Field {
  { key: key, value: value }
}

///|
pub fn Context::root(trace_id : String) -> Context {
  { trace_id: trace_id, span_id: "root" }
}

///|
pub fn Logger::new(min_level : Level) -> Logger {
  { min_level: min_level, context: Context::root("local") }
}

///|
pub fn Logger::with_context(self : Logger, context : Context) -> Logger {
  { min_level: self.min_level, context: context }
}

///|
pub fn Logger::record(
  self : Logger,
  level : Level,
  message : String,
  fields : Array[Field]
) -> LogRecord? {
  if level < self.min_level {
    None
  } else {
    Some({
      level: level,
      message: message,
      trace_id: self.context.trace_id,
      span_id: self.context.span_id,
      timestamp_us: 0L,
      fields: fields,
    })
  }
}

///|
pub fn Tracer::new(trace_id : String) -> Tracer {
  { trace_id: trace_id, next_span_id: 1 }
}

///|
pub fn Tracer::start_span(
  self : Tracer,
  name : String,
  fields : Array[Field]
) -> Span {
  {
    trace_id: self.trace_id,
    span_id: "span-\{self.next_span_id}",
    parent_span_id: "root",
    name: name,
    start_us: 0L,
    fields: fields,
  }
}

///|
pub fn Span::context(self : Span) -> Context {
  { trace_id: self.trace_id, span_id: self.span_id }
}

///|
pub fn Span::end(self : Span) -> FinishedSpan {
  {
    trace_id: self.trace_id,
    span_id: self.span_id,
    parent_span_id: self.parent_span_id,
    name: self.name,
    start_us: self.start_us,
    end_us: self.start_us,
    fields: self.fields,
  }
}

///|
pub fn Level::to_string(self : Level) -> String {
  match self {
    Trace => "trace"
    Debug => "debug"
    Info => "info"
    Warn => "warn"
    Error => "error"
  }
}

///|
pub fn to_jsonl(record : LogRecord) -> String {
  "{\"level\":\"\{record.level.to_string()}\",\"message\":\"\{record.message}\",\"trace_id\":\"\{record.trace_id}\",\"span_id\":\"\{record.span_id}\",\"timestamp_us\":\{record.timestamp_us}}"
}

///|
pub fn to_chrome_trace(span : FinishedSpan) -> String {
  "{\"name\":\"\{span.name}\",\"cat\":\"moontrace\",\"ph\":\"X\",\"ts\":\{span.start_us},\"dur\":\{span.end_us - span.start_us},\"pid\":1,\"tid\":\"\{span.trace_id}\"}"
}
