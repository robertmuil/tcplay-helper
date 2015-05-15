#!/bin/bash
# manage truecrypt containers using tcplay

user=$3
cryptdev=$2
mountpt=/mnt/truecrypt

# must be run as root
if (( $EUID != 0 )); then
  printf "%s\n" "You must be root to run this."
  exit 1
fi


# decrypt and mount container
if [[ $1 == open ]]; then
  loopdev=$(losetup -f)
  losetup "$loopdev" $cryptdev
  tcplay -m "$cryptdev" -d "$loopdev"

  # read passphrase
  read -r -s passphrase <<EOF
  "$passphrase"
EOF

  # mount container
  [[ -d $mountpt ]] || mkdir "$mountpt"

  # mount options
  userid=$(awk -F"[=(]" '{print $2,$4}' <(id "$user"))
  mount -o nodev,nosuid /dev/mapper/"$cryptdev" "$mountpt"

# close and clean up…
elif [[ $1 == close ]]; then
  devices=$(awk -v dev=$cryptdev -F":" '/dev/ {print $1}' <(losetup -a))
  umount "$mountpt"
  dmsetup remove "$cryptdev" || printf "%s\n" "demapping failed"

  while read -r deviceline; do

    losetup -d "$deviceline" || printf "%s\n" "deleting $deviceline failed"

  done <<< "$devices"
  
else
  printf "%s\n" "Usage: tc-play-helper.sh open/close container username"
fi