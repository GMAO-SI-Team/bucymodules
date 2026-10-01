--[[ File for cmake

Built on bucy

You need to do:

wget https://github.com/Kitware/CMake/releases/download/v4.4.3/cmake-4.4.3.tar.gz
tar -xzf cmake-4.4.3.tar.gz

module load GEOSpyD/26.3.2-0/3.13

to get sphinx-build for man pages, but we need to now use /usr/bin/gcc and /usr/bin/g++ to build cmake
because GEOSpyD has a newer one

NOTE: We have to use system curl because CMake is trying to build curl internally with OpenSSL 3 and this system
doesn't have that it seems

cmake -B build -S . -DCMAKE_INSTALL_PREFIX=/ford1/share/gmao_SIteam/Utilities/cmake-4.4.3 -DSPHINX_MAN=ON -DCMAKE_C_COMPILER=/usr/bin/gcc -DCMAKE_CXX_COMPILER=/usr/bin/g++ -DCMAKE_USE_SYSTEM_CURL=ON |& tee cmake.log
cmake --build build --target install -j6 |& tee make.log

--]]

local version = "cmake-4.4.3"
local installdir = "/ford1/share/gmao_SIteam/Utilities"

local pkgdir = pathJoin(installdir,version)

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
