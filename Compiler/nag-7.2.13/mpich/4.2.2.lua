--[[

Built with:

module load nag/7.2.13

mkdir build-nag-7.2.13 && cd build-nag-7.2.13
../configure \
   CC=gcc CXX=g++ FC=nagfor \
   MPICHLIB_FFLAGS='-mismatch -fpp' MPICHLIB_FCFLAGS='-mismatch -fpp' --enable-f08 \
   CFLAGS="-I/ford1/share/gmao_SIteam/nag/7.2.13/lib/NAG_Fortran" \
   --prefix=/ford1/share/gmao_SIteam/MPI/mpich/4.2.2/nag-7.2.13 |& tee configure.nag-7.2.13.log

mv config.log config.nag-7.2.13.log
make -j4 |& tee make.nag-7.2.13.log
make install |& tee makeinstall.nag-7.2.13.log
make check |& tee makecheck.nag-7.2.13.log

--]]

family("MPI")
prereq("nag/7.2.13")

local compilername = "nag-7.2.13"
local version = "4.2.2"
local siteamdir = "/ford1/share/gmao_SIteam"
local pkgdir = pathJoin(siteamdir,"MPI","mpich",version,compilername)

-- Setup Modulepath for packages built by this MPI stack
local mroot = "/ford1/share/gmao_SIteam/lmodulefiles"
local mdir = pathJoin(mroot,"MPI/nag-7.2.13",("mpich-"..version))
prepend_path("MODULEPATH", mdir)

setenv("MPICH",pkgdir)
setenv("MPIHOME",pkgdir)
setenv("MPI_HOME",pkgdir)

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("INCLUDE",pathJoin(pkgdir,"include"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
