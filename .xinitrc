# custom keymap
if [ -f "$usermodmap" ]; then
  xmodmap "$usermodmap"
fi
# execute system-wide xinitrc scripts
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# statusbar loop
while true; do
  # define variables
  INTERFACE=$(ip -o -4 route show default | awk '{print $5}' | head -n1)
  IPADDR=$(ip -o -4 addr show "$INTERFACE" | awk '{print $4}' | cut -d/ -f1)
  DATE=$(date +"%F %R")

  # update the status bar
  xsetroot -name "[$INTERFACE: $IPADDR]  [$DATE]"
  sleep 1m    # Update time every minute
done &

exec dwm