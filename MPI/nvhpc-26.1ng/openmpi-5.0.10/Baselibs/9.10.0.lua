--[[

This was cloned with:

  git clone -j 4 --recurse-submodules -b v9.10.0 https://github.com/GEOS-ESM/ESMA-Baselibs.git ESMA-Baselibs-9.10.0/src

This was built using:

ml GEOSpyD/26.3.2-0/3.14 nvhpc/26.1ng openmpi/5.0.10

make -j6 install ESMF_COMM=openmpi CONFIG_SETUP='nvfortran_26.1ng-openmpi_5.0.10' SYSTEM_ZLIB=YES |& tee makeinstall.nvfortran_26.1ng-openmpi_5.0.10.log

NOTE: The SYSTEM_ZLIB above is because of a weird NVHPC issue with zlib in baselibs. It also turns off zlib support in curl

--]]

family("Baselibs")

local compilername = "nvhpc-26.1ng"
local mpiname = "openmpi-5.0.10"

local configsetup = "nvfortran_26.1ng-openmpi_5.0.10"

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
