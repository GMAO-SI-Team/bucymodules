--[[ File for cmake

    Built on bucy

    You need to do:

      module load other/python/GEOSpyD

    to get sphinx-build for man pages

    mkdir build && cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/ford1/share/gmao_SIteam/Utilities/cmake-3.28.3 -DSPHINX_MAN=ON
    make -j4 |& tee make.log
    make install |& tee makeinstall.log

--]]

local version = "cmake-3.28.3"
local installdir = "/ford1/share/gmao_SIteam/Utilities"

local pkgdir = pathJoin(installdir,version)

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
