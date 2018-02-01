compton --vsync drm -b

synergys

for i in ~/.Xresources.d/* ; do
	echo \#include \"$i\"
done | xrdb -load

exec i3

# Local Variables:
# mode: sh
# End:
