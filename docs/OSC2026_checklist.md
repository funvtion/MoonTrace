# OSC2026 Registration Checklist

## Ready in This Repository

- [x] MoonBit package skeleton.
- [x] Minimal library API for `Level`, `Logger`, `Tracer`, `Span`, `Context`, and exporters.
- [x] Runnable examples in `cmd/main` and `examples/basic`.
- [x] Tests describing the proposal-stage behavior.
- [x] README with API sketch, milestones, and usage.
- [x] MIT license and changelog.
- [x] GitHub Actions CI definition.
- [x] One-page proposal source: `docs/proposal.md`.
- [x] Chinese proposal source: `docs/proposal_zh.md`.
- [x] Generated proposal PDF: `docs/MoonTrace_OSC2026_Proposal.pdf`.
- [x] Registration form draft: `docs/submission_form_draft.md`.
- [x] Implementation roadmap: `docs/implementation_roadmap.md`.

## User Information Needed for Submission

- Name or preferred participant name.
- Email or phone number.
- School, company, or independent developer status.
- GitHub or GitLink account.
- Public repository URL after upload.
- Confirmation that the work is submitted as an individual project.

## After Repository Upload

- Replace `https://github.com/<your-account>/moontrace` in `moon.mod.json` with the final public URL.
- Run `moon check` and `moon test` locally or through CI.
- Submit the proposal PDF and repository URL through the OSC2026 registration form.
- Keep issues enabled so reviewers can leave feedback before 2026-07-15.

## After Proposal Approval

- Add JSON escaping and field serialization.
- Add nested parent/child span support.
- Add deterministic and host-backed clock implementations.
- Add Chrome Trace file generation example.
- Publish v0.1.0 to Mooncakes.
