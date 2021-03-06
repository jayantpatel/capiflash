#!/bin/bash -e
#  IBM_PROLOG_BEGIN_TAG
#  This is an automatically generated prolog.
#
#  $Source: src/build/install/resources/cxlfrefreshluns $
#
# IBM Data Engine for NoSQL - Power Systems Edition User Library Project
#
# Contributors Listed Below - COPYRIGHT 2014,2015
# [+] International Business Machines Corp.
#
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied. See the License for the specific language governing
# permissions and limitations under the License.
#
# IBM_PROLOG_END_TAG

set -e #halt on error
CAPIKV_ROOT=/opt/ibm/capikv


#allow us to die with a specific error code
die()
{
echo "$1" 1>&2;
exit $2;
}

echo "If you have not done so already, you may answer \"n\" and review the agreements in your local language, then re-run this script."
while true; do
read -p "Do you agree to the terms of the license agreements contained in $CAPIKV_ROOT/license/ ? [Y/n] " licagree
case $licagree in
[Yy]* ) break;;
[Nn]* ) exit 0;;
* ) echo "Please answer 'y' or 'n' at the prompt.";;
esac
done
echo "INFO: This software package no longer requires ssh access to the FlashSystem for LUN provisioning and management."
echo ""
echo "INFO: If not already completed, please:"
echo " 1. Create a host (or hosts) in the FlashSystem for the accelerator's WWPNs."
echo " 2. Map a 4096-byte formatted volume to that new host(s)."
echo " 3. Set each volume to 'superpipe' mode."
echo ""
echo "INFO: Please read $CAPIKV_ROOT/readme.txt for additional details."
echo "INFO: Refer to the readme initial administration steps. Setup is complete."