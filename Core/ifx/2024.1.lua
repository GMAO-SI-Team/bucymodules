--[[ stub routine for ifx 2024.1

NOTENOTENOTE: See below for needed patch!

This was installed using the l_BaseKit_p_2024.1.0.596_offline.sh installer.

After running `bash l_BaseKit_p_2024.1.0.596_offline.sh` the GUI came up and
a custom install was selected. In that I changed the install directory to:

/ford1/share/gmao_SIteam/intel/oneapi

and selected these as the components:

Intel DPC++ Compatability Tool
Intel Distribution for GDB
Intel oneAPI DPC++ Library
Intel oneAPI Threading Building Blocks
Intel oneAPI DPC++/C++ Compiler
Intel Integrated Performance Primitives
Intel oneAPI Math Kernel Library

I then installed the l_HPCKit_p_2024.1.0.560_offline.sh installer. With
that I again updated the install directory to the same as above:

/ford1/share/gmao_SIteam/intel/oneapi

and selected:

Intel MPI Library
Intel oneAPI DPC++/C++ Compiler
Intel Fortran Compiler and Intel Fortran Compiler Classic

PATCH NEEDED!

Per Dom Heinzeller, the following patch is needed to make the ifx compiler
work. Without it we can't make static libraries.

You need to run:

patchelf --add-needed libm.so.6 /ford1/share/gmao_SIteam/intel/oneapi/compiler/2024.1/lib/libimf.so

--]]

family("Compiler")

local compilername = "ifx"
local version = "2024.1"
local oneapidir = "/ford1/share/gmao_SIteam/intel/oneapi"
local compilerdir = pathJoin(oneapidir,"compiler",version)
local mkldir = pathJoin(oneapidir,"mkl",version)

-- Setup Modulepath for packages built by this compiler
local mroot = "/ford1/share/gmao_SIteam/lmodulefiles"
local mdir  = pathJoin(mroot,"Compiler/ifx-2024.1")
prepend_path("MODULEPATH", mdir)

setenv("CC",pathJoin(compilerdir,"bin","icx"))
setenv("CCC",pathJoin(compilerdir,"bin","icpx"))
setenv("CXX",pathJoin(compilerdir,"bin","icpx"))
setenv("FC",pathJoin(compilerdir,"bin","ifx"))
setenv("F90",pathJoin(compilerdir,"bin","ifx"))
setenv("F77",pathJoin(compilerdir,"bin","ifx"))

setenv("I_MPI_CC",pathJoin(compilerdir,"bin","icx"))
setenv("I_MPI_CXX",pathJoin(compilerdir,"bin","icpx"))
setenv("I_MPI_F90",pathJoin(compilerdir,"bin","ifx"))

-- We also need a backing gcc compiler
local gccdir = '/ford1/local/gcc/gcc-12.1.0'
prepend_path("PATH",pathJoin(gccdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(gccdir,"lib64"))
prepend_path("CPATH",pathJoin(gccdir,"include"))

-- ifx specific

prepend_path("PATH",pathJoin(compilerdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(compilerdir,"lib"))
prepend_path("LD_LIBRARY_PATH",pathJoin(compilerdir,"opt/compiler/lib"))
prepend_path("LIBRARY_PATH",pathJoin(compilerdir,"lib"))
prepend_path("NLSPATH",pathJoin(compilerdir,"lib/compiler/locale/en_US/%N"))
prepend_path("PKG_CONFIG_PATH",pathJoin(compilerdir,"lib/pkgconfig"))
prepend_path("MANPATH",pathJoin(compilerdir,"share/man"))

-- mkl specific

setenv("MKLROOT",mkldir)
setenv("MKLPATH",pathJoin(mkldir,"lib/intel64"))
prepend_path("INCLUDE",pathJoin(mkldir,"include"))
prepend_path("LD_LIBRARY_PATH",pathJoin(mkldir,"lib/intel64"))
prepend_path("LIBRARY_PATH",pathJoin(mkldir,"lib/intel64"))
prepend_path("CPATH",pathJoin(mkldir,"include"))


