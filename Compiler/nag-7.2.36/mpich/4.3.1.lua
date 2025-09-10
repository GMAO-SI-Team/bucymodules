--[[

NOTE: MPICH 4.3.1 was patched with:

  https://github.com/pmodels/mpich/pull/7551/files

to avoid a bug (see https://github.com/pmodels/mpich/issues/7346)

Built with:

module load nag/7.2.36

mkdir build-nag-7.2.36 && cd build-nag-7.2.36
../configure \
   CC=gcc CXX=g++ FC=nagfor \
   MPICHLIB_FFLAGS='-mismatch -fpp' MPICHLIB_FCFLAGS='-mismatch -fpp' --enable-f08 \
   CFLAGS="-I/ford1/share/gmao_SIteam/nag/7.2.36/lib/NAG_Fortran" \
   --with-hwloc=embedded --with-libfabric=embedded --with-ucx=embedded --with-yaksa=embedded \
   --disable-efa --disable-verbs --disable-opx --disable-psm3 --disable-psm2 --disable-lnx \
   --prefix=/ford1/share/gmao_SIteam/MPI/mpich/4.3.1/nag-7.2.36 |& tee configure.nag-7.2.36.log

mv config.log config.nag-7.2.36.log
make -j4 |& tee make.nag-7.2.36.log
make install |& tee makeinstall.nag-7.2.36.log
make check |& tee makecheck.nag-7.2.36.log

--]]

family("MPI")
prereq("nag/7.2.36")

local compilername = "nag-7.2.36"
local version = "4.3.1"
local siteamdir = "/ford1/share/gmao_SIteam"
local pkgdir = pathJoin(siteamdir,"MPI","mpich",version,compilername)

-- Setup Modulepath for packages built by this MPI stack
local mroot = "/ford1/share/gmao_SIteam/lmodulefiles"
local mdir = pathJoin(mroot,"MPI/nag-7.2.36",("mpich-"..version))
prepend_path("MODULEPATH", mdir)

setenv("MPICH",pkgdir)
setenv("MPIHOME",pkgdir)
setenv("MPI_HOME",pkgdir)

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("INCLUDE",pathJoin(pkgdir,"include"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
