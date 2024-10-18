--[[

This was cloned with:

  git clone -j 4 --recurse-submodules -b v8.5.0 https://github.com/GEOS-ESM/ESMA-Baselibs.git ESMA-Baselibs-8.5.0/src

This was built using:

  ml llvm-flang/2024-08-21 mpich/4.2.2 GEOSpyD/Min24.4.0-0_py3.11

  make -j6 install ESMF_COMM=mpich CONFIG_SETUP='flang_2024-08-21-openmpi_5.0.4' |& tee makeinstall.flang_2024-08-21-openmpi_5.0.4.log

NOTENOTENOTE: This started out as an OpenMPI build but Open MPI couldn't build HDF5. So we moved to MPICH. But I was too lazy to rebuild
from scratch as before HDF5 nothing cares about MPI

--]]

family("Baselibs")

local compilername = "llvm-flang-2024-08-21"
local mpiname = "mpich-4.2.2"

local configsetup = "flang_2024-08-21-openmpi_4.2.2"

local version = myModuleVersion()
local baselibdir = "/ford1/share/gmao_SIteam/Baselibs/ESMA-Baselibs-" .. version
-- local pkgdir = pathJoin(baselibdir,"x86_64-pc-linux-gnu",configsetup)
local pkgdir = "/ford1/share/gmao_SIteam/Baselibs/ClangTest/ESMA-Baselibs-8.6.0-TEST/x86_64-pc-linux-gnu/flang_2024-08-21-openmpi_5.0.4"

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
