# Use global profile when available
if [ -f /usr/share/defaults/etc/profile ]; then
	source /usr/share/defaults/etc/profile
fi
# allow admin overrides
if [ -f /etc/profile ]; then
	source /etc/profile
fi

function c() {
	builtin cd $@ && ls
}

