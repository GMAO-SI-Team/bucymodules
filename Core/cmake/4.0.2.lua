--[[ File for cmake

Built on bucy

You need to do:

module load GEOSpyD/24.11.3-0/3.12

to get sphinx-build for man pages, but we need to now use /usr/bin/gcc and /usr/bin/g++ to build cmake
because GEOSpyD has a newer one

cmake -B build -S . -DCMAKE_INSTALL_PREFIX=/ford1/share/gmao_SIteam/Utilities/cmake-4.0.2 -DSPHINX_MAN=ON -DCMAKE_C_COMPILER=/usr/bin/gcc -DCMAKE_CXX_COMPILER=/usr/bin/g++
cmake --build build --target install -j6 |& tee make.log

--]]

local version = "cmake-4.0.2"
local installdir = "/ford1/share/gmao_SIteam/Utilities"

local pkgdir = pathJoin(installdir,version)

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
