--[[ Ugly Lua module for jemalloc

Built as:

mkdir build && cd build
../configure --prefix=/ford1/share/gmao_SIteam/Utilities/jemalloc/5.3.0
make -j8 |& tee make.log
make install |& tee makeinstall.log

--]]

local name = "jemalloc"
local version = "5.3.0"
local installdir = "/ford1/share/gmao_SIteam/Utilities"
local pkgdir = pathJoin(installdir,name,version)

whatis([===[loads the jemalloc 5.3.0 environment]===])

-- prepend_path{"PATH",pathJoin(pkgdir,"bin")}
-- prepend_path{"LD_LIBRARY_PATH",pathJoin(pkgdir,"lib")}
-- prepend_path{"LIBRARY_PATH",pathJoin(pkgdir,"lib")}
-- prepend_path{"INCLUDE",pathJoin(pkgdir,"include")}

prepend_path{"MANPATH",pathJoin(pkgdir,"share/man")}

setenv("JEMALLOC_ROOT_DIR",pkgdir)
setenv("JEMALLOC_INCLUDE_DIR",pathJoin(pkgdir,"include"))
setenv("JEMALLOC_LIB_DIR",pathJoin(pkgdir,"lib"))
