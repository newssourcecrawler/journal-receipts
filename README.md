# journal-receipts

Small bash utilities for extracting structured receipt events from journald.

Many services emit structured JSON events to journald, but operators still end up reading logs line-by-line.
These tools filter receipt records, export them, summarize event kinds, and show short activity pulses.

Linux only.
Requires: bash, journalctl, grep, sed, awk, sort, uniq.

⸻

## Concept

Services can emit receipt events to journald such as:

{"dir":"rcpt","kind":"ffmpeg.exec.ms","ts":"2026-03-10T22:45:10Z","ms":184,"src":"input.mp4","dst":"thumb.jpg"}

This repository provides small utilities for working with those records.

The examples use ffmpeg-style events, but the tools work with any journald lines containing structured receipt records.

⸻

## Tools

jr-tail

Follow receipt events for a systemd unit.

jr-tail ffmpeg-worker

Internally:

journalctl -u UNIT -o cat -f | grep '"dir":"rcpt"'


⸻

jr-export

Export receipt records to NDJSON.

jr-export ffmpeg-worker "10 minutes ago" > rcpt.ndjson


⸻

jr-summary

Summarize event kinds from exported records.

jr-summary rcpt.ndjson

Example output:

ffmpeg.exec.ms    12
ffmpeg.exit       12
img.bytes_in      12
img.bytes_out     12
queue.ms          12


⸻

jr-pulse

Show activity pulse per second.

jr-pulse ffmpeg-worker "5 minutes ago"

Example output:

22:45:10  ####
22:45:11  ##
22:45:12  #######
22:45:13  #


⸻

## Directory layout

journal-receipts/
├── README.md
├── bin/
│   ├── jr-tail
│   ├── jr-export
│   ├── jr-summary
│   └── jr-pulse
└── examples/
    └── demo-ffmpeg-worker.sh

All tools are plain bash scripts using standard Linux utilities.

⸻

## Non-Goals

This project intentionally does not provide:
	•	dashboards
	•	agents
	•	log ingestion pipelines
	•	dependencies beyond standard shell tools

The goal is simple operator utilities for journald receipt streams.

⸻

If you want, I can also give you the four bash scripts for bin/ so you can paste them directly into the GitHub files.
