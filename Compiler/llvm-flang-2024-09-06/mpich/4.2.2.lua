--[[

Built with:

module load llvm-flang/2024-09-06

mkdir build-llvm-flang-2024-09-06 && cd build-llvm-flang-2024-09-06
../configure \
   CC=clang CXX=clang++ FC=flang-new \
   --prefix=/ford1/share/gmao_SIteam/MPI/mpich/4.2.2/llvm-flang-2024-09-06 |& tee configure.llvm-flang-2024-09-06.log

mv config.log config.llvm-flang-2024-09-06.log
make -j4 |& tee make.llvm-flang-2024-09-06.log
make install |& tee makeinstall.llvm-flang-2024-09-06.log
make check |& tee makecheck.llvm-flang-2024-09-06.log

--]]

family("MPI")
prereq("llvm-flang/2024-09-06")

local compilername = "llvm-flang-2024-09-06"
local version = "4.2.2"
local siteamdir = "/ford1/share/gmao_SIteam"
local pkgdir = pathJoin(siteamdir,"MPI","mpich",version,compilername)

-- Setup Modulepath for packages built by this MPI stack
local mroot = "/ford1/share/gmao_SIteam/lmodulefiles"
local mdir = pathJoin(mroot,"MPI/llvm-flang-2024-09-06",("mpich-"..version))
prepend_path("MODULEPATH", mdir)

setenv("MPICH",pkgdir)
setenv("MPIHOME",pkgdir)
setenv("MPI_HOME",pkgdir)

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("INCLUDE",pathJoin(pkgdir,"include"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
