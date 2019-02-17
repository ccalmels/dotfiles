for f in ~/.Xresources.d/*[!~] ; do
    echo \#include \"$f\"
done | xrdb -load

which compton && compton --backend xr_glx_hybrid &

exec i3

# Local Variables:
# mode: sh
# End:
