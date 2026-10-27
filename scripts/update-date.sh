#!/usr/bin/env bash
# Renova date.txt (heartbeat do repositório) a cada 23 horas.
#
#   ./scripts/update-date.sh          -> renova uma vez
#   ./scripts/update-date.sh loop     -> renova e dorme 23h, indefinidamente
#   ./scripts/update-date.sh status   -> mostra idade do heartbeat em horas
#
# 23h (e não 24h) para o heartbeat não empatar com o mesmo horário do dia anterior:
# o desvio fica visível e o atraso acumulado é detectável.

set -euo pipefail

INTERVAL_SECONDS=$((23 * 3600))
ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
FILE="$ROOT/date.txt"

write_once() {
  local ts epoch
  ts="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
  epoch="$(date -u +%s)"
  {
    printf 'updated_at: %s\n' "$ts"
    printf 'epoch: %s\n' "$epoch"
  } > "${FILE}.tmp"
  mv -- "${FILE}.tmp" "$FILE"
  printf '[%s] date.txt renovado\n' "$ts"

  # WW_AUTOPUSH=1 -> commita e empurra o heartbeat na branch atual (aacc por padrão).
  if [[ "${WW_AUTOPUSH:-0}" == "1" ]] && git -C "$ROOT" rev-parse --git-dir >/dev/null 2>&1; then
    git -C "$ROOT" add date.txt
    git -C "$ROOT" commit -q -m "chore(heartbeat): date.txt -> ${ts}" || true
    git -C "$ROOT" push -q origin "HEAD:$(git -C "$ROOT" rev-parse --abbrev-ref HEAD)" || \
      printf 'aviso: push do heartbeat falhou (sem rede/credencial)\n' >&2
  fi
}

status() {
  if [[ ! -f "$FILE" ]]; then
    printf 'date.txt ausente\n'; return 1
  fi
  local epoch now age
  epoch="$(awk -F': ' '/^epoch:/ {print $2}' "$FILE")"
  now="$(date -u +%s)"
  age=$(( (now - epoch) / 3600 ))
  printf 'idade do heartbeat: %sh (limite 23h)\n' "$age"
  if (( age >= 23 )); then
    printf 'STATUS: STALE — renove com ./scripts/update-date.sh\n'; return 1
  fi
  printf 'STATUS: OK\n'
}

case "${1:-once}" in
  once)   write_once ;;
  loop)
    while true; do
      write_once
      sleep "$INTERVAL_SECONDS"
    done
    ;;
  status) status ;;
  *)
    printf 'uso: %s [once|loop|status]\n' "$0" >&2
    exit 1
    ;;
esac
