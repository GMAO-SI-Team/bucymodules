--[[ Ugly Lua module for OpenBLAS

Built as:

wget https://github.com/OpenMathLib/OpenBLAS/releases/download/v0.3.34/OpenBLAS-0.3.34.tar.gz

ml llvm-flang/23.1.0

cmake -B build-llvm-flang-23.1.0 -S . --install-prefix=/ford1/share/gmao_SIteam/OpenBLAS/llvm-flang-23.1.0/0.3.34 |& tee cmake.llvm-flang-23.1.0.log
cmake --build build-llvm-flang-23.1.0 -j8 |& tee build.llvm-flang-23.1.0.log
cmake --install build-llvm-flang-23.1.0 |& tee install.llvm-flang-23.1.0.log

--]]


local name = "OpenBLAS"
local compiler = "llvm-flang-23.1.0"
local version = "0.3.34"
local installdir = "/ford1/share/gmao_SIteam"
local pkgdir = pathJoin(installdir,name,compiler,version)

whatis([===[loads the OpenBLAS 0.3.34 environment]===])

setenv("BLAS_ROOT",pkgdir)
setenv("LAPACK_ROOT",pkgdir)

prepend_path{"INCLUDE",pathJoin(pkgdir,"include")}
prepend_path{"CMAKE_PREFIX_PATH",pathJoin(pkgdir,"lib64/cmake")}
prepend_path{"PKG_CONFIG_PATH",pathJoin(pkgdir,"lib64/pkgconfig")}
