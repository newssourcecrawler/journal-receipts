#!/usr/bin/env bash

echo "Example usage"

echo
echo "Tail receipts:"
echo "  jr-tail ffmpeg-worker"

echo
echo "Export receipts:"
echo '  jr-export ffmpeg-worker "10 minutes ago" > rcpt.ndjson'

echo
echo "Summarize kinds:"
echo "  jr-summary rcpt.ndjson"

echo
echo "Activity pulse:"
echo '  jr-pulse ffmpeg-worker "5 minutes ago"'
