--[[ File for universal-ctags

  Built as:

   cd /ford1/share/gmao_SIteam/universal-ctags/src
   wget https://github.com/universal-ctags/ctags/releases/download/v6.2.1/universal-ctags-6.2.1.tar.gz
   tar -xf universal-ctags-6.2.1.tar.gz

   ./configure --prefix=/ford1/share/gmao_SIteam/universal-ctags/6.2.1 |& tee configure.log
   make -j4 |& tee make.log
   make install |& tee makeinstall.log

--]]

local version = "6.2.1"
local installdir = "/ford1/share/gmao_SIteam/universal-ctags"

local pkgdir = pathJoin(installdir,version)

prepend_path("PATH",pathJoin(pkgdir,"bin"))
--prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
