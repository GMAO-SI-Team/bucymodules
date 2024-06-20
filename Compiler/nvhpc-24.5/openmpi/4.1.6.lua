--[[

  Built with:
 
   module load nvhpc/24.5

    mkdir build-nvhpc-nompi-24.5 && cd build-nvhpc-nompi-24.5
    ../configure --disable-wrapper-rpath --disable-wrapper-runpath \
        CC=nvc CXX=nvc++ FC=nvfortran \
        CFLAGS='-fPIC' FCFLAGS='-fPIC' \
        --with-pmix=internal --with-hwloc=internal --with-libevent=internal \
        --without-zlib --disable-libxml2 \
        --prefix=/ford1/share/gmao_SIteam/MPI/openmpi/4.1.6/nvhpc-nompi-24.5 |& tee configure.nvhpc-nompi-24.5.log
   
    mv config.log config.nvhpc-nompi-24.5.log
    make -j4 |& tee make.nvhpc-nompi-24.5.log
    make install |& tee makeinstall.nvhpc-nompi-24.5.log
    make check |& tee makecheck.nvhpc-nompi-24.5.log

--]]

family("MPI")
prereq("nvhpc/24.5")

local compilername = "nvhpc-nompi-24.5"
local version = "4.1.6"
local siteamdir = "/ford1/share/gmao_SIteam"
local pkgdir = pathJoin(siteamdir,"MPI","openmpi",version,compilername)

-- Setup Modulepath for packages built by this MPI stack
local mroot = "/ford1/share/gmao_SIteam/lmodulefiles"
local mdir = pathJoin(mroot,"MPI/nvhpc-24.5",("openmpi-"..version))
prepend_path("MODULEPATH", mdir)

setenv("OPENMPI",pkgdir)
setenv("MPIHOME",pkgdir)
setenv("MPI_HOME",pkgdir)

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("INCLUDE",pathJoin(pkgdir,"include"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
