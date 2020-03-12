#!/usr/bin/make -f
# -*- makefile -*-
# Sample debian/rules that uses debhelper.

%:
	dh $@ --buildsystem=cmake

override_dh_auto_configure:
# In case we're installing to a non-standard location, look for a setup.sh
# in the install tree that was dropped by catkin, and source it. It will
# set things like CMAKE_PREFIX_PATH, PKG_CONFIG_PATH, and PYTHONPATH.
if [ -f "@(InstallationPrefix)/setup.sh" ]; then . "@(InstallationPrefix)/setup.sh"; fi && \
dh_auto_configure -- \
-DSWARMIO_MULTISTRAP_CONFIGURATION=xenial-ros \
-DSWARMIO_BUILD_ROS_NODE=ON

override_dh_auto_build:
# In case we're installing to a non-standard location, look for a setup.sh
# in the install tree that was dropped by catkin, and source it. It will
# set things like CMAKE_PREFIX_PATH, PKG_CONFIG_PATH, and PYTHONPATH.
if [ -f "@(InstallationPrefix)/setup.sh" ]; then . "@(InstallationPrefix)/setup.sh"; fi && \
dh_auto_build -- \

override_dh_auto_test:
# In case we're installing to a non-standard location, look for a setup.sh
# in the install tree that was dropped by catkin, and source it. It will
# set things like CMAKE_PREFIX_PATH, PKG_CONFIG_PATH, and PYTHONPATH.
echo -- Running tests. Even if one of them fails the build is not canceled.
if [ -f "@(InstallationPrefix)/setup.sh" ]; then . "@(InstallationPrefix)/setup.sh"; fi && \
dh_auto_test || true

override_dh_shlibdeps:
# In case we're installing to a non-standard location, look for a setup.sh
# in the install tree that was dropped by catkin, and source it. It will
# set things like CMAKE_PREFIX_PATH, PKG_CONFIG_PATH, and PYTHONPATH.
if [ -f "@(InstallationPrefix)/setup.sh" ]; then . "@(InstallationPrefix)/setup.sh"; fi && \
dh_shlibdeps -l$(CURDIR)/debian/@(Package)/@(InstallationPrefix)/lib/

override_dh_auto_install:
# In case we're installing to a non-standard location, look for a setup.sh
# in the install tree that was dropped by catkin, and source it. It will
# set things like CMAKE_PREFIX_PATH, PKG_CONFIG_PATH, and PYTHONPATH.
if [ -f "@(InstallationPrefix)/setup.sh" ]; then . "@(InstallationPrefix)/setup.sh"; fi && \
dh_auto_install -- \
-DSWARMIO_BUILD_MODE=INSTALL

override_dh_clean:
# In case we're installing to a non-standard location, look for a setup.sh
# in the install tree that was dropped by catkin, and source it. It will
# set things like CMAKE_PREFIX_PATH, PKG_CONFIG_PATH, and PYTHONPATH.
if [ -f "@(InstallationPrefix)/setup.sh" ]; then . "@(InstallationPrefix)/setup.sh"; fi
