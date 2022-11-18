for f in ~/.Xresources.d/*[!~] ; do
    echo \#include \"$f\"
done | xrdb -load

picom -b --vsync --backend glx

exec i3

# Local Variables:
# mode: sh
# End:
