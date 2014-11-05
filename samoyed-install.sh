#!/bin/bash -x

SCRIPT=`readlink -f $0 | xargs dirname`
INSTALL=${SCRIPT}/install

VAGRANT=${INSTALL}/vagrant_1.6.5_x86_64.rpm
rpm -ivh ${VAGRANT} --force

BIN=/opt/vagrant/bin/vagrant
DEP1=${INSTALL}/builder-3.2.0.gem
DEP2=${INSTALL}/i18n-0.6.9.gem
DEP3=${INSTALL}/trollop-2.0.gem
DEP4=${INSTALL}/nokogiri-1.6.3.1.gem
DEP5=${INSTALL}/rbvmomi-1.8.2.gem
DEP6=${INSTALL}/vagrant-vsphere-0.13.0p3.gem

if [ -f ${BIN} ]; then
  for pkg in ${DEP1} ${DEP2} ${DEP3} ${DEP4} ${DEP5} ${DEP6}; do
    ${BIN} plugin install ${pkg}
  done
else
  echo "failed to install vagrant, please check..."
  exit 1
fi
