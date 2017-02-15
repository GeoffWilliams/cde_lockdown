mkdir -p /etc/dt/config
touch /etc/dt/config/Xservers
cat > /usr/dt/config/Xconfig <<END
############################################################################
Dtlogin.accessFile:            Xaccess

Dtlogin.servers:               Xservers

Dtlogin*resources:             %L/Xresources
Dtlogin*startup:               Xstartup
Dtlogin*reset:                 Xreset
END
