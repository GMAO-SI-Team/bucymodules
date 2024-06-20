--[[ stub routine for ifort 2021.6.0

--]]

family("Compiler")

local compilername = "ifort"
local version = "2021.6.0"
local oneapidir = "/ford1/local/intel/oneapi"
local compilerdir = pathJoin(oneapidir,"compiler",version,linux)
local mkldir = pathJoin(oneapidir,"mkl",version)

-- Setup Modulepath for packages built by this compiler
local mroot = "/ford1/share/gmao_SIteam/lmodulefiles"
local mdir  = pathJoin(mroot,"Compiler/ifort-2021.6.0")
prepend_path("MODULEPATH", mdir)

setenv("CC",pathJoin(compilerdir,"bin/intel64","icc"))
setenv("CCC",pathJoin(compilerdir,"bin/intel64","icpc"))
setenv("CXX",pathJoin(compilerdir,"bin/intel64","icpc"))
setenv("FC",pathJoin(compilerdir,"bin/intel64","ifort"))
setenv("F90",pathJoin(compilerdir,"bin/intel64","ifort"))
setenv("F77",pathJoin(compilerdir,"bin/intel64","ifort"))

-- We also need a backing gcc compiler
local gccdir = '/ford1/local/gcc/gcc-11.2.0'
prepend_path("PATH",pathJoin(gccdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(gccdir,"lib64"))
prepend_path("CPATH",pathJoin(gccdir,"include"))

-- ifort specific

prepend_path("PATH",pathJoin(compilerdir,"bin/intel64"))
prepend_path("LD_LIBRARY_PATH",pathJoin(compilerdir,"compiler/lib/intel64"))
prepend_path("LIBRARY_PATH",pathJoin(compilerdir,"compiler/lib/intel64"))
prepend_path("NLSPATH",pathJoin(compilerdir,"compiler/lib/intel64/locale/en_US/%N"))
prepend_path("INCLUDE",pathJoin(compilerdir,"compiler/include"))
prepend_path("MANPATH",pathJoin(compilerdir,"documentation/en/man/common"))

-- mkl specific

setenv("MKLROOT",mkldir)
setenv("MKLPATH",pathJoin(mkldir,"lib/intel64"))
prepend_path("INCLDUE",pathJoin(mkldir,"include"))
prepend_path("LD_LIBRARY_PATH",pathJoin(mkldir,"lib/intel64"))
prepend_path("LIBRARY_PATH",pathJoin(mkldir,"lib/intel64"))
prepend_path("CPATH",pathJoin(mkldir,"include"))


