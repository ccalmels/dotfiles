. /etc/skel/.profile $@

[ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = "1" ] && exec sway
:

# Local Variables:
# mode: sh
# End:
