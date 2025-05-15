--[[

This was cloned with:

git clone -j 4 --recurse-submodules -b v8.14.0 https://github.com/GEOS-ESM/ESMA-Baselibs.git ESMA-Baselibs-8.14.0/src

This was built using:

ml GEOSpyD/24.11.3-0/3.12 gcc/14.2.0 openmpi/5.0.4

make -j6 install ESMF_COMM=openmpi CONFIG_SETUP='gfortran_14.2.0-openmpi_5.0.4' |& tee makeinstall.gfortran_14.2.0-openmpi_5.0.4.log

--]]

family("Baselibs")

local compilername = "gcc-14.2.0"
local mpiname = "openmpi-5.0.4"

local configsetup = "gfortran_14.2.0-openmpi_5.0.4"

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
