#!/bin/bash
set +e

# Configure SDDM theme and wallpaper
# plasma-chili only works with X11 greeter (Ubuntu), skip on Wayland greeter (Trixie)
if [ -d /usr/share/sddm/themes/plasma-chili ] && [ -f /etc/sddm.conf ]; then
	# Ubuntu: has /etc/sddm.conf, uses X11 greeter
	cp /usr/share/backgrounds/armbian/armbian03-Dre0x-Minum-dark-3840x2160.jpg \
		/usr/share/sddm/themes/plasma-chili/components/artwork/background.jpg 2>/dev/null || true
fi


mkdir -p /usr/share/glib-2.0/schemas
cat <<-EOF > /usr/share/glib-2.0/schemas/org.gnome.desktop.background.gschema.override
[org.gnome.desktop.background]
picture-uri='file:///usr/share/backgrounds/riscv/Riscv-0-logo.jpg'
show-desktop-icons=true
EOF
