# OSC2026 报名表填写草稿

以下内容可直接用于报名表或公开仓库描述。尖括号中的内容需要由参赛者补齐。

## 基本信息

- 项目名称：MoonTrace
- 项目方向：MoonBit 基础库 / 可观测性工具 / 结构化日志与追踪
- 参赛形式：个人项目
- 参赛者姓名或昵称：`<待填写>`
- 联系方式：`<待填写>`
- 学校/单位/身份：`<待填写>`
- GitHub/GitLink 账号：`<待填写>`
- 公开仓库地址：`<上传后填写>`

## 项目简介

MoonTrace 是一个面向 MoonBit 的结构化日志与 Span 追踪工具库。它提供日志等级过滤、结构化字段、Trace Context、Span 生命周期、JSONL 导出和 Chrome Trace 时间线导出，帮助 MoonBit 开发者在 CLI、测试、服务端和 WebAssembly 场景中快速建立轻量可观测性能力。

## 创新点

- 不只是普通 logger，而是将日志记录与 Trace Context、Span 生命周期组合为一套基础库 API。
- 支持 Chrome Trace 导出，方便用浏览器性能工具查看 MoonBit 程序时间线。
- 核心保持零依赖、显式数据模型、可测试，适合基础软件生态复用。
- 先覆盖 MoonBit 当前生态缺口，后续可扩展到 OpenTelemetry 兼容输出。

## 预期成果

- 一个可发布到 Mooncakes 的 MoonBit 包。
- 完整 README、示例、测试和 CI。
- JSONL 与 Chrome Trace 两类导出器。
- 最终报告与演示材料。

## 仓库简介短句

Structured logging and span tracing toolkit for MoonBit, with JSONL and Chrome Trace exporters.
