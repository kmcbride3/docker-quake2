FROM ubuntu:18.04
MAINTAINER Tim Sogard <docker@timsogard.com>
add . /opt/quake2
run useradd -m -s /bin/bash quake2
run chown -R quake2:quake2 /opt/quake2
run apt-get update
run apt-get install wget -y
run wget http://skuller.net/q2pro/nightly/q2pro-server_linux_amd64.tar.gz -O- | tar zxvf - -C /opt/quake2
expose 27910
workdir /opt/quake2
user quake2
#run /bin/bash
CMD ./q2proded +set dedicated 1 +set game wf +set gamedir wf +set ctf 1 +exec server.cfg
