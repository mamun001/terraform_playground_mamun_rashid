#!/bin/bash


# install packages and mount first efs volume
touch /tmp/start
echo ${efs_mount_point}, ${efs_mount_point_2} >/tmp/my_info.log
yum install -y amazon-efs-utils
yum install -y nfs-utils
mkdir /efs1
# Now we need to do some dumb string concatenation only because the target for efs mount is
# something like dnsname:/    /efs   (THE extra :/ after tghe DNS name is why we need the dumb concatenation below
MP=${efs_mount_point}
echo $MP >> /tmp/my_info.log
MP2="$MP:/"
echo $MP2 >> /tmp/my_info.log
mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 $MP2 /efs1


# mount 2nd efs volume
touch /tmp/start_2
mkdir /efs2
# Now we need to do some dumb string concatenation only because the target for efs mount is
# something like dnsname:/    /efs   (THE extra :/ after tghe DNS name is why we need the dumb concatenation below
MP3=${efs_mount_point_2}
echo $MP3 >> /tmp/my_info.log
MP4="$MP3:/"
echo $MP4 >> /tmp/my_info.log
mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 $MP4 /efs2

#
touch /tmp/finish
