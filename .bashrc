[ -z "$PS1" ] && return

. /etc/skel/.bashrc $@

# source per-user bashrc files
[ -d ~/.bashrc.d ] || return

if tput init >&/dev/null; then
    GREEN=$(tput setaf 2)
    NORMAL=$(tput sgr0)
fi

echo -n "$GREEN["
for f in ~/.bashrc.d/*[!~]; do
    [ -r "$f" ] || continue
    echo -n "$SEP${f##*/}"
    . "$f"
    SEP="|"
done
unset SEP
echo "]$NORMAL"

# Local Variables:
# mode: sh
# End:
