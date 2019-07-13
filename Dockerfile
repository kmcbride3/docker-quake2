FROM ubuntu:18.04
MAINTAINER Tim Sogard <docker@timsogard.com>
add . /opt/quake2
run useradd -m -s /bin/bash quake2
run chown -R quake2:quake2 /opt/quake2
run dpkg --add-architecture i386
run apt-get update && apt-get upgrade -y
run apt-get install wget -y
run apt-get install libc6-i386 -y
run apt-get install lib32gcc1 lib32stdc++6 libcurl4-gnutls-dev:i386 -y
run wget https://skuller.net/q2pro/nightly/q2pro-server_linux_i386.tar.gz -O- | tar zxvf - -C /opt/quake2
expose 27910
workdir /opt/quake2
user quake2
#run /bin/bash
CMD ./q2proded +set dedicated 1 +set game wf +set gamedir wf +set ctf 1 +exec server.cfg
