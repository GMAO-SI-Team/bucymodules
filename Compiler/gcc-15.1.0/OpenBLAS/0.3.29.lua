--[[ Ugly Lua module for OpenBLAS

Built as:

ml gcc/15.1.0

cmake -B build-gcc-15.1.0 -S . --install-prefix=/ford1/share/gmao_SIteam/OpenBLAS/gcc-15.1.0/0.3.29 |& tee cmake.gcc-15.1.0.log
cmake --build build-gcc-15.1.0 -j8 |& tee build.gcc-15.1.0.log
cmake --install build-gcc-15.1.0 |& tee install.gcc-15.1.0.log

--]]


local name = "OpenBLAS"
local compiler = "gcc-15.1.0"
local version = "0.3.29"
local installdir = "/ford1/share/gmao_SIteam"
local pkgdir = pathJoin(installdir,name,compiler,version)

whatis([===[loads the OpenBLAS 0.3.29 environment]===])

setenv("BLAS_ROOT",pkgdir)
setenv("LAPACK_ROOT",pkgdir)

prepend_path{"INCLUDE",pathJoin(pkgdir,"include")}
prepend_path{"CMAKE_PREFIX_PATH",pathJoin(pkgdir,"lib64/cmake")}
prepend_path{"PKG_CONFIG_PATH",pathJoin(pkgdir,"lib64/pkgconfig")}
