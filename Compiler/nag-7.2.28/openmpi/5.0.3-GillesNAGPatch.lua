--[[

This is based off of a tarball from @ggouaillardet from https://github.com/open-mpi/ompi/issues/12413#issuecomment-2041302131

Built with:

module load nag/7.2.28

mkdir build-nag-7.2.28 && cd build-nag-7.2.28
../configure --disable-wrapper-rpath --disable-wrapper-runpath \
   CC=gcc CXX=g++ FC=nagfor \
   --with-pmix=internal --with-hwloc=internal --with-libevent=internal \
   --prefix=/ford1/share/gmao_SIteam/MPI/openmpi/5.0.3-GillesNAGPatch/nag-7.2.28 |& tee configure.nag-7.2.28.log

mv config.log config.nag-7.2.28.log
make -j4 |& tee make.nag-7.2.28.log
make install |& tee makeinstall.nag-7.2.28.log
make check |& tee makecheck.nag-7.2.28.log

--]]

family("MPI")
prereq("nag/7.2.28")

local compilername = "nag-7.2.28"
local version = "5.0.3-GillesNAGPatch"
local siteamdir = "/ford1/share/gmao_SIteam"
local pkgdir = pathJoin(siteamdir,"MPI","openmpi",version,compilername)

-- Setup Modulepath for packages built by this MPI stack
local mroot = "/ford1/share/gmao_SIteam/lmodulefiles"
local mdir = pathJoin(mroot,"MPI/nag-7.2.28",("openmpi-"..version))
prepend_path("MODULEPATH", mdir)

setenv("OPENMPI",pkgdir)
setenv("MPIHOME",pkgdir)
setenv("MPI_HOME",pkgdir)

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("INCLUDE",pathJoin(pkgdir,"include"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
