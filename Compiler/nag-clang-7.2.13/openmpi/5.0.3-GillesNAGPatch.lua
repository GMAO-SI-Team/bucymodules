--[[

This is based off of a tarball from @ggouaillardet from https://github.com/open-mpi/ompi/issues/12413#issuecomment-2041302131

Built with:

module load nag-clang/7.2.13

mkdir build-nag-clang-7.2.13 && cd build-nag-clang-7.2.13
../configure --disable-wrapper-rpath --disable-wrapper-runpath \
   CC=clang CXX=clang++ FC=nagfor \
   --with-pmix=internal --with-hwloc=internal --with-libevent=internal \
   --prefix=/ford1/share/gmao_SIteam/MPI/openmpi/5.0.3-GillesNAGPatch/nag-clang-7.2.13 |& tee configure.nag-clang-7.2.13.log

mv config.log config.nag-clang-7.2.13.log
make -j4 |& tee make.nag-clang-7.2.13.log
make install |& tee makeinstall.nag-clang-7.2.13.log
make check |& tee makecheck.nag-clang-7.2.13.log

--]]

family("MPI")
prereq("nag-clang/7.2.13")

local compilername = "nag-clang-7.2.13"
local version = "5.0.3-GillesNAGPatch"
local siteamdir = "/ford1/share/gmao_SIteam"
local pkgdir = pathJoin(siteamdir,"MPI","openmpi",version,compilername)

-- Setup Modulepath for packages built by this MPI stack
local mroot = "/ford1/share/gmao_SIteam/lmodulefiles"
local mdir = pathJoin(mroot,"MPI/nag-clang-7.2.13",("openmpi-"..version))
prepend_path("MODULEPATH", mdir)

setenv("OPENMPI",pkgdir)
setenv("MPIHOME",pkgdir)
setenv("MPI_HOME",pkgdir)

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("INCLUDE",pathJoin(pkgdir,"include"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
