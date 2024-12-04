--[[ Ugly Lua module for OpenBLAS

Built as:

ml gcc/14.2.0

cmake -B build-gcc-14.2.0 -S . --install-prefix=/ford1/share/gmao_SIteam/OpenBLAS/gcc-14.2.0/0.3.28 |& tee cmake.gcc-14.2.0.log
cmake --build build-gcc-14.2.0 -j8 |& tee build.gcc-14.2.0.log
cmake --install build-gcc-14.2.0 |& tee install.gcc-14.2.0.log

--]]


local name = "OpenBLAS"
local compiler = "gcc-14.2.0"
local version = "0.3.28"
local installdir = "/ford1/share/gmao_SIteam"
local pkgdir = pathJoin(installdir,name,compiler,version)

whatis([===[loads the OpenBLAS 0.3.28 environment]===])

setenv("BLAS_ROOT",pkgdir)
setenv("LAPACK_ROOT",pkgdir)

prepend_path{"INCLUDE",pathJoin(pkgdir,"include")}
prepend_path{"CMAKE_PREFIX_PATH",pathJoin(pkgdir,"lib64/cmake")}
prepend_path{"PKG_CONFIG_PATH",pathJoin(pkgdir,"lib64/pkgconfig")}
