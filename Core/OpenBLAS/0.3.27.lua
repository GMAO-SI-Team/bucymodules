--[[ Ugly Lua module for OpenBLAS

Built as:

mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/ford1/share/gmao_SIteam/OpenBLAS/0.3.27 |& tee cmake.log
make -j8 |& tee make.log
make install |& tee makeinstall.log
(optional, takes a while) make test


--]]


local name = "OpenBLAS"
local version = "0.3.27"
local installdir = "/ford1/share/gmao_SIteam"
local pkgdir = pathJoin(installdir,name,version)

whatis([===[loads the OpenBLAS 0.3.27 environment]===])

setenv("BLAS_ROOT",pkgdir)
setenv("LAPACK_ROOT",pkgdir)

prepend_path{"INCLUDE",pathJoin(pkgdir,"include")}
