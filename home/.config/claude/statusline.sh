#!/bin/zsh

# Style
ESC=$'\033'
RESET="${ESC}[0m"
RED="${ESC}[31m"
GREEN="${ESC}[32m"
YELLOW="${ESC}[33m"
BLUE="${ESC}[34m"
PURPLE="${ESC}[35m"
CYAN="${ESC}[36m"
GRAY="${ESC}[90m"
SEP=" ${GRAY}·${RESET} "
BRANCH_GLYPH=$''

# Input
parsed=$(jq -r '
  (.workspace.current_dir // .cwd // "."),
  (.model.display_name // ""),
  (.effort.level // ""),
  (.context_window.context_window_size // 0),
  (.context_window.used_percentage // ""),
  (.rate_limits.five_hour.used_percentage // ""),
  (.rate_limits.seven_day.used_percentage // "")
' 2>/dev/null)
{
  IFS= read -r cwd
  IFS= read -r model
  IFS= read -r effort
  IFS= read -r ctx_size
  IFS= read -r used
  IFS= read -r five_hour
  IFS= read -r seven_day
} <<< "$parsed"

# Git
git() { command git --no-optional-locks -C "$cwd" "$@"; }
git_part=""
root=""
if [ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = true ]; then
  root=$(git rev-parse --show-toplevel 2>/dev/null)

  branch=$(git branch --show-current 2>/dev/null)
  [ -z "$branch" ] && branch=$(git rev-parse --short HEAD 2>/dev/null)

  dirty=""
  [ -n "$(git status --porcelain 2>/dev/null)" ] && dirty="*"
  git_part="${SEP}${PURPLE}${BRANCH_GLYPH} ${branch}${dirty}${RESET}"
fi

# Directory
dir="${cwd/#$HOME/~}"
[ -n "$root" ] && dir="${root##*/}${cwd#$root}"
dir_part="${BLUE}${dir}${RESET}"

# Model
model_part="${SEP}${CYAN}${model}"
[ -n "$effort" ] && model_part+=" ${effort}"
model_part+="${RESET}"

# Context
ctx_part=""
if [ -n "$used" ]; then
  pct=${used%.*}

  filled=$(( pct / 10 ))

  if (( pct >= 90 )); then pct_color=$RED
  elif (( pct >= 70 )); then pct_color=$YELLOW
  else pct_color=$GREEN
  fi

  grad_r=(46 116 186 241 239 236 233 231 211 192)
  grad_g=(204 195 186 196 161 126 101 76 66 57)
  grad_b=(113 89 64 15 24 34 44 60 50 43)

  bar=""
  for (( i = 1; i <= 10; i++ )); do
    if (( i <= filled )); then
      bar+="${ESC}[38;2;${grad_r[$i]};${grad_g[$i]};${grad_b[$i]}m█"
    else
      (( i == filled + 1 )) && bar+="$GRAY"
      bar+="░"
    fi
  done
  bar+="$RESET"

  size_label=""
  if (( ctx_size >= 1000000 )); then
    size_label=" ${GRAY}$(( ctx_size / 1000000 ))M${RESET}"
  elif (( ctx_size >= 1000 )); then
    size_label=" ${GRAY}$(( ctx_size / 1000 ))k${RESET}"
  fi

  ctx_part=" ${bar} ${pct_color}${pct}%${RESET}${size_label}"
fi

# Rate Limits
limits_part=""
for label raw in S "$five_hour" W "$seven_day"; do
  [ -z "$raw" ] && continue

  lpct=${raw%.*}

  if (( lpct >= 90 )); then limit_color=$RED
  elif (( lpct >= 70 )); then limit_color=$YELLOW
  else limit_color=$GREEN
  fi

  limits_part+=" ${GRAY}${label}${RESET} ${limit_color}${lpct}%${RESET}"
done
[ -n "$limits_part" ] && limits_part="${SEP}${limits_part# }"

# Account
account_part=""
account=$(jq -r '.oauthAccount.emailAddress // empty' "${CLAUDE_CONFIG_DIR:-$HOME}/.claude.json" 2>/dev/null)
[ -n "$account" ] && account_part="${SEP}${GRAY}${account}${RESET}"

# Directory · Branch · Model Effort Context · Rate Limits · Account
printf "%s" "${dir_part}${git_part}${model_part}${ctx_part}${limits_part}${account_part}"
