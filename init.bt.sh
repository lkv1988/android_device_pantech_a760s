#!/system/bin/sh
# airk908@gmail.com add for bluetooth a760s

BLUETOOTH_POWER_PATH=//sys/class/rfkill/rfkill0/state
BLUETOOTH_SLEEP_PATH=/proc/bluetooth/sleep/proto
LOG_TAG="bcm-bluetooth"
LOG_NAME="${0}:"

hciattach_pid=""

loge ()
{
  /system/bin/log -t $LOG_TAG -p e "$LOG_NAME $@"
}

logi ()
{
  /system/bin/log -t $LOG_TAG -p i "$LOG_NAME $@"
}

failed ()
{
  loge "$1: exit code $2"
  exit $2
}

start_hciattach ()
{
  echo 0 > $BLUETOOTH_POWER_PATH

  echo 1 > $BLUETOOTH_POWER_PATH

  echo "start_hciattach"

  echo 1 > $BLUETOOTH_SLEEP_PATH

  setprop service.brcm.bt.soft_onoff 1
}

kill_hciattach ()
{
  logi "kill_hciattach"

  setprop service.brcm.bt.soft_onoff 0

  echo 0 > $BLUETOOTH_POWER_PATH

  echo 0 > $BLUETOOTH_SLEEP_PATH
}

trap "kill_hciattach" TERM INT

start_hciattach

logi "Bluetooth stopped"

exit 0

