--[[

  Built with:
 
   module load nag/7.2.06

    mkdir build-nag-7.2.06 && cd build-nag-7.2.06
    ../configure --disable-wrapper-rpath --disable-wrapper-runpath \
        CC=gcc CXX=g++ FC=nagfor \
        --with-pmix=internal --with-hwloc=internal --with-libevent=internal \
        --prefix=/ford1/share/gmao_SIteam/MPI/openmpi/4.1.6/nag-7.2.06 |& tee configure.nag-7.2.06.log
   
    mv config.log config.nag-7.2.06.log
    make -j4 |& tee make.nag-7.2.06.log
    make install |& tee makeinstall.nag-7.2.06.log
    make check |& tee makecheck.nag-7.2.06.log

--]]

family("MPI")
prereq("nag/7.2.06")

local compilername = "nag-7.2.06"
local version = "4.1.6"
local siteamdir = "/ford1/share/gmao_SIteam"
local pkgdir = pathJoin(siteamdir,"MPI","openmpi",version,compilername)

-- Setup Modulepath for packages built by this MPI stack
local mroot = "/ford1/share/gmao_SIteam/lmodulefiles"
local mdir = pathJoin(mroot,"MPI/nag-7.2.06",("openmpi-"..version))
prepend_path("MODULEPATH", mdir)

setenv("OPENMPI",pkgdir)
setenv("MPIHOME",pkgdir)
setenv("MPI_HOME",pkgdir)

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("INCLUDE",pathJoin(pkgdir,"include"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
