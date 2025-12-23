--[[ lua modulefile for ifx 2025.1

NOTENOTENOTE: See below for needed patch!
  
NOTE: It looks like the Base installer is no longer needed!

This was installed using the intel-oneapi-hpc-toolkit-2025.1.0.666_offline.sh installer.

After running `bash intel-oneapi-hpc-toolkit-2025.1.0.666_offline.sh` the GUI came up and
a custom install was selected. In that I changed the install directory to:

/ford1/share/gmao_SIteam/intel/oneapi/2025

NOTE: This is down in the lower left corner of the GUI. Not too obvious.

For some reason, you can't just go up to "oneapi" anymore. It complains about a
non-empty directory.

and selected these as the components:

Intel oneAPI DPC++/C++ Compiler
Intel Fortran Compiler
Intel Distribution for GDB
Intel oneAPI Math Kernel Library
Intel Integrated Performance Primitives
Intel MPI Library
Intel oneAPI DPC++ Library
Intel DPC++ Compatability Tool
Intel oneAPI Threading Building Blocks

PATCH NEEDED!

Per Dom Heinzeller, the following patch is needed to make the ifx compiler
work. Without it we can't make static libraries.

You need to run:

patchelf --add-needed libm.so.6 /ford1/share/gmao_SIteam/intel/oneapi/2025/compiler/2025.1/lib/libimf.so

--]]

family("Compiler")

local compilername = "ifx"
local version = "2025.1"
local oneapidir = "/ford1/share/gmao_SIteam/intel/oneapi/2025"
local compilerdir = pathJoin(oneapidir,"compiler",version)
local mkldir = pathJoin(oneapidir,"mkl",version)

-- Setup Modulepath for packages built by this compiler
local mroot = "/ford1/share/gmao_SIteam/lmodulefiles"
local mdir  = pathJoin(mroot,"Compiler/ifx-2025.1")
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
-- local gccdir = '/ford1/local/gcc/gcc-12.1.0'
local gccdir = '/ford1/share/gmao_SIteam/gcc/gcc-13.3.0/'
prepend_path("PATH",pathJoin(gccdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(gccdir,"lib64"))
prepend_path("CPATH",pathJoin(gccdir,"include"))

-- ifx specific

prepend_path("PATH",pathJoin(compilerdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(compilerdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(compilerdir,"lib"))
prepend_path("NLSPATH",pathJoin(compilerdir,"lib/compiler/locale/en_US/%N"))
prepend_path("PKG_CONFIG_PATH",pathJoin(compilerdir,"lib/pkgconfig"))
prepend_path("MANPATH",pathJoin(compilerdir,"share/man"))

-- mkl specific

setenv("MKLROOT",mkldir)
setenv("MKLPATH",pathJoin(mkldir,"lib"))
prepend_path("INCLUDE",pathJoin(mkldir,"include"))
prepend_path("LD_LIBRARY_PATH",pathJoin(mkldir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(mkldir,"lib"))
prepend_path("CPATH",pathJoin(mkldir,"include"))


