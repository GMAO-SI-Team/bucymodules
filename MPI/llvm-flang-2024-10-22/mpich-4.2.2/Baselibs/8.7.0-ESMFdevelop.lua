--[[

This was cloned with:

  git clone -j 4 --recurse-submodules -b v8.5.0 https://github.com/GEOS-ESM/ESMA-Baselibs.git ESMA-Baselibs-8.5.0/src

I then had a *LOT* of hacks in hdf5 and ESMF. But I got something that worked with mpich

This was built using:

  ml llvm-flang/2024-10-22 mpich/4.2.2 GEOSpyD/24.7.1-0/3.11

  make -j6 install ESMF_COMM=mpich CONFIG_SETUP='flang_2024-10-22-mpich_4.2.2-ESMFdevelop' |& tee makeinstall.flang_2024-10-22-mpich_4.2.2-ESMFdevelop.log

--]]

family("Baselibs")

local compilername = "llvm-flang-2024-10-22"
local mpiname = "mpich-4.2.2"

local configsetup = "flang_2024-10-22-mpich_4.2.2-ESMFdevelop"

-- local version = myModuleVersion()
local version = "8.7.0"
local baselibdir = "/ford1/share/gmao_SIteam/Baselibs/ClangTest/ESMA-Baselibs-" .. version
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
