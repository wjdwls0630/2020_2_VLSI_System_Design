#!/bin/tcsh -f
#
#
echo "FreePDK 45nm"


#all license
setenv SYNOPSYS_LM_LICENSE_FILE 27020@163.180.118.198
setenv MENTOR_LM_LICENSE_FILE 1717@163.180.118.198
setenv CADENCE_LM_LICENSE_FILE 5280@163.180.118.107

###############################################################################
#                                                                             #
# FreePDK Setup Script                                                        #
#    2/23/2008 by Rhett Davis (rhett_davis@ncsu.edu) 
#    4/29/2017 by Trang Dang  (trangdld@khu.ac.kr)                          #
#                                                                             #
###############################################################################

# Set the PDK_DIR variable to the root directory of the FreePDK distribution
setenv PDK_DIR /Tools/Library/FreePDK45
# Set CDSHOME to the root directory of the Cadence ICOA installatio
setenv CDSHOME /Tools/Cadence/IC616
setenv CDS_AUTO_64BIT ALL
set path=($CDSHOME/tools/bin $CDSHOME/bin $path)

if !(-f ${PWD}/.cdsinit ) then
  cp ${PDK_DIR}/ncsu_basekit/cdssetup/cdsinit ${PWD}/.cdsinit
endif

if !( -f ${PWD}/cds.lib ) then
  cp ${PDK_DIR}/ncsu_basekit/cdssetup/cds.lib ${PWD}/cds.lib
endif

if !( -f ${PWD}/lib.defs ) then
  cp ${PDK_DIR}/ncsu_basekit/cdssetup/lib.defs ${PWD}/lib.defs
endif

if !(-f ${PWD}/.runset.calibre.drc ) then
  cp ${PDK_DIR}/ncsu_basekit/cdssetup/runset.calibre.drc ${PWD}/.runset.calibre.drc
endif

if !(-f ${PWD}/.runset.calibre.lvs ) then
  cp ${PDK_DIR}/ncsu_basekit/cdssetup/runset.calibre.lvs ${PWD}/.runset.calibre.lvs
endif

if !(-f ${PWD}/.runset.calibre.lfd ) then
  cp ${PDK_DIR}/ncsu_basekit/cdssetup/runset.calibre.lfd ${PWD}/.runset.calibre.lfd
endif

if !(-f ${PWD}/.runset.calibre.pex ) then
  cp ${PDK_DIR}/ncsu_basekit/cdssetup/runset.calibre.pex ${PWD}/.runset.calibre.pex
endif

set present = `printenv PYTHONPATH`
if ($present == "") then
  setenv PYTHONPATH $PDK_DIR'/ncsu_basekit/techfile/cni'
else
  setenv PYTHONPATH $PYTHONPATH':'$PDK_DIR'/ncsu_basekit/techfile/cni'
endif

setenv MGC_CALIBRE_DRC_RUNSET_FILE ./.runset.calibre.drc
setenv MGC_CALIBRE_LVS_RUNSET_FILE ./.runset.calibre.lvs
setenv MGC_CALIBRE_PEX_RUNSET_FILE ./.runset.calibre.pex


#####################################################
##  Modify the line below with the path to your installation
##  of MMSIM from Cadence
#####################################################

setenv CDS_MMSIM_DIR /Tools/Cadence/MMSIM151
set path=($path $CDS_MMSIM_DIR/tools/bin $CDS_MMSIM_DIR/bin)



#####################################################
##  Modify the line below with the path to your installation
##  of ADMS / Eldo from Mentor
#####################################################
setenv opusver 616
setenv amsdbtype OpenAccess
setenv MGC_AMS_HOME /Tools/Mentor/AMS15
set path=($path $MGC_AMS_HOME/bin)





#################################################
##  Modify the line below with the path to your installation
##  of PVE
#################################################

setenv PVE_HOME /Tools/Cadence/ASSURA616 
set path=($path $PVE_HOME/tools/bin $PVE_HOME/bin)

#################################################
##  Modify the line below with the path to your installation
##  of QRC/EXT
#################################################

setenv QRC_HOME /Tools/Cadence/EXT15
set path=($path $QRC_HOME/tools/bin $QRC_HOME/bin)

#################################################
##  Modify the line below with the path to your installation
##  of PVS
#################################################

#setenv PVS_HOME /cmp3/cad/cdspvs15_14_000
#set path=($path $PVS_HOME/tools/bin $PVS_HOME/bin)

#######################################################
# Modify the LM_LICENSE_FILE with your installation ###
######  (Cadence license server) ######################
#######################################################

setenv LM_LICENSE_FILE $CADENCE_LM_LICENSE_FILE

##########################################################
######## Environment for Calibre ######################### 
# 1) Modify the path to Calibre installation #############
# 2) Modify the LM_LICENSE_FILE with your installation ###
##########################################################

setenv MGC_HOME /Tools/Mentor/Calibre2015/aoi_cal_2015.4_16.11
set path=($path $MGC_HOME/bin )

setenv LM_LICENSE_FILE ${LM_LICENSE_FILE}:$MENTOR_LM_LICENSE_FILE
setenv MGLS_LICENSE_FILE $MENTOR_LM_LICENSE_FILE

#################################
# If you are running on RedHat 6
# #################################
#setenv CALIBRE_2013_4_ALLOW_IXL_ON_RHEL6 101010
#setenv USE_CALIBRE_VCO ixl


#####################################################
##  Modify the line below with the path to your installation
##  of Hspice from Synopsys
#####################################################

setenv HSP_HOME /Tools/Synopsys/Hspice2015/hspice
#source $HSP_HOME/bin/cshrc.meta
set path=($path $HSP_HOME/bin)

#################################################
##  Modify the line below with the path to your installation
##  of StarRCXT from Synopsys
#################################################

setenv RCXT_HOME_DIR /Tools/Synopsys/StarRC/H-2013.06/amd64_starrc
setenv AVANTI_STAR_HOME_DIR $RCXT_HOME_DIR
set path=($path $AVANTI_STAR_HOME_DIR/bin)

setenv LM_LICENSE_FILE ${LM_LICENSE_FILE}:$SYNOPSYS_LM_LICENSE_FILE


#######################################################


#######################################################


