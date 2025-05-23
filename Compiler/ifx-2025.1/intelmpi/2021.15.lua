--[[ Lua modulefile for Intel MPI 2021.15 using Intel oneAPI 2025.1

NOTE NOTE NOTE

You will see I have to set I_MPI_HYDRA_TOPOLIB=hwloc below. It was found on
bucy (at least?) that the new `ipl2` option does not work. Not sure if this
is because of the fact that bucy is a virtual machine?

There is also a (hidden?) option of `ipl` but the docs currently say:

NOTE: I_MPI_HYDRA_TOPOLIB=ipl is not supported since Intel(R) MPI 2021.15.

--]]

family("MPI")
prereq("ifx/2025.1")

local compilername = "ifx-2025.1"
local version = "2021.15"
local oneapidir = "/ford1/share/gmao_SIteam/intel/oneapi/2025"
local pkgdir = pathJoin(oneapidir,"mpi",version)

-- Setup Modulepath for packages built by this MPI stack
local mroot = "/ford1/share/gmao_SIteam/lmodulefiles"
local mdir = pathJoin(mroot,"MPI/ifx-2025.1",("intelmpi-"..version))
prepend_path("MODULEPATH", mdir)

setenv("I_MPI_ROOT",pkgdir)
setenv("MPIHOME",pkgdir)
setenv("MPI_HOME",pkgdir)

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("PATH",pathJoin(pkgdir,"libfabric/bin"))
prepend_path("CLASSPATH",pathJoin(pkgdir,"share/java/mpi.jar"))

prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"libfabric/lib"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"libfabric/lib"))

prepend_path("FI_PROVIDER_PATH",pathJoin(pkgdir,"libfabric/lib/prov"))

prepend_path("INCLUDE",pathJoin(pkgdir,"include"))
prepend_path("CPATH",pathJoin(pkgdir,"include"))

prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))

prepend_path("PKG_CONFIG_PATH",pathJoin(pkgdir,"lib/pkgconfig"))

setenv("I_MPI_HYDRA_TOPOLIB","hwloc")
