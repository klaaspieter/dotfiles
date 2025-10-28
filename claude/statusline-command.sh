#!/bin/sh
#
# Shared statusline script for Claude Code - detects personal vs work account
#
# Installation:
# 1. Run `rcup` to symlink this to ~/.claude/statusline-command.sh
# 2. Add to BOTH settings files:
#    - ~/.config/claude/personal/settings.json
#    - ~/.config/claude/ipinfo/settings.json
#
# Add this to the "statusLine" section:
# {
#   "statusLine": {
#     "type": "command",
#     "command": "~/.claude/statusline-command.sh"
#   }
# }
#
# Detection:
# - Personal: CLAUDE_CONFIG_DIR contains "personal" → 🏠 cyan theme
# - Work:     CLAUDE_CONFIG_DIR contains "ipinfo"   → 💼 magenta theme

# Read JSON input
input=$(cat)

# Extract current directory from JSON
cwd=$(printf "%s" "$input" | jq -r '.workspace.current_dir')

# Detect account from CLAUDE_CONFIG_DIR
account="personal"
icon="🏠"
dir_color="\033[36m"            # cyan
branch_color_clean="\033[35m"   # magenta
branch_color_dirty="\033[33m"   # yellow

case "$CLAUDE_CONFIG_DIR" in
    *ipinfo*)
        account="work"
        icon="💼"
        dir_color="\033[36m"            # cyan
        branch_color_clean="\033[35m"   # magenta
        branch_color_dirty="\033[33m"   # yellow
        ;;
esac

# Get relative path (basename if in project root)
if [ -n "$cwd" ]; then
    dir=$(basename "$cwd")
else
    dir=$(basename "$(pwd)")
fi

# Get git branch if in a git repo
git_branch=""
if git rev-parse --git-dir >/dev/null 2>&1; then
    branch=$(git branch --show-current 2>/dev/null)
    if [ -n "$branch" ]; then
        # Check for uncommitted changes
        if ! git diff-index --quiet HEAD -- 2>/dev/null; then
            git_branch=" on ${branch_color_dirty}${branch}\033[0m [modified]"
        else
            git_branch=" on ${branch_color_clean}${branch}\033[0m"
        fi
    fi
fi

# Output with account-specific theme
printf "${icon} ${dir_color}%s\033[0m%b" "$dir" "$git_branch"
