--[[ File for tmux

  Built as:

   ./configure --prefix=/ford1/share/gmao_SIteam/tmux/3.6a |& tee configure.log
   make -j4 |& tee make.log
   make install |& tee makeinstall.log

--]]

local version = "3.6a"
local installdir = "/ford1/share/gmao_SIteam/tmux"

local pkgdir = pathJoin(installdir,version)

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
