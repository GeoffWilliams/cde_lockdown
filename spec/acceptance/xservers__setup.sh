mkdir -p /etc/dt/config
touch /etc/dt/config/Xservers
# cleanup any existing content from old tests
rm /etc/dt/config/Xconfig

cat > /usr/dt/config/Xconfig <<END
############################################################################
Dtlogin.accessFile:            Xaccess

Dtlogin.servers:               Xservers

Dtlogin*resources:             %L/Xresources
Dtlogin*startup:               Xstartup
Dtlogin*reset:                 Xreset
END
