--[[

This was cloned with:

git clone -j 4 --recurse-submodules -b v7.25.0 https://github.com/GEOS-ESM/ESMA-Baselibs.git ESMA-Baselibs-7.25.0/src

This was built using:

ml ifort/2021.13.0 intelmpi/2021.13 GEOSpyD/Min24.4.0-0_py3.11

make -j6 install ESMF_COMM=intelmpi CONFIG_SETUP='ifort_2021.13.0-intelmpi_2021.13' |& tee makeinstall.ifort_2021.13.0-intelmpi_2021.13.log

--]]

family("Baselibs")

local compilername = "ifort-2021.13.0"
local mpiname = "intelmpi-2021.13"

local configsetup = "ifort_2021.13.0-intelmpi_2021.13"

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
