mkdir -p  /usr/dt/config
mkdir -p /etc/dt/config
cat >  /usr/dt/config/Xconfig << END
...skipping...
#  To disable listening for XDMCP requests from X-terminals.
#
#  Dtlogin.requestPort:       0


############################################################################
#  To disable R4 MIT-MAGIC-COOKIE-1 per-user authorization.
#
END
