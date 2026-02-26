--[[

This was cloned with:

git clone -j 4 --recurse-submodules -b v9.7.1 https://github.com/GEOS-ESM/ESMA-Baselibs.git ESMA-Baselibs-9.7.1/src

This was built using:

ml GEOSpyD/25.3.1-0/3.13 nag/7.2.43 openmpi/5.0.3-GillesNAGPatch

make -j6 install ESMF_COMM=openmpi CONFIG_SETUP='nagfor_7.2.43-openmpi_5.0.3-GillesNAGPatch' |& tee makeinstall.nagfor_7.2.43-openmpi_5.0.3-GillesNAGPatch.log

--]]

family("Baselibs")

local compilername = "nag-7.2.43"
local mpiname = "openmpi-5.0.3-GillesNAGPatch"

local configsetup = "nagfor_7.2.43-openmpi_5.0.3-GillesNAGPatch"

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
