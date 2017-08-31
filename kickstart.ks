# Kickstart file to build a tiny RHEL-7 Docker image
#version=DEVEL

bootloader --disable
timezone America/New_York --isUtc --nontp
rootpw --lock --iscrypted locked
user --name=none

# stuff to cut out
keyboard us
lang en_US
firewall --disable
zerombr
clearpart --all
part / --size 4096 --fstype xfs
reboot

%packages --excludedocs --instLangs=en --nocore
bash
vim-minimal
yum
systemd
python-rhsm
subscription-manager
rootfiles
gdb-gdbserver
yum-utils
findutils
-kernel
#yum-plugin-ovl is in server-optional
yum-plugin-ovl


%end

%post --log=/var/log/anaconda/anaconda-post.log

# remove the user anaconda forces us to make
userdel -r none

# Support for subscription-manager secrets
ln -s /run/secrets/etc-pki-entitlement /etc/pki/entitlement-host
ln -s /run/secrets/rhsm /etc/rhsm-host

#Certificate specifying product - RHEL Server
cat <<EOF > /etc/pki/product/69.pem
-----BEGIN CERTIFICATE-----
MIIGDTCCA/WgAwIBAgIJALDxRLt/tU6eMA0GCSqGSIb3DQEBBQUAMIGuMQswCQYD
VQQGEwJVUzEXMBUGA1UECAwOTm9ydGggQ2Fyb2xpbmExFjAUBgNVBAoMDVJlZCBI
YXQsIEluYy4xGDAWBgNVBAsMD1JlZCBIYXQgTmV0d29yazEuMCwGA1UEAwwlUmVk
IEhhdCBFbnRpdGxlbWVudCBQcm9kdWN0IEF1dGhvcml0eTEkMCIGCSqGSIb3DQEJ
ARYVY2Etc3VwcG9ydEByZWRoYXQuY29tMB4XDTE1MDkxMTExMDkyMloXDTM1MDkw
NjExMDkyMlowRDFCMEAGA1UEAww5UmVkIEhhdCBQcm9kdWN0IElEIFtlYjg5ZGVl
Ny1mNzg3LTQ3MjQtYmU3ZC03ZWEzMzJkMGQ5ZmFdMIICIjANBgkqhkiG9w0BAQEF
AAOCAg8AMIICCgKCAgEAxj9J04z+Ezdyx1U33kFftLv0ntNS1BSeuhoZLDhs18yk
sepG7hXXtHh2CMFfLZmTjAyL9i1XsxykQpVQdXTGpUF33C2qBQHB5glYs9+d781x
8p8m8zFxbPcW82TIJXbgW3ErVh8vk5qCbG1cCAAHb+DWMq0EAyy1bl/JgAghYNGB
RvKJObTdCrdpYh02KUqBLkSPZHvo6DUJFN37MXDpVeQq9VtqRjpKLLwuEfXb0Y7I
5xEOrR3kYbOaBAWVt3mYZ1t0L/KfY2jVOdU5WFyyB9PhbMdLi1xE801j+GJrwcLa
xmqvj4UaICRzcPATP86zVM1BBQa+lilkRQes5HyjZzZDiGYudnXhbqmLo/n0cuXo
QBVVjhzRTMx71Eiiahmiw+U1vGqkHhQNxb13HtN1lcAhUCDrxxeMvrAjYdWpYlpI
yW3NssPWt1YUHidMBSAJ4KctIf91dyE93aStlxwC/QnyFsZOmcEsBzVCnz9GmWMl
1/6XzBS1yDUqByklx0TLH+z/sK9A+O2rZAy1mByCYwVxvbOZhnqGxAuToIS+A81v
5hCjsCiOScVB+cil30YBu0cH85RZ0ILNkHdKdrLLWW4wjphK2nBn2g2i3+ztf+nQ
ED2pQqZ/rhuW79jcyCZl9kXqe1wOdF0Cwah4N6/3LzIXEEKyEJxNqQwtNc2IVE8C
AwEAAaOBljCBkzAJBgNVHRMEAjAAMDAGCysGAQQBkggJAUUBBCEMH1JlZCBIYXQg
RW50ZXJwcmlzZSBMaW51eCBTZXJ2ZXIwFAYLKwYBBAGSCAkBRQIEBQwDNy4yMBcG
CysGAQQBkggJAUUDBAgMBng4Nl82NDAlBgsrBgEEAZIICQFFBAQWDBRyaGVsLTcs
cmhlbC03LXNlcnZlcjANBgkqhkiG9w0BAQUFAAOCAgEAbx9SPI/5iWOEKo+hJ/98
ohRdsEO/4uClzInLpjkFtqHCtWVyv/nLhdiV2Xrvw7O+byGQFaehTIE3pmL+tsuQ
YcY9fMt3IZH+WslfMH4MnG+C9jR8exns3+TxshcnK9dykXuGkcWyHDY9YCyJx8n7
0XcwdrnHENsgx5kzv5FGipxwk0DUqZavv8d54H5fJlRKMfCJP4Qe9V67kB714twe
L0ggMh6Y9u68D5iP1BIF0wOEsqvGQ/Qm7KYY9LKwVkxVS4MK0Ysmj60PlLCWJaw7
HGY2nKkvxSnqXFcr43UDJVJYr9pawHf1Sp+yDToxUb1ok1Wnx3nLW6zjGzauMOUa
i6f/bALCjy67e0biNJ9gfknAUOtMj2/ucfRIlLhDXRPv61YDRrBta8bIs7ZiDHdi
R9BpKbqbZxwt8+dLOE9A9BiuF+pyO/vm6yJGY5tPFonKgzQ6JDg1AoVaZvhRt6hz
aNQ0O39nw0WJWlYQUPF7d1oHEdmyz9zZ3daqOyZ1bMyL6ktCMfPBTnKjg0sBKfso
mJKZW7ECMV54mFVetoHMhXK95J2gdj8KCCBRiMklNJ/CmObDLwVgiJ+aJyFWkhLx
D9gahhTI9drID4fuiO0rRIgSAD/22bGJY/OnBPq3Fs5Cvaw619Eqth7XjJCl4POb
Kp/OjOg7U7FJSsdrpQKT0/M=
-----END CERTIFICATE-----
EOF


# Set the language rpm nodocs transaction flag persistently in the
# image yum.conf and rpm macros

LANG="en_US"
echo "%_install_lang $LANG" > /etc/rpm/macros.image-language-conf

awk '(NF==0&&!done){print "override_install_langs='$LANG'\ntsflags=nodocs";done=1}{print}' \
    < /etc/yum.conf > /etc/yum.conf.new
mv /etc/yum.conf.new /etc/yum.conf

#TODO - workaround for #1105013
yum -y remove e2fsprogs xfsprogs e2fsprogs-libs

#systemd wrongly expects "unpopulated /etc" when /etc/machine-id does not exist
#let's leave machine-id empty
cat /dev/null > /etc/machine-id

#https://bugzilla.redhat.com/show_bug.cgi?id=1235969
#rm -f /etc/fstab
#this is not possible, guestmount needs fstab => brew build crashes without it
#fstab is removed in TDL when tar-ing files

rm -f /usr/lib/locale/locale-archive
#setup at least some locale, https://bugzilla.redhat.com/show_bug.cgi?id=1129697
localedef -v -c -i en_US -f UTF-8 en_US.UTF-8

#https://bugzilla.redhat.com/show_bug.cgi?id=1201663
rm -f /etc/systemd/system/multi-user.target.wants/rhsmcertd.service

#content of /run can not be prepared if /run is tmpfs (disappears on reboot)
umount /run
systemd-tmpfiles --create --boot

rm -rf /var/cache/yum/*
rm -f /tmp/ks-script*

%end
