--[[ File for xxdiff

First cloned with:

  git clone https://github.com/blais/xxdiff.git

Then had Bob install qt5-devel to get qmake.

Then did:

  cd src

Next edit Makefile.bootstrap and set:

  QMAKE ?= qmake-qt5

then:

  ml GEOSpyD

as it's needed for some documentation thing. Then:

  make -f Makefile.bootstrap
  make -j6

Now:

  mkdir -p /ford1/share/gmao_SIteam/xxdiff/5.1/bin
  mkdir -p /ford1/share/gmao_SIteam/xxdiff/5.1/share/man/man1

  cp ../bin/* /ford1/share/gmao_SIteam/xxdiff/5.1/bin



--]]

local version = "5.1"
local installdir = "/ford1/share/gmao_SIteam/xxdiff"

local pkgdir = pathJoin(installdir,version)

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
