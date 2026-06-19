///|
fn main {
  let logger = @moontrace.Logger::new(@moontrace.Info)
  match logger.record(
    @moontrace.Warn,
    "cache miss",
    [@moontrace.field("cache", "user-profile")],
  ) {
    Some(record) => println(@moontrace.to_jsonl(record))
    None => println("record filtered")
  }
}
