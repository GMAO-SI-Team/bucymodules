--[[

This was cloned with:

git clone -j 4 --recurse-submodules -b v8.20.0 https://github.com/GEOS-ESM/ESMA-Baselibs.git ESMA-Baselibs-8.20.0/src

This was built using:

ml GEOSpyD/24.11.3-0/3.12 ifx/2025.3 intelmpi/2021.17

make -j6 install ESMF_COMM=intelmpi CONFIG_SETUP='ifx_2025.3-intelmpi_2021.17-ifxfix' |& tee makeinstall.ifx_2025.3-intelmpi_2021.17-ifxfix.log

--]]

family("Baselibs")

local compilername = "ifx-2025.3"
local mpiname = "intelmpi-2021.17"

local configsetup = "ifx_2025.3-intelmpi_2021.17-ifxfix"

-- local version = myModuleVersion()
local version = "8.20.0"
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
