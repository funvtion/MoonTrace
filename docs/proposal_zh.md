# MoonTrace：MoonBit 结构化日志与 Span 追踪工具库

## 项目背景

MoonBit 生态正在向命令行工具、服务端程序、WebAssembly 应用和教学项目扩展。随着项目规模变大，开发者需要一种轻量、可测试、可移植的可观测性工具，而不仅是简单的字符串打印。MoonTrace 希望补齐这一基础设施空白，为 MoonBit 程序提供统一的结构化日志、Trace Context、Span 生命周期和可导出时间线。

## 项目目标

MoonTrace 将实现一个零核心依赖的 MoonBit 包，主要能力包括：

- 日志等级：`Trace`、`Debug`、`Info`、`Warn`、`Error`。
- 结构化字段：用 key/value 表达机器可读的上下文。
- `Context`：传递 `trace_id` 和当前 `span_id`。
- `Tracer` / `Span` / `FinishedSpan`：描述一段可追踪工作。
- JSONL 导出：便于命令行、CI 和日志管道消费。
- Chrome Trace 导出：便于在浏览器性能工具中查看时间线。

## 技术方案

核心库保持显式数据模型，不依赖全局状态，方便测试和跨目标复用。报名阶段先提供最小可编译 API 与示例；通过初审后补齐 JSON 转义、嵌套 Span、可插拔时钟、导出文件示例和 Mooncakes 发布元数据。导出层先覆盖 JSONL 与 Chrome Trace，后续可扩展为 OpenTelemetry 兼容格式。

## 阶段计划

- 2026-07-10 前：公开仓库、提交申报书、保持最小示例可编译。
- 2026-07-15 前：根据评审反馈修改方案并冻结 v0.1 API。
- 2026-08-15 前：完成日志记录、上下文传递、Span 嵌套、JSONL 导出、Chrome Trace 导出与测试。
- 2026-09-20 前：发布 Mooncakes 包，补齐示例、最终报告和演示材料。

## 验收标准

- CI 中 `moon check` 与 `moon test` 通过。
- README 示例与实际 API 保持一致。
- JSONL 输出每行都是合法 JSON。
- Chrome Trace 输出可以被浏览器时间线工具打开。
- Mooncakes 包含 README、示例、License、Changelog 和最终说明文档。

## 风险控制

- MoonBit 工具链可能持续演进：保持 API 小而清晰，使用官方 `moon.mod.json` 与 `moon.pkg` 格式。
- 导出格式容易出现转义或时间精度问题：为 JSONL 与 Chrome Trace 添加快照测试。
- 项目容易被理解为普通 logger：在申报和实现中突出 Trace Context、Span 嵌套与时间线可视化能力。
