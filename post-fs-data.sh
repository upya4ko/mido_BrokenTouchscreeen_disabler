#!/system/bin/sh

touchscreen_file='/dev/input/event2'
log_file='/sdcard/broken_screen.log'

# Wait for boot to complete
sleep 20
until [ "$(getprop sys.boot_completed)" ]
  do
    sleep 2
  done

ld -lsah $touchscreen_file >> $log_file

if [ -c $touchscreen_file ]
  then
    # exec drop su after run service.sh, so python run as user
    # if not run su again.

    echo "$(date) Delete  $touchscreen_file" >> $log_file
    exec su -c rm -f $touchscreen_file >> $log_file
  else
    echo "$(date) $touchscreen_file alteady absent"   >> $log_file
  fi

