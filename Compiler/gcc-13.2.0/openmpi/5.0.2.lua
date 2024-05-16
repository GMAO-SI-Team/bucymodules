--[[

  Built with:
 
    module load gcc/13.2.0

   mkdir build-gcc-13.2.0 && cd build-gcc-13.2.0
   ../configure --disable-wrapper-rpath --disable-wrapper-runpath \
       CC=gcc CXX=g++ FC=gfortran \
       --with-pmix=internal --with-hwloc=internal --with-libevent=internal \
       --prefix=/ford1/share/gmao_SIteam/MPI/openmpi/5.0.2/gcc-13.2.0 |& tee configure.gcc-13.2.0.log
 
   mv config.log config.gcc-13.2.0.log
   make -j4 |& tee make.gcc-13.2.0.log
   make install |& tee makeinstall.gcc-13.2.0.log
   make check |& tee makecheck.gcc-13.2.0.log

--]]

family("MPI")
prereq("gcc/13.2.0")

local compilername = "gcc-13.2.0"
local version = "5.0.2"
local siteamdir = "/ford1/share/gmao_SIteam"
local pkgdir = pathJoin(siteamdir,"MPI","openmpi",version,compilername)

-- Setup Modulepath for packages built by this MPI stack
local mroot = "/ford1/share/gmao_SIteam/lmodulefiles"
local mdir = pathJoin(mroot,"MPI/gcc-13.2.0",("openmpi-"..version))
prepend_path("MODULEPATH", mdir)

setenv("OPENMPI",pkgdir)
setenv("MPIHOME",pkgdir)
setenv("MPI_HOME",pkgdir)

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("INCLUDE",pathJoin(pkgdir,"include"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
