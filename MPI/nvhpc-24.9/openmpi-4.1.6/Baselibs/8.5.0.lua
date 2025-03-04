--[[

This was cloned with:

  git clone -j 4 --recurse-submodules -b v8.5.0 https://github.com/GEOS-ESM/ESMA-Baselibs.git ESMA-Baselibs-8.5.0/src

  NOTE: I also updated pFlogger to v1.15.0

This was built using:

ml nvhpc/24.9 openmpi/4.1.6 GEOSpyD/24.7.1-0/3.11

make -j6 install ESMF_COMM=openmpi CONFIG_SETUP='nvfortran_24.9-openmpi_4.1.6' SYSTEM_ZLIB=YES |& tee makeinstall.nvfortran_24.9-openmpi_4.1.6.log

NOTE: The SYSTEM_ZLIB above is because of a weird NVHPC issue with zlib in baselibs. It also turns off zlib support in curl

--]]

family("Baselibs")

local compilername = "nvhpc-24.9"
local mpiname = "openmpi-4.1.6"

local configsetup = "nvfortran_24.9-openmpi_4.1.6"

local version = myModuleVersion()
local baselibdir = "/ford1/share/gmao_SIteam/Baselibs/ESMA-Baselibs-" .. version
local pkgdir = pathJoin(baselibdir,"x86_64-pc-linux-gnu",configsetup)

-- Setup Modulepath for packages built by this MPI stack
local mroot = "/ford1/share/gmao_SIteam/lmodulefiles"
local mdir = pathJoin(mroot,"Baselibs",compilername,mpiname)
prepend_path("MODULEPATH", mdir)

setenv("BASEDIR",pkgdir)
setenv("basedir",pkgdir)
setenv("BASEBIN",pathJoin(pkgdir,"Linux/bin"))

prepend_path("PATH",pathJoin(pkgdir,"Linux/bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"Linux/lib"))
prepend_path("DYLD_LIBRARY_PATH",pathJoin(pkgdir,"Linux/lib"))
prepend_path("MANPATH",pathJoin(pkgdir,"Linux/share/man"))

setenv("UDUNITS2_XML_PATH",pathJoin(pkgdir,"Linux/share/udunits/udunits2.xml"))
