--[[

This was cloned with:

git clone -j 4 --recurse-submodules -b v8.14.0 https://github.com/GEOS-ESM/ESMA-Baselibs.git ESMA-Baselibs-8.14.0/src

I then had a *LOT* of hacks in hdf5 and ESMF. But I got something that worked with mpich

This was built using:

ml GEOSpyD/24.11.3-0/3.12 llvm-flang/2025-07-28 mpich/4.3.1

Next we build up to hdf4:

make -j6 install ESMF_COMM=mpich CONFIG_SETUP='flang_2025-07-28-mpich_4.3.1' ALLDIRS='antlr2 gsl jpeg zlib szlib curl hdf4' |& tee makeinstall.flang_2025-07-28-mpich_4.3.1.uptohdf4.log

Then we build hdf5:

make -j6 install ESMF_COMM=mpich CONFIG_SETUP='flang_2025-07-28-mpich_4.3.1' ALLDIRS='antlr2 gsl jpeg zlib szlib curl hdf4 hdf5' |& tee makeinstall.flang_2025-07-28-mpich_4.3.1.hdf5.log

THIS WILL FAIL! This is because it erroneously seem to think flang supports real2 and real3 (which it doesn't...yet?). So now you edit "hdf5/fortran/test/tf_gen.F90" 
and comment out anything that has real_kind_2, real_eq_kind_2, real_kind_3, and real_eq_kind_3. (I am not sure how to "fix" this via a patch as it seems tf_gen is dynamically created at make time

Then you can rebuild hdf5:

make -j6 install ESMF_COMM=mpich CONFIG_SETUP='flang_2025-07-28-mpich_4.3.1' ALLDIRS='antlr2 gsl jpeg zlib szlib curl hdf4 hdf5' |& tee makeinstall.flang_2025-07-28-mpich_4.3.1.hdf5.rebuild.log

Now we can build up to FMS:

make -j6 install ESMF_COMM=mpich CONFIG_SETUP='flang_2025-07-28-mpich_4.3.1' ALLDIRS='antlr2 gsl jpeg zlib szlib curl hdf4 hdf5 netcdf netcdf-fortran netcdf-cxx4 udunits2 nco cdo nccmp libyaml FMS' |& tee makeinstall.flang_2025-07-28-mpich_4.3.1.uptoFMS.log

FMS seems to fail as does CDO due to incomplete C++20 support (?). so we ignore that for now and build esmf:

make -j6 install ESMF_COMM=mpich CONFIG_SETUP='flang_2025-07-28-mpich_4.3.1' ALLDIRS='antlr2 gsl jpeg zlib szlib curl hdf4 hdf5 netcdf netcdf-fortran netcdf-cxx4 udunits2 nco nccmp libyaml esmf' |& tee makeinstall.flang_2025-07-28-mpich_4.3.1.esmf.log

NOTE: This requires some edits to Base.mk due to flang --> flang-new change.

--]]

family("Baselibs")

local compilername = "llvm-flang-2025-07-28"
local mpiname = "mpich-4.3.1"

local configsetup = "flang_2025-07-28-mpich_4.3.1-ESMFdevelop"

-- local version = myModuleVersion()
local version = "8.14.0"
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
