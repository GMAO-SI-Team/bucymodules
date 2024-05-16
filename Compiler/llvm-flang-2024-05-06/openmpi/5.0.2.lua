--[[

  Built with:
 
  module load llvm-flang/2024-05-06

    mkdir build-llvm-flang-2024-05-06 && cd build-llvm-flang-2024-05-06
    ../configure --disable-wrapper-rpath --disable-wrapper-runpath \
        CC=clang CXX=clang++ FC=flang-new \
        --with-pmix=internal --with-hwloc=internal --with-libevent=internal \
        --prefix=/ford1/share/gmao_SIteam/MPI/openmpi/5.0.2/llvm-flang-2024-05-06 |& tee configure.llvm-flang-2024-05-06.log
   
    mv config.log config.llvm-flang-2024-05-06.log
    make -j4 |& tee make.llvm-flang-2024-05-06.log
    make install |& tee makeinstall.llvm-flang-2024-05-06.log
    make check |& tee makecheck.llvm-flang-2024-05-06.log

--]]

family("MPI")
prereq("llvm-flang/2024-05-06")

local compilername = "llvm-flang-2024-05-06"
local version = "5.0.2"
local siteamdir = "/ford1/share/gmao_SIteam"
local pkgdir = pathJoin(siteamdir,"MPI","openmpi",version,compilername)

-- Setup Modulepath for packages built by this MPI stack
local mroot = "/ford1/share/gmao_SIteam/lmodulefiles"
local mdir = pathJoin(mroot,"MPI/llvm-flang-2024-05-06",("openmpi-"..version))
prepend_path("MODULEPATH", mdir)

setenv("OPENMPI",pkgdir)
setenv("MPIHOME",pkgdir)
setenv("MPI_HOME",pkgdir)

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("INCLUDE",pathJoin(pkgdir,"include"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
