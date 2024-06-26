--[[

This was cloned with:

  git clone -j 4 --recurse-submodules -b v8.0.2 https://github.com/GEOS-ESM/ESMA-Baselibs.git ESMA-Baselibs-8.0.2/src

This was built using:

  ml ifort/2021.6.0 intelmpi/2021.6.0 GEOSpyD/Min23.5.2-0_py3.11

  make -j6 install ESMF_COMM=intelmpi CONFIG_SETUP='ifort_2022.1.0-intelmpi_2022.1.0' |& tee makeinstall.ifort_2022.1.0-intelmpi_2022.1.0.log

--]]

family("Baselibs")

local compilername = "ifort-2021.6.0"
local mpiname = "intelmpi-2021.6.0"

local configsetup = "ifort_2022.1.0-intelmpi_2022.1.0"

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