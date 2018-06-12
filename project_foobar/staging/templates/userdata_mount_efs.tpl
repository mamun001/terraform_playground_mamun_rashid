#!/bin/bash
touch /tmp/start
# var2 has no impact on this code. Its just here in case , later, we need to pass 2 variables instead of one.
echo ${efs_mount_point}, ${var2} >/tmp/my_info.log
yum install -y amazon-efs-utils
yum install -y nfs-utils
mkdir /efs
# Now we need to do some dumb string concatenation only because the target for efs mount is
# something like dnsname:/    /efs   (THE extra :/ after tghe DNS name is why we need the dumb concatenation below
MP=${efs_mount_point}
echo $MP >> /tmp/my_info.log
MP2="$MP:/"
echo $MP2 >> /tmp/my_info.log
mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 $MP2 /efs
touch /tmp/finish
