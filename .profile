. /etc/skel/.profile $@

[ -z "$DISPLAY" ] && [ "$XDG_VTNR" = "1" ] && exec startx -- vt$XDG_VTNR
:
