--[[ Ugly Lua module for OpenBLAS

Built as:

cd /ford1/share/gmao_SIteam/OpenBLAS/src
wget https://github.com/OpenMathLib/OpenBLAS/releases/download/v0.3.33/OpenBLAS-0.3.33.tar.gz
tar -xzf OpenBLAS-0.3.33.tar.gz
cd OpenBLAS-0.3.33

ml gcc/16.1.0

cmake -B build-gcc-16.1.0 -S . --install-prefix=/ford1/share/gmao_SIteam/OpenBLAS/gcc-16.1.0/0.3.33 |& tee cmake.gcc-16.1.0.log
cmake --build build-gcc-16.1.0 -j8 |& tee build.gcc-16.1.0.log
cmake --install build-gcc-16.1.0 |& tee install.gcc-16.1.0.log

--]]


local name = "OpenBLAS"
local compiler = "gcc-16.1.0"
local version = "0.3.33"
local installdir = "/ford1/share/gmao_SIteam"
local pkgdir = pathJoin(installdir,name,compiler,version)

whatis([===[loads the OpenBLAS 0.3.33 environment]===])

setenv("BLAS_ROOT",pkgdir)
setenv("LAPACK_ROOT",pkgdir)

prepend_path{"INCLUDE",pathJoin(pkgdir,"include")}
prepend_path{"CMAKE_PREFIX_PATH",pathJoin(pkgdir,"lib64/cmake")}
prepend_path{"PKG_CONFIG_PATH",pathJoin(pkgdir,"lib64/pkgconfig")}
