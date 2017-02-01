#!/bin/bash

set -e
set -u

apt-get update
apt-get install -y curl \
  linux-image-extra-"$(uname -r)" \
  linux-image-extra-virtual \
  apt-transport-https \
  ca-certificates

curl -fsSL https://yum.dockerproject.org/gpg | sudo apt-key add -

add-apt-repository \
  "deb https://apt.dockerproject.org/repo/ \
  ubuntu-$(lsb_release -cs) \
  main"

add-apt-repository ppa:ubuntu-lxc/lxd-stable

apt-get update
apt-get -y install make docker-engine

curl -sL -o /usr/local/bin/docker-compose "https://github.com/docker/compose/releases/download/1.10.0/docker-compose-$(uname -s)-$(uname -m)"
chmod 755 /usr/local/bin/docker-compose

curl -sL -o /usr/local/bin/gimme https://raw.githubusercontent.com/travis-ci/gimme/master/gimme
chmod 755 /usr/local/bin/gimme

curl -sL -o /usr/local/bin/go1.7.sh https://gist.githubusercontent.com/nanliu/6aa364819d254500a1be3c4390f6abe5/raw/67950371c39b2e2bd9f77226c96116e7f2e9201e/go1.7.sh
chmod 755 /usr/local/bin/go1.7.sh

gimme 1.6
eval "$(gimme 1.7)"

GOPATH="${HOME}"/gopath
mkdir -p "$GOPATH"
go get github.com/Masterminds/glide

go get -d github.com/intelsdi-x/snap
cd "${GOPATH}/src/github.com/intelsdi-x/snap"
"${GOPATH}"/bin/glide install

sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

usermod -aG docker ubuntu

docker pull intelsdi/serverspec:alpine
docker pull intelsdi/snap:alpine_test
docker pull intelsdi/snap:precise_test
docker pull intelsdi/snap:trusty_test

exit 0
