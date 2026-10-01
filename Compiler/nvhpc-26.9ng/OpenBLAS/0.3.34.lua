--[[ Ugly Lua module for OpenBLAS

Built as:

wget https://github.com/OpenMathLib/OpenBLAS/releases/download/v0.3.34/OpenBLAS-0.3.34.tar.gz

ml nvhpc/26.9ng

cmake -B build-nvhpc-26.9ng -S . --install-prefix=/ford1/share/gmao_SIteam/OpenBLAS/nvhpc-26.9ng/0.3.34 |& tee cmake.nvhpc-26.9ng.log
cmake --build build-nvhpc-26.9ng -j8 |& tee build.nvhpc-26.9ng.log
cmake --install build-nvhpc-26.9ng |& tee install.nvhpc-26.9ng.log

--]]


local name = "OpenBLAS"
local compiler = "nvhpc-26.9ng"
local version = "0.3.34"
local installdir = "/ford1/share/gmao_SIteam"
local pkgdir = pathJoin(installdir,name,compiler,version)

whatis([===[loads the OpenBLAS 0.3.34 environment]===])

setenv("BLAS_ROOT",pkgdir)
setenv("LAPACK_ROOT",pkgdir)

prepend_path{"INCLUDE",pathJoin(pkgdir,"include")}
prepend_path{"CMAKE_PREFIX_PATH",pathJoin(pkgdir,"lib64/cmake")}
prepend_path{"PKG_CONFIG_PATH",pathJoin(pkgdir,"lib64/pkgconfig")}
