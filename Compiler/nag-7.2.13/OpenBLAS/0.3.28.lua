--[[ Ugly Lua module for OpenBLAS

Built as:

ml nag/7.2.13

cmake -B build-nag-7.2.13 -S . --install-prefix=/ford1/share/gmao_SIteam/OpenBLAS/nag-7.2.13/0.3.28 |& tee cmake.nag-7.2.13.log
cmake --build build-nag-7.2.13 -j8 |& tee build.nag-7.2.13.log
cmake --install build-nag-7.2.13 |& tee install.nag-7.2.13.log

--]]


local name = "OpenBLAS"
local compiler = "nag-7.2.13"
local version = "0.3.28"
local installdir = "/ford1/share/gmao_SIteam"
local pkgdir = pathJoin(installdir,name,compiler,version)

whatis([===[loads the OpenBLAS 0.3.28 environment]===])

setenv("BLAS_ROOT",pkgdir)
setenv("LAPACK_ROOT",pkgdir)

prepend_path{"INCLUDE",pathJoin(pkgdir,"include")}
prepend_path{"CMAKE_PREFIX_PATH",pathJoin(pkgdir,"lib64/cmake")}
prepend_path{"PKG_CONFIG_PATH",pathJoin(pkgdir,"lib64/pkgconfig")}
