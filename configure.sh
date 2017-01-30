#!/bin/bash

set -e
set -u
set -o pipefail

apt-get upgrade -f
apt-get install git -y
