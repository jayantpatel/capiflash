# IBM_PROLOG_BEGIN_TAG
# This is an automatically generated prolog.
#
# $Source: src/build/install/makefile $
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
UNAME=$(shell uname)
ROOTPATH = ../../..

APPNAME?=capikv

PREFIX?=${PKGDIR}/install_root
TEST_PREFIX?=${PKGDIR}/test_root
AFUPREFIX?=${PKGDIR}/afu_root

ifeq ($(UNAME),AIX)
INSTALL_ROOT=${PREFIX}/usr/local/capikv
TEST_ROOT=${TEST_PREFIX}/usr/local/capikv
INSTALL=/usr/bin/cp
AFU_ROOT=${AFUPREFIX}/usr/local/capikv/afu
else
INSTALL_ROOT=${PREFIX}/opt/ibm/capikv
TEST_ROOT=${TEST_PREFIX}/opt/ibm/capikv
INSTALL=install
AFU_ROOT=${AFUPREFIX}/opt/ibm/capikv/afu
endif

_LIBSRCDIR=${IMGDIR}
_TESTSRCDIR=${TESTDIR}
_DOCSRCDIR=${ROOTPATH}/obj/doxygen
_RESOURCEDIR=${ROOTPATH}/src/build/install/resources

_BIN_DIR=${INSTALL_ROOT}/bin
_ETC_DIR=${INSTALL_ROOT}/etc
_EXAMPLES_DIR=${INSTALL_ROOT}/examples
_LIC_DIR=${INSTALL_ROOT}/license
_LIB_DIR=${INSTALL_ROOT}/lib
#_DOC_DIR=${INSTALL_ROOT}/doc
_TEST_DIR=${TEST_ROOT}/test
_TEST_DATA_DIR=${TEST_ROOT}/test/data
_INC_DIR=${INSTALL_ROOT}/include

_AFU_IMAGES_DIR=${AFU_ROOT}/images

_MAN_DIR=${PREFIX}/usr/share/man/man3
_SYSTEMD_DIR=${PREFIX}/usr/lib/systemd/system
_UDEV_RULES_DIR=${PREFIX}/lib/udev/rules.d
all:
	rm -rf ${INSTALL_ROOT}
	${MAKE} capikv capikv-test afuimage

capikv:
	@mkdir -p ${_BIN_DIR}
	@mkdir -p ${_ETC_DIR}
	@mkdir -p ${_LIB_DIR}
	@mkdir -p ${_LIC_DIR}
	@mkdir -p ${_EXAMPLES_DIR}
	@mkdir -p ${_MAN_DIR}
	@mkdir -p -m 755 ${_INC_DIR}
	@mkdir -p ${_SYSTEMD_DIR}
	@mkdir -p ${_UDEV_RULES_DIR}
ifeq ($(UNAME),AIX)
	${INSTALL} ${ROOTPATH}/src/kv/arkdb.h ${_INC_DIR}
	${INSTALL} ${ROOTPATH}/src/include/zmalloc.h ${_INC_DIR}
	${INSTALL} ${ROOTPATH}/src/include/capiblock.h ${_INC_DIR}
	${INSTALL} ${ROOTPATH}/src/include/cflash_tools_user.h ${_INC_DIR}
else
	${INSTALL} -m 644 ${ROOTPATH}/src/kv/arkdb.h ${_INC_DIR}
	${INSTALL} -m 644 ${ROOTPATH}/src/include/zmalloc.h ${_INC_DIR}
	${INSTALL} -m 644 ${ROOTPATH}/src/include/capiblock.h ${_INC_DIR}
	${INSTALL} -m 644 ${ROOTPATH}/src/include/cflash_tools_user.h ${_INC_DIR}

endif


	@#Bins
ifeq ($(UNAME),AIX)
	${INSTALL} ${_TESTSRCDIR}/asyncstress ${_BIN_DIR}
	${INSTALL} ${_TESTSRCDIR}/_tst_ark ${_BIN_DIR}
	${INSTALL} ${_TESTSRCDIR}/asyncstress64 ${_BIN_DIR}
	${INSTALL} ${_TESTSRCDIR}/_tst_ark64 ${_BIN_DIR}
	${INSTALL} ${_TESTSRCDIR}/blockio64 ${_BIN_DIR}
	${INSTALL} ${_TESTSRCDIR}/blocklistio64 ${_BIN_DIR}
	${INSTALL} ${_TESTSRCDIR}/blockplistio64 ${_BIN_DIR}
	${INSTALL} ${_TESTSRCDIR}/blockio ${_BIN_DIR}
	${INSTALL} ${_TESTSRCDIR}/blocklistio ${_BIN_DIR}
	${INSTALL} ${_TESTSRCDIR}/blockplistio ${_BIN_DIR}
	${INSTALL} ${_TESTSRCDIR}/run_kv_async64 ${_BIN_DIR}
	${INSTALL} ${_TESTSRCDIR}/run_kv_sync64 ${_BIN_DIR}
else
	${INSTALL} -s ${PGMDIR}/cxlfd ${_BIN_DIR}
	${INSTALL} -s ${PGMDIR}/cxlflashutil ${_BIN_DIR}
	${INSTALL} -s ${PGMDIR}/provtool ${_BIN_DIR}
	${INSTALL} -s ${_TESTSRCDIR}/asyncstress ${_BIN_DIR}
	${INSTALL} -s ${_TESTSRCDIR}/_tst_ark ${_BIN_DIR}
	${INSTALL} -s ${_TESTSRCDIR}/blockio ${_BIN_DIR}
	${INSTALL} -s ${_TESTSRCDIR}/blocklistio ${_BIN_DIR}
	${INSTALL} -s ${_TESTSRCDIR}/blockplistio ${_BIN_DIR}
	${INSTALL} -s ${_TESTSRCDIR}/run_kv_sync ${_BIN_DIR}
	${INSTALL} -s ${_TESTSRCDIR}/run_kv_async ${_BIN_DIR}

	${INSTALL} ${_RESOURCEDIR}/cxlfrefreshluns ${_BIN_DIR}
	${INSTALL} ${_RESOURCEDIR}/cablecheck ${_BIN_DIR}
	${INSTALL} ${_RESOURCEDIR}/cxlfsetlunmode ${_BIN_DIR}
	${INSTALL} ${_RESOURCEDIR}/cxlfstatus ${_BIN_DIR}
	${INSTALL} ${_RESOURCEDIR}/capikvutils.sh ${_BIN_DIR}
	${INSTALL} ${_RESOURCEDIR}/setup.sh ${_BIN_DIR}

	
	#TEMPORARY install - remove this after kernel driver can run workaround
	${INSTALL} ${_RESOURCEDIR}/afucfg.sh ${_BIN_DIR}


	@#Dev Permissions for cxl - set mode to 644 explicitly
	${INSTALL} -m 644 ${_RESOURCEDIR}/80-cxl.rules ${_UDEV_RULES_DIR}
	${INSTALL} -m 644 ${_RESOURCEDIR}/80-cxlflash.rules ${_UDEV_RULES_DIR}
endif
	
	@#Libs
ifeq ($(UNAME),AIX)
	${INSTALL} ${_LIBSRCDIR}/lib*.a ${_LIB_DIR}
else
	${INSTALL} -s ${_LIBSRCDIR}/lib*.so ${_LIB_DIR}
endif

	@#Sample Code
ifeq ($(UNAME),AIX)
	${INSTALL} ${ROOTPATH}/src/block/test/blockio.c ${_EXAMPLES_DIR}
	${INSTALL} ${ROOTPATH}/src/block/test/blocklistio.c ${_EXAMPLES_DIR}
	${INSTALL} ${ROOTPATH}/src/block/test/blockplistio.c ${_EXAMPLES_DIR}
	${INSTALL} ${ROOTPATH}/src/kv/test/run_kv_async.c ${_EXAMPLES_DIR}
	${INSTALL} ${ROOTPATH}/src/kv/test/run_kv_sync.c ${_EXAMPLES_DIR}

	@#Licenses
	${INSTALL} ${_RESOURCEDIR}/license/*.txt ${_LIC_DIR}
else
	${INSTALL} -m 644 ${ROOTPATH}/src/block/test/blockio.c ${_EXAMPLES_DIR}
	${INSTALL} -m 644 ${ROOTPATH}/src/block/test/blocklistio.c ${_EXAMPLES_DIR}
	${INSTALL} -m 644 ${ROOTPATH}/src/block/test/blockplistio.c ${_EXAMPLES_DIR}
	${INSTALL} -m 644 ${ROOTPATH}/src/kv/test/run_kv_async.c ${_EXAMPLES_DIR}
	${INSTALL} -m 644 ${ROOTPATH}/src/kv/test/run_kv_sync.c ${_EXAMPLES_DIR}

	@#Licenses
	${INSTALL} -m 644 ${_RESOURCEDIR}/license/*.txt ${_LIC_DIR}

	@#SystemD Daemons
	${INSTALL} -m 644 ${_RESOURCEDIR}/cxlfd.service ${_SYSTEMD_DIR}

	@#Linux Readme
	${INSTALL} -m 644 ${_RESOURCEDIR}/readme.txt ${INSTALL_ROOT}
endif

	@#Version tags and useful info
	echo "${GITREVISION}" > ${INSTALL_ROOT}/version.txt

capikv-test:	

	@#TEST ONLY CONTENT - DO NOT SHIP
	@mkdir -p ${_TEST_DIR}
	@mkdir -p ${_TEST_DATA_DIR}
	${INSTALL} ${_TESTSRCDIR}/blk_test ${_TEST_DIR}
	${INSTALL} ${_TESTSRCDIR}/pvtestauto ${_TEST_DIR}
	${INSTALL} ${_TESTSRCDIR}/pblkread ${_TEST_DIR}
	${INSTALL} ${_TESTSRCDIR}/transport_test ${_TEST_DIR}
	${INSTALL} ${_TESTSRCDIR}/run_cflash_fvt ${_TEST_DIR}
	${INSTALL} ${_TESTSRCDIR}/run_fvt_kv ${_TEST_DIR}
	${INSTALL} ${_TESTSRCDIR}/run_fvt ${_TEST_DIR}
	${INSTALL} ${_TESTSRCDIR}/run_block_fvt ${_TEST_DIR}
	${INSTALL} ${_TESTSRCDIR}/run_kv_async_multi ${_TEST_DIR}
	${INSTALL} ${_TESTSRCDIR}/run_kv_benchmark ${_TEST_DIR}
	${INSTALL} ${_TESTSRCDIR}/fvt_ark_io ${_TEST_DIR}
	${INSTALL} ${_TESTSRCDIR}/fvt_ark_mcio ${_TEST_DIR}
	${INSTALL} ${_TESTSRCDIR}/fvt_ark_mc_aio ${_TEST_DIR}
	${INSTALL} ${_TESTSRCDIR}/fvt_ark_perf ${_TEST_DIR}
	${INSTALL} ${_TESTSRCDIR}/fvt_ark_perf2 ${_TEST_DIR}
	${INSTALL} ${_TESTSRCDIR}/fvt_ark_perf_check ${_TEST_DIR}
	${INSTALL} ${_TESTSRCDIR}/fvt_ark_perf_tool ${_TEST_DIR}
	${INSTALL} ${_TESTSRCDIR}/fvt_kv_tst_ark ${_TEST_DIR}
	${INSTALL} ${ROOTPATH}/src/test/multi_process_perf ${_TEST_DIR}
	${INSTALL} ${ROOTPATH}/src/block/test/block_perf_check ${_TEST_DIR}
	@#Enable factory flash if the test image is installed
	${INSTALL} ${_RESOURCEDIR}/flash_factory_image ${_TEST_DIR}


ifeq ($(UNAME),AIX)
	${INSTALL} ${_TESTSRCDIR}/blk_test64 ${_TEST_DIR}
	${INSTALL} ${_TESTSRCDIR}/pvtestauto64 ${_TEST_DIR}
	${INSTALL} ${_TESTSRCDIR}/pblkread64 ${_TEST_DIR}
	${INSTALL} ${_TESTSRCDIR}/transport_test64 ${_TEST_DIR}
	${INSTALL} ${_TESTSRCDIR}/run_cflash_fvt64 ${_TEST_DIR}
	${INSTALL} ${_TESTSRCDIR}/run_fvt_kv64 ${_TEST_DIR}
	${INSTALL} ${_TESTSRCDIR}/run_fvt64 ${_TEST_DIR}
	${INSTALL} ${_TESTSRCDIR}/run_block_fvt64 ${_TEST_DIR}
	${INSTALL} ${_TESTSRCDIR}/run_kv_async_multi64 ${_TEST_DIR}
	${INSTALL} ${_TESTSRCDIR}/run_kv_benchmark64 ${_TEST_DIR}
	${INSTALL} ${_TESTSRCDIR}/fvt_ark_io64 ${_TEST_DIR}
	${INSTALL} ${_TESTSRCDIR}/fvt_ark_mcio64 ${_TEST_DIR}
	${INSTALL} ${_TESTSRCDIR}/fvt_ark_mc_aio64 ${_TEST_DIR}
	${INSTALL} ${_TESTSRCDIR}/fvt_ark_perf64 ${_TEST_DIR}
	${INSTALL} ${_TESTSRCDIR}/fvt_ark_perf_check64 ${_TEST_DIR}
	${INSTALL} ${_TESTSRCDIR}/fvt_ark_perf_tool64 ${_TEST_DIR}
	${INSTALL} ${_TESTSRCDIR}/fvt_kv_tst_ark64 ${_TEST_DIR}
	${INSTALL} ${ROOTPATH}/src/test/multi_process_perf ${_TEST_DIR}
	${INSTALL} ${ROOTPATH}/src/block/test/block_perf_check ${_TEST_DIR}
endif
ifeq ($(UNAME),AIX)
	@#Manpages - this is highly repetative
else
	@#seems like it could become its own make rule / recipe...
	${INSTALL} ${_DOCSRCDIR}/man/man3/afu.h.3 ${_MAN_DIR}
	${INSTALL} ${_DOCSRCDIR}/man/man3/cxl.h.3 ${_MAN_DIR}
	${INSTALL} ${_DOCSRCDIR}/man/man3/capiblock.h.3 ${_MAN_DIR}
	${INSTALL} ${_DOCSRCDIR}/man/man3/libcxl.h.3 ${_MAN_DIR}
	${INSTALL} ${_DOCSRCDIR}/man/man3/arkdb.h.3 ${_MAN_DIR}
	${INSTALL} ${_DOCSRCDIR}/man/man3/ark.h.3 ${_MAN_DIR}
	${INSTALL} ${_DOCSRCDIR}/man/man3/cflash_tools_user.h.3 ${_MAN_DIR}
	@#compress manpages in destination
	gzip -f ${_MAN_DIR}/*.h.3
endif

afuimage:
	@mkdir -p ${_AFU_IMAGES_DIR}
ifeq ($(UNAME),AIX) 
# need to have a valid ffdc mechanism for AIX...
else #Linux only
	${INSTALL} -s ${_TESTSRCDIR}/cxl_afu_dump ${AFU_ROOT}
	${INSTALL} ${_RESOURCEDIR}/capi_flash.pl ${AFU_ROOT}
	${INSTALL} ${_RESOURCEDIR}/blacklist-cxlflash.conf ${AFU_ROOT}
	${INSTALL} ${_RESOURCEDIR}/cxlffdc ${AFU_ROOT}
	${INSTALL} ${_RESOURCEDIR}/flash_all_adapters ${AFU_ROOT}
	${INSTALL} ${_RESOURCEDIR}/reload_all_adapters ${AFU_ROOT}
	${INSTALL} ${_RESOURCEDIR}/psl_trace_dump ${AFU_ROOT}
endif
	${INSTALL} ${_RESOURCEDIR}/corsa* ${_AFU_IMAGES_DIR}

include ${ROOTPATH}/config.mk
