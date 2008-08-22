# to force make to use /bin/sh
SHELL           = /bin/sh

#########################################################################
#                         Variable names
# xxxINCDIR  directory(ies) including header files (example: /usr/include)
# xxxINC  cc option(s) for include directory (example: -I/usr/inlude)
# xxxLIBDIR  directory(ies) containing library (example: /usr/lib)
# xxxLIBPATH cc option for library directory (example: -L/usr/lib)
# xxx_LIBNAME library name (example: gis)
# xxxLIB full static library path 
#        (example: /home/abc/grass63/dist.i686-pc-linux-gnu/lib/libgis.a)
# xxxDEP dependency
# 
# GRASS_xxx GRASS specific (without ARCH_xxx)
#
# ARCH_xxx platform specific dirs (without GRASS_xxx)
#
# _xxx  GRASS_xxx + ARCH_xxx
#
# ALLxxx all known for GRASS make system
#
#########################################################################

# GRASS global directories and constants
# platform specific dirs
ARCH_DISTDIR	= $(GRASS_HOME)/dist.$(ARCH)
ARCH_BINDIR     = $(GRASS_HOME)/bin.$(ARCH)
ERRORLOG        = $(GRASS_HOME)/error.log
# include dirs
ARCH_INCDIR     = $(ARCH_DISTDIR)/include/grass

ARCH_INC	= -I$(ARCH_DISTDIR)/include
INC		= $(ARCH_INC)
VECT_INC        = 

# libraries
ARCH_LIBDIR     = $(ARCH_DISTDIR)/lib

ARCH_LIBPATH	= -L$(ARCH_LIBDIR)
LIBPATH		= $(ARCH_LIBPATH)

# object dir
OBJDIR		= OBJ.$(ARCH)

#########################################################################
# these define the various directories which contain GRASS programs
# or files used by GRASS programs
GISBASE		= $(ARCH_DISTDIR)
BIN             = $(ARCH_DISTDIR)/bin
ETC             = $(ARCH_DISTDIR)/etc
DRIVERDIR       = $(ARCH_DISTDIR)/driver
DBDRIVERDIR     = $(ARCH_DISTDIR)/driver/db

FONTDIR         = $(ARCH_DISTDIR)/fonts

GRASS_VERSION_NUMBER  = $(GRASS_VERSION_MAJOR).$(GRASS_VERSION_MINOR).$(GRASS_VERSION_RELEASE)
GRASS_VERSION_NAME    = $(GRASS_VERSION_MAJOR)$(GRASS_VERSION_MINOR)$(GRASS_VERSION_RELEASE)

GRASS_VERSION_FILE    = $(ETC)/VERSION
GRASS_BUILD_FILE      = $(ETC)/BUILD

##################### other #############################################
CFLAGS      =  $(INC) $(COMPILE_FLAGS)
CXXFLAGS    =  $(INC) $(COMPILE_FLAGS_CXX)
LDFLAGS     =  $(LIBPATH) $(LINK_FLAGS) $(LD_SEARCH_FLAGS) $(PQLIBPATH)
VECT_CFLAGS =  $(GDALCFLAGS) 

# Object with _fmode which must be linked to each executable on Windows
ifdef MINGW
  FMODE_OBJ = $(MODULE_TOPDIR)/lib/gis/$(OBJDIR)/fmode.o
endif

##################### library names #####################################

ARRAYSTATS_LIBNAME        = grass_arraystats
BITMAP_LIBNAME        = grass_bitmap
BTREE_LIBNAME         = grass_btree
CLUSTER_LIBNAME       = grass_cluster
COORCNV_LIBNAME       = grass_coorcnv
DATETIME_LIBNAME      = grass_datetime
DBDIALOG_LIBNAME      = grass_dbdialog
DISPLAY_LIBNAME       = grass_display
DLG_LIBNAME           = grass_dlg
DSPF_LIBNAME          = grass_dspf
DRIVER_LIBNAME        = grass_driver
PNGDRIVER_LIBNAME     = grass_pngdriver
PSDRIVER_LIBNAME      = grass_psdriver
CAIRODRIVER_LIBNAME   = grass_cairodriver
HTMLDRIVER_LIBNAME    = grass_htmldriver
EDIT_LIBNAME          = grass_edit
G3D_LIBNAME	      = grass_g3d
GIS_LIBNAME	      = grass_gis
GMATH_LIBNAME         = grass_gmath
GPDE_LIBNAME          = grass_gpde
GPROJ_LIBNAME         = grass_gproj
IBTREE_LIBNAME        = grass_ibtree
ICON_LIBNAME          = grass_icon
IMAGERY_LIBNAME       = grass_imagery
IORTHO_LIBNAME        = grass_Iortho
IOSTREAM_LIBNAME      = grass_iostream
ISMAP_LIBNAME         = grass_ismap
LINKM_LIBNAME         = grass_linkm
LOCK_LIBNAME          = grass_lock
MANAGE_LIBNAME        = grass_manage
RASTER_LIBNAME        = grass_raster
ROWIO_LIBNAME         = grass_rowio
SEGMENT_LIBNAME       = grass_segment
STATS_LIBNAME	      = grass_stats
VASK_LIBNAME	      = grass_vask
XGD_LIBNAME	      = grass_Xgd
XGI_LIBNAME	      = grass_Xgi
XPM_LIBNAME	      = grass_Xpm

# Vector
DIG_LIBNAME           = grass_dig
DIG2_LIBNAME          = grass_dig2
VECTR_LIBNAME         = grass_vect
TRANS_LIBNAME         = grass_trans

SHAPE_LIBNAME         = grass_shape
GRAPH_LIBNAME         = grass_dgl
RTREE_LIBNAME         = grass_rtree

VEDIT_LIBNAME         = grass_vedit

# Interpolation
INTERPDATA_LIBNAME    = grass_interpdata
INTERPFL_LIBNAME      = grass_interpfl
QTREE_LIBNAME         = grass_qtree

# NVIZ related
OGSF_LIBNAME          = grass_ogsf
NVIZ_LIBNAME          = grass_nviz

# triangulation libraries
SOS_LIBNAME           = grass_sos
LIA_LIBNAME           = grass_lia
OPTRI_LIBNAME         = grass_optri
BASIC_LIBNAME         = grass_basic

XDISPLAY_LIBNAME      = grass_Xdisplay

# DBMI
DBMI_LIBNAME          = grass_dbmi
DBMIBASE_LIBNAME      = grass_dbmibase
DBMICLIENT_LIBNAME    = grass_dbmiclient
DBMIDRIVER_LIBNAME    = grass_dbmidriver
SQLP_LIBNAME          = grass_sqlp
DBSTUBS_LIBNAME       = grass_dbstubs

# database forms
FORM_LIBNAME          = grass_form

# Symbols (icons, patterns)
SYMB_LIBNAME          = grass_symb

# Normality
CDHC_LIBNAME          = grass_cdhc

# Lidar
LIDAR_LIBNAME         = grass_lidar

# Raster/SIMWE
SIM_LIBNAME           = grass_sim

# Sites (legacy)
SITES_LIBNAME         = grass_sites

# LRS
LRS_LIBNAME           = grass_lrs

##################### library switches ##################################

ARRAYSTATSLIB      = -l$(ARRAYSTATS_LIBNAME) $(GISLIB) 
BITMAPLIB     = -l$(BITMAP_LIBNAME) $(LINKMLIB) 
BTREELIB      = -l$(BTREE_LIBNAME)
CLUSTERLIB    = -l$(CLUSTER_LIBNAME) $(IMAGERYLIB) $(GISLIB)
COORCNVLIB    = -l$(COORCNV_LIBNAME)
DATETIMELIB   = -l$(DATETIME_LIBNAME)
DBDIALOGLIB   = -l$(DBDIALOG_LIBNAME)
DISPLAYLIB    = -l$(DISPLAY_LIBNAME) $(GISLIB) $(RASTERLIB) 
DLGLIB        = -l$(DLG_LIBNAME)
DSPFLIB       = -l$(DSPF_LIBNAME)
DRIVERLIB     = -l$(DRIVER_LIBNAME) $(GISLIB) $(FTLIB) $(ICONVLIB) 
PNGDRIVERLIB  = -l$(PNGDRIVER_LIBNAME) $(DRIVERLIB) $(GISLIB) $(PNGLIB) 
PSDRIVERLIB   = -l$(PSDRIVER_LIBNAME) $(DRIVERLIB) $(GISLIB) 
CAIRODRIVERLIB = -l$(CAIRODRIVER_LIBNAME) $(DRIVERLIB) $(GISLIB)
HTMLDRIVERLIB = -l$(HTMLDRIVER_LIBNAME) $(DRIVERLIB) $(GISLIB)
EDITLIB       = -l$(EDIT_LIBNAME) $(GISLIB) $(VASKLIB) 
G3DLIB        = -l$(G3D_LIBNAME) $(GISLIB) 
GISLIB        = -l$(GIS_LIBNAME) $(DATETIMELIB) $(XDRLIB) $(SOCKLIB) $(INTLLIB) 
GMATHLIB      = -l$(GMATH_LIBNAME) $(GISLIB) 
GPDELIB       = -l$(GPDE_LIBNAME) $(GISLIB) $(G3DLIB)
GPROJLIB      = -l$(GPROJ_LIBNAME) $(GISLIB) $(PROJLIB) $(GDALLIBS) 
IBTREELIB     = -l$(IBTREE_LIBNAME)
ICONLIB       = -l$(ICON_LIBNAME)
IMAGERYLIB    = -l$(IMAGERY_LIBNAME) $(GISLIB) 
IORTHOLIB     = -l$(IORTHO_LIBNAME) $(IMAGERYLIB) $(GISLIB) 
IOSTREAMLIB   = -l$(IOSTREAM_LIBNAME)
ISMAPLIB      = -l$(ISMAP_LIBNAME)
LINKMLIB      = -l$(LINKM_LIBNAME)
LOCKLIB       = -l$(LOCK_LIBNAME)
MANAGELIB     = -l$(MANAGE_LIBNAME)
RASTERLIB     = -l$(RASTER_LIBNAME) $(PNGDRIVERLIB) $(PSDRIVERLIB) $(DRIVERLIB) $(GISLIB) 
ROWIOLIB      = -l$(ROWIO_LIBNAME)
SEGMENTLIB    = -l$(SEGMENT_LIBNAME) $(GISLIB) 
STATSLIB      = -l$(STATS_LIBNAME) $(GISLIB) 
VASKLIB       = -l$(VASK_LIBNAME)
XGDLIB        = -l$(XGD_LIBNAME)
XGILIB        = -l$(XGI_LIBNAME)
XPMLIB        = -l$(XPM_LIBNAME)

# DBMI
DBMIBASELIB   = -l$(DBMIBASE_LIBNAME) $(GISLIB) 
DBMICLIENTLIB = -l$(DBMICLIENT_LIBNAME) $(DBMIBASELIB) $(GISLIB) 
DBMIDRIVERLIB = -l$(DBMIDRIVER_LIBNAME) $(DBMIBASELIB) $(DBSTUBSLIB) $(GISLIB) 
SQLPLIB       = -l$(SQLP_LIBNAME)
DBSTUBSLIB    = -l$(DBSTUBS_LIBNAME) $(DBMIBASELIB) $(GISLIB) 
DBMILIB       = $(DBMICLIENTLIB) $(DBMIBASELIB) $(DBMIEXTRALIB)

# Vector
DIGLIB        = -l$(DIG_LIBNAME)
DIG2LIB       = -l$(DIG2_LIBNAME) $(GISLIB) $(RTREELIB) 
VECTRLIB      = -l$(VECTR_LIBNAME) $(DBMIBASELIB) $(DBMICLIENTLIB) $(GRAPHLIB) $(DIG2LIB) $(GISLIB) $(LINKMLIB) $(RTREELIB) 
TRANSLIB      = -l$(TRANS_LIBNAME)
SHAPELIB      = -l$(SHAPE_LIBNAME)
GRAPHLIB      = -l$(GRAPH_LIBNAME)
RTREELIB      = -l$(RTREE_LIBNAME)
VEDITLIB      = -l$(VEDIT_LIBNAME) $(GISLIB) $(VECTRLIB)
VECTLIB       = $(VECTRLIB) $(DIG2LIB) $(GRAPHLIB) $(RTREELIB) $(LINKMLIB) $(DBMILIB) $(GDALLIBS)

# Interpolation
INTERPDATALIB = -l$(INTERPDATA_LIBNAME)
INTERPFLLIB   = -l$(INTERPFL_LIBNAME) $(BITMAPLIB) $(DBMIBASELIB) $(DBMICLIENTLIB) $(GISLIB) $(GMATHLIB) $(INTERPDATALIB) $(QTREELIB) $(VECTRLIB) 
QTREELIB      = -l$(QTREE_LIBNAME)

# NVIZ related
OGSFLIB       = -l$(OGSF_LIBNAME) $(BITMAPLIB) $(G3DLIB) $(GISLIB) $(SITESLIB) $(VECTRLIB) 
NVIZLIB       = -l$(NVIZ_LIBNAME) $(BITMAPLIB) $(G3DLIB) $(GISLIB) $(VECTRLIB) 

# triangulation libraries
SOSLIB        = -l$(SOS_LIBNAME)
LIALIB        = -l$(LIA_LIBNAME)
OPTRILIB      = -l$(OPTRI_LIBNAME)
BASICLIB      = -l$(BASIC_LIBNAME)
GEOMLIB       = $(OPTRILIB) $(SOSLIB) $(LIALIB) $(BASICLIB)		

# misc
XDISPLAYLIB   = -l$(XDISPLAY_LIBNAME)
FORMLIB       = -l$(FORM_LIBNAME) $(DBMIBASELIB) $(DBMICLIENTLIB) $(GISLIB) 
SYMBLIB       = -l$(SYMB_LIBNAME) $(GISLIB) 

# Normality
CDHCLIB       = -l$(CDHC_LIBNAME)

# Lidar
LIDARLIB      = -l$(LIDAR_LIBNAME) $(DBMIBASELIB) $(DBMICLIENTLIB) $(GISLIB) $(GMATHLIB) $(VECTRLIB) 

# Raster/SIMWE
SIMLIB        = -l$(SIM_LIBNAME) $(GISLIB) $(SITESLIB) 

# Sites (legacy)
SITESLIB      = -l$(SITES_LIBNAME) $(DATETIMELIB) $(DBMIBASELIB) $(DBMICLIENTLIB) $(GISLIB) $(VECTRLIB) 

# LRS
LRSLIB        = -l$(LRS_LIBNAME) $(DBMIBASELIB) $(DBMICLIENTLIB) $(GISLIB) 

##################### library dependencies ##############################

# These always static
ISMAPDEP    = $(ARCH_LIBDIR)/$(STLIB_PREFIX)$(ISMAP_LIBNAME)$(STLIB_SUFFIX)
MANAGEDEP   = $(ARCH_LIBDIR)/$(STLIB_PREFIX)$(MANAGE_LIBNAME)$(STLIB_SUFFIX)
IOSTREAMDEP = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(IOSTREAM_LIBNAME)$(STLIB_SUFFIX)

ARRAYSTATSDEP    = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(ARRAYSTATS_LIBNAME)$(LIB_SUFFIX)
BITMAPDEP   = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(BITMAP_LIBNAME)$(LIB_SUFFIX)
BTREEDEP    = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(BTREE_LIBNAME)$(LIB_SUFFIX)
COORCNVDEP  = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(COORCNV_LIBNAME)$(LIB_SUFFIX)
CLUSTERDEP  = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(CLUSTER_LIBNAME)$(LIB_SUFFIX)
DATETIMEDEP = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(DATETIME_LIBNAME)$(LIB_SUFFIX)
DBDIALOGDEP = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(DBDIALOG_LIBNAME)$(LIB_SUFFIX)
DISPLAYDEP  = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(DISPLAY_LIBNAME)$(LIB_SUFFIX)
DLGDEP      = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(DLG_LIBNAME)$(LIB_SUFFIX)
DRIVERDEP   = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(DRIVER_LIBNAME)$(LIB_SUFFIX)
PNGDRIVERDEP= $(ARCH_LIBDIR)/$(LIB_PREFIX)$(PNGDRIVER_LIBNAME)$(LIB_SUFFIX)
PSDRIVERDEP = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(PSDRIVER_LIBNAME)$(LIB_SUFFIX)
CAIRODRIVERDEP = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(CAIRODRIVER_LIBNAME)$(LIB_SUFFIX)
HTMLDRIVERDEP = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(HTMLDRIVER_LIBNAME)$(LIB_SUFFIX)
DSPFDEP     = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(DSPF_LIBNAME)$(LIB_SUFFIX)
EDITDEP     = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(EDIT_LIBNAME)$(LIB_SUFFIX)
G3DDEP      = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(G3D_LIBNAME)$(LIB_SUFFIX)
GISDEP      = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(GIS_LIBNAME)$(LIB_SUFFIX)
GMATHDEP    = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(GMATH_LIBNAME)$(LIB_SUFFIX)
GPDEDEP     = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(GPDE_LIBNAME)$(LIB_SUFFIX)
GPROJDEP    = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(GPROJ_LIBNAME)$(LIB_SUFFIX)
IBTREEDEP   = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(IBTREE_LIBNAME)$(LIB_SUFFIX)
ICONDEP     = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(ICON_LIBNAME)$(LIB_SUFFIX)
IMAGERYDEP  = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(IMAGERY_LIBNAME)$(LIB_SUFFIX)
IORTHODEP   = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(IORTHO_LIBNAME)$(LIB_SUFFIX)
LINKMDEP    = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(LINKM_LIBNAME)$(LIB_SUFFIX)
LOCKDEP     = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(LOCK_LIBNAME)$(LIB_SUFFIX)
RASTERDEP   = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(RASTER_LIBNAME)$(LIB_SUFFIX)
ROWIODEP    = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(ROWIO_LIBNAME)$(LIB_SUFFIX)
SEGMENTDEP  = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(SEGMENT_LIBNAME)$(LIB_SUFFIX)
STATSDEP    = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(STATS_LIBNAME)$(LIB_SUFFIX)
VASKDEP     = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(VASK_LIBNAME)$(LIB_SUFFIX)
XGDDEP	    = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(XGD_LIBNAME)$(LIB_SUFFIX)
XGIDEP	    = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(XGI_LIBNAME)$(LIB_SUFFIX)
XPMDEP	    = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(XPM_LIBNAME)$(LIB_SUFFIX)

# DBMI
DBMIBASEDEP     = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(DBMIBASE_LIBNAME)$(LIB_SUFFIX)
DBMICLIENTDEP   = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(DBMICLIENT_LIBNAME)$(LIB_SUFFIX)
DBMIDRIVERDEP   = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(DBMIDRIVER_LIBNAME)$(LIB_SUFFIX)
DBMIDEP         = $(DBMICLIENTDEP) $(DBMIBASEDEP)
SQLPDEP     = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(SQLP_LIBNAME)$(LIB_SUFFIX)
DBSTUBSDEP  = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(DBSTUBS_LIBNAME)$(LIB_SUFFIX)

# Vector
DIGDEP      = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(DIG_LIBNAME)$(LIB_SUFFIX)
DIG2DEP     = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(DIG2_LIBNAME)$(LIB_SUFFIX)
VECTRDEP    = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(VECTR_LIBNAME)$(LIB_SUFFIX)
TRANSDEP    = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(TRANS_LIBNAME)$(LIB_SUFFIX)
SHAPEDEP    = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(SHAPE_LIBNAME)$(LIB_SUFFIX)
GRAPHDEP    = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(GRAPH_LIBNAME)$(LIB_SUFFIX)
RTREEDEP    = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(RTREE_LIBNAME)$(LIB_SUFFIX)
VEDITDEP    = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(VEDIT_LIBNAME)$(LIB_SUFFIX)
VECTDEP     = $(VECTRDEP) $(DIG2DEP) $(GRAPHDEP) $(RTREEDEP) $(LINKMDEP) $(DBMIDEP)

# Interpolation
INTERPDATADEP = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(INTERPDATA_LIBNAME)$(LIB_SUFFIX)
INTERPFLDEP   = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(INTERPFL_LIBNAME)$(LIB_SUFFIX)
QTREEDEP      = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(QTREE_LIBNAME)$(LIB_SUFFIX)

# NVIZ related
OGSFDEP      = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(OGSF_LIBNAME)$(LIB_SUFFIX)
NVIZDEP      = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(NVIZ_LIBNAME)$(LIB_SUFFIX)

# triangulation libraries
SOSDEP      = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(SOS_LIBNAME)$(LIB_SUFFIX)
LIADEP      = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(LIA_LIBNAME)$(LIB_SUFFIX)
OPTRIDEP    = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(OPTRI_LIBNAME)$(LIB_SUFFIX)
BASICDEP    = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(BASIC_LIBNAME)$(LIB_SUFFIX)
GEOMDEP     = $(OPTRIDEP) $(SOSDEP) $(LIADEP) $(BASICDEP)

# misc
XDISPLAYDEP = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(XDISPLAY_LIBNAME)$(LIB_SUFFIX)
FORMDEP     = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(FORM_LIBNAME)$(LIB_SUFFIX)
SYMBDEP     = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(SYMB_LIBNAME)$(LIB_SUFFIX)

# Normality
CDHCDEP     = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(CDHC_LIBNAME)$(LIB_SUFFIX)

# Lidar
LIDARDEP    = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(LIDAR_LIBNAME)$(LIB_SUFFIX)

# Raster/SIMWE
SIMDEP      = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(SIM_LIBNAME)$(LIB_SUFFIX)

# Sites (legacy)
SITESDEP    = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(SITES_LIBNAME)$(LIB_SUFFIX)

# LRS
LRSDEP      = $(ARCH_LIBDIR)/$(LIB_PREFIX)$(LRS_LIBNAME)$(LIB_SUFFIX)

##################### rules #############################################
# first found target
first: pre default
	@if test -n "$(INST_NOW)" ; then \
		$(MAKE) inst_now ; \
	fi

# This helps compile and install modules directly into $(INST_DIR)
# without having to install whole distribution even after modifying only
# one module. It will update both $(GRASS_HOME)/dist.$(ARCH) and $(INST_DIR).
# Usage:
#	INST_NOW=y make
# alias gmake='INST_NOW=y make' will be useful.
ifdef INST_NOW
ARCH_DISTDIR = $(INST_DIR)
ARCH_BINDIR = $(UNIX_BIN)
endif

inst_now:
	INST_NOW= $(MAKE)

# create platform dirs 
pre: $(ARCH_BINDIR) $(ARCH_INCDIR) $(ARCH_LIBDIR) \
	$(BIN) $(ETC) \
	$(DRIVERDIR) $(DBDRIVERDIR) $(FONTDIR)

$(ARCH_BINDIR):
	mkdir -p $(ARCH_BINDIR)

$(ARCH_INCDIR):
	mkdir -p $(ARCH_INCDIR)

$(ARCH_LIBDIR):
	mkdir -p $(ARCH_LIBDIR)

$(BIN):
	mkdir -p $(BIN)

$(ETC):
	mkdir -p $(ETC)

$(DRIVERDIR):
	mkdir -p $(DRIVERDIR)

$(DBDRIVERDIR):
	mkdir -p $(DBDRIVERDIR)

$(FONTDIR):
	mkdir -p $(FONTDIR)

