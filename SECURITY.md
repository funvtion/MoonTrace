# Security Policy

MoonTrace is not intended to process secrets specially at proposal stage. Users
should avoid placing tokens, passwords, or private keys in log fields or span
names.

## Reporting Issues

For the competition review period, use GitHub Issues or the competition feedback
channel to report security concerns.

## Current Security Notes

- JSON escaping is planned for the next implementation phase.
- Field values are treated as plain strings.
- The package does not send data over the network.
- Exported strings should be handled as application logs.
