#!/usr/bin/env bash

WORK="$HOME/work"

ZOXIDE=$(zoxide query -l 2>/dev/null)
FOUND=$(fd . "$WORK" --type d --max-depth 2)

SELECTED=$(
    printf "%s\n%s\n" "$ZOXIDE" "$FOUND" |
        awk '!seen[$0]++' |
        fzf \
            --height=40% \
            --layout=reverse \
            --border \
            --prompt="Project > " \
            --preview '
if [ -f {}/README.md ]; then
    bat --style=plain {}/README.md
else
    eza -T {}
fi'
)

[ -z "$SELECTED" ] && exit

NAME=$(basename "$SELECTED")

case "$SELECTED" in
*/reverse/*)
    LAYOUT="reverse"
    ;;
*/notes/*)
    LAYOUT="notes"
    ;;
*)
    LAYOUT="dev"
    ;;
esac

if zellij list-sessions | grep -qx "$NAME"; then
    exec zellij attach "$NAME"
else
    cd "$SELECTED"
    exec zellij \
        --session "$NAME" \
        --layout "$HOME/.config/zellij/layouts/$LAYOUT.kdl"
fi
