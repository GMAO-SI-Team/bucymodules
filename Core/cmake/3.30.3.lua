--[[ File for cmake

    Built on bucy

    You need to do:

      module load GEOSpyD/24.7.1-0/3.11

    to get sphinx-build for man pages

    cmake -B build -S . -DCMAKE_INSTALL_PREFIX=/ford1/share/gmao_SIteam/Utilities/cmake-3.30.3 -DSPHINX_MAN=ON
    cmake --build build -j6 |& tee make.log
    cmake --install build |& tee makeinstall.log

--]]

local version = "cmake-3.30.3"
local installdir = "/ford1/share/gmao_SIteam/Utilities"

local pkgdir = pathJoin(installdir,version)

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
