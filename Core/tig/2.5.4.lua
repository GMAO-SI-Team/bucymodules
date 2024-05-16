--[[ File for tig

  Built as:

   ./configure --prefix=/ford1/share/gmao_SIteam/tig/2.5.4 |& tee configure.log
   make -j4 |& tee make.log
   make install install-doc |& tee makeinstall.log
 
--]]

local version = "2.5.4"
local installdir = "/ford1/share/gmao_SIteam/tig"

local pkgdir = pathJoin(installdir,version)

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
