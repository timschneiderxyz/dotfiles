#!/bin/zsh

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

parsed=$(jq -r '
  (.workspace.current_dir // .cwd // "."),
  (.model.display_name // ""),
  (.context_window.context_window_size // 0),
  (.context_window.used_percentage // "")
')

{
  IFS= read -r cwd
  IFS= read -r model
  IFS= read -r ctx_size
  IFS= read -r used
} <<< "$parsed"

dir="${cwd/#$HOME/~}"

git() { command git --no-optional-locks -C "$cwd" "$@"; }

git_part=""
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  root=$(git rev-parse --show-toplevel 2>/dev/null)
  [ -n "$root" ] && dir="${root##*/}${cwd#$root}"

  branch=$(git branch --show-current 2>/dev/null)
  [ -z "$branch" ] && branch=$(git rev-parse --short HEAD 2>/dev/null)

  if [ -n "$branch" ]; then
    dirty=""
    if ! git diff --quiet 2>/dev/null || ! git diff --cached --quiet 2>/dev/null; then
      dirty="*"
    fi
    git_part="${SEP}${PURPLE}${BRANCH_GLYPH} ${branch}${dirty}${RESET}"
  fi
fi

ctx_part=""
if [ -n "$used" ]; then
  pct=${used%.*}
  (( pct < 0 )) && pct=0
  (( pct > 100 )) && pct=100

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

  ctx_part="${SEP}${bar} ${pct_color}${pct}%${RESET}${size_label}"
fi

# Path · Branch · Model · Bar Percentage Size
printf "%s" "${BLUE}${dir}${RESET}${git_part}${SEP}${CYAN}${model}${RESET}${ctx_part}"
