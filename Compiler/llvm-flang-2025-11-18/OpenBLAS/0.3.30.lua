--[[ Ugly Lua module for OpenBLAS

Built as:

ml llvm-flang/2025-11-18

cmake -B build-llvm-flang-2025-11-18 -S . --install-prefix=/ford1/share/gmao_SIteam/OpenBLAS/llvm-flang-2025-11-18/0.3.30 |& tee cmake.llvm-flang-2025-11-18.log
cmake --build build-llvm-flang-2025-11-18 -j8 |& tee build.llvm-flang-2025-11-18.log
cmake --install build-llvm-flang-2025-11-18 |& tee install.llvm-flang-2025-11-18.log

--]]


local name = "OpenBLAS"
local compiler = "llvm-flang-2025-11-18"
local version = "0.3.30"
local installdir = "/ford1/share/gmao_SIteam"
local pkgdir = pathJoin(installdir,name,compiler,version)

whatis([===[loads the OpenBLAS 0.3.30 environment]===])

setenv("BLAS_ROOT",pkgdir)
setenv("LAPACK_ROOT",pkgdir)

prepend_path{"INCLUDE",pathJoin(pkgdir,"include")}
prepend_path{"CMAKE_PREFIX_PATH",pathJoin(pkgdir,"lib64/cmake")}
prepend_path{"PKG_CONFIG_PATH",pathJoin(pkgdir,"lib64/pkgconfig")}
