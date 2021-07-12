#!/system/bin/sh

# Set permissions for scripts
set_perm $MODPATH/post-fs-data.sh 0 0 755

exec su -c ln -s $MODPATH/post-fs-data.sh /data/adb/post-fs-data.d/

