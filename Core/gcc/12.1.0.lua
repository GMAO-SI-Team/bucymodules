--[[ lmod for gcc 12.1.0

--]]

family("Compiler")

local compilername = "gcc"
local version = "12.1.0"
local versioned_compiler = compilername .. "-" .. version
local fordlocaldir = "/ford1/local"
local installdir = pathJoin(fordlocaldir,compilername,versioned_compiler)

-- Setup Modulepath for packages built by this compiler
local mroot = "/ford1/share/gmao_SIteam/lmodulefiles"
local mdir  = pathJoin(mroot,"Compiler/gcc-12.1.0")
prepend_path("MODULEPATH", mdir)

prepend_path("PATH",pathJoin(installdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(installdir,"lib64"))
prepend_path("LIBRARY_PATH",pathJoin(installdir,"lib64"))
prepend_path("INCLUDE",pathJoin(installdir,"include"))
prepend_path("INCLUDE",pathJoin(installdir,"include/c++",version))
prepend_path("MANPATH",pathJoin(installdir,"share/man"))

setenv("CC",pathJoin(installdir,"bin","gcc"))
setenv("CXX",pathJoin(installdir,"bin","g++"))
setenv("FC",pathJoin(installdir,"bin","gfortran"))
setenv("F90",pathJoin(installdir,"bin","gfortran"))
