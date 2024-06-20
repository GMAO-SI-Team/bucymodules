--[[

--]]

family("MPI")
prereq("ifort/2021.12.0")

local compilername = "ifort-2021.12.0"
local version = "2021.13"
local oneapidir = "/ford1/share/gmao_SIteam/intel/oneapi"
local pkgdir = pathJoin(oneapidir,"mpi",version)

-- Setup Modulepath for packages built by this MPI stack
local mroot = "/ford1/share/gmao_SIteam/lmodulefiles"
local mdir = pathJoin(mroot,"MPI/ifort-2021.13.0",("intelmpi-"..version))
prepend_path("MODULEPATH", mdir)

setenv("I_MPI_ROOT",pkgdir)
setenv("MPIHOME",pkgdir)
setenv("MPI_HOME",pkgdir)

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("PATH",pathJoin(pkgdir,"libfabric/bin"))
prepend_path("CLASSPATH",pathJoin(pkgdir,"lib/mpi.jar"))

prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"lib/release"))
prepend_path("LD_LIBRARY_PATH",pathJoin(pkgdir,"libfabric/lib"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"lib/release"))
prepend_path("LIBRARY_PATH",pathJoin(pkgdir,"libfabric/lib"))

prepend_path("FI_PROVIDER_PATH",pathJoin(pkgdir,"libfabric/lib/prov"))

prepend_path("INCLUDE",pathJoin(pkgdir,"include"))
prepend_path("CPATH",pathJoin(pkgdir,"include"))
prepend_path("FPATH",pathJoin(pkgdir,"include"))

prepend_path("MANPATH",pathJoin(pkgdir,"man"))
