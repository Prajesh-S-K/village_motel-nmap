#!/usr/bin/env bash
# Usage:
#   ./scripts/run_scan.sh <target> <label> "<nmap arguments>"
# Example:
#   ./scripts/run_scan.sh example.com top100 "-sS -T4 --top-ports 100 -sV"

TARGET="$1"
LABEL="$2"
shift 2
ARGS="$@"

TS=$(date -u +%Y%m%dT%H%M%SZ)
OUTDIR="scans/raw"
mkdir -p "$OUTDIR"

FBASE="${OUTDIR}/${TS}_${LABEL}_${TARGET}"

echo "[*] Running: nmap $ARGS -oA $FBASE $TARGET"
nmap $ARGS -oA "$FBASE" "$TARGET"
echo "[*] Saved outputs: ${FBASE}.{nmap,xml,gnmap}"
