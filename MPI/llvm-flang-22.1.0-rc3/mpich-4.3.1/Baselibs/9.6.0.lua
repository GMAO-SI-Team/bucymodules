--[[

## Cloning

This was cloned with:

git clone -j 4 --recurse-submodules -b v9.6.0 https://github.com/GEOS-ESM/ESMA-Baselibs.git ESMA-Baselibs-9.6.0/src

## Building

### Modules

This was built using:

ml GEOSpyD/25.3.1-0/3.13 llvm-flang/22.1.0-rc3 mpich/4.3.1

### Build to HDF4

Next we build up to hdf4:

make -j6 install ESMF_COMM=mpich CONFIG_SETUP='flang_22.1.0-rc3-mpich_4.3.1' ALLDIRS='antlr2 gsl jpeg zlib szlib curl hdf4' |& tee makeinstall.flang_22.1.0-rc3-mpich_4.3.1.uptohdf4.log

### Build HDF5 (will need some hand edits after it crashes)

Then we build hdf5:

make -j6 install ESMF_COMM=mpich CONFIG_SETUP='flang_22.1.0-rc3-mpich_4.3.1' ALLDIRS='antlr2 gsl jpeg zlib szlib curl hdf4 hdf5' |& tee makeinstall.flang_22.1.0-rc3-mpich_4.3.1.hdf5.log

NOTE: This *used* to fail. Maybe Flang 22 now fixes it? I keep it here just in case:

This could fail. This is because it erroneously seem to think flang supports real2 and real3 (which it doesn't...yet?). So now you edit "hdf5/fortran/test/tf_gen.F90"
and comment out anything that has real_kind_2, real_eq_kind_2, real_kind_3, and real_eq_kind_3. (I am not sure how to "fix" this via a patch as it seems tf_gen is dynamically created at make time

### Build the rest

Then you can rebuild hdf5 and the rest with:

make -j6 install ESMF_COMM=mpich CONFIG_SETUP='flang_22.1.0-rc3-mpich_4.3.1' |& tee makeinstall.flang_22.1.0-rc3-mpich_4.3.1.after_hdf5.log

CDO seems to fail due to incomplete C++20 support (?). so we ignore that for now

--]]

family("Baselibs")

local compilername = "llvm-flang-22.1.0-rc3"
local mpiname = "mpich-4.3.1"

local configsetup = "flang_22.1.0-rc3-mpich_4.3.1"

-- local version = myModuleVersion()
local version = "9.6.0"
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
