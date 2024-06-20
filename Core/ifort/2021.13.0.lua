--[[ stub routine for ifort 2021.13

  This was installed using the l_BaseKit_p_2024.2.0.634_offline.sh installer.
 
  After running `bash l_BaseKit_p_2024.2.0.634_offline.sh` the GUI came up and
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
 
  I then installed the l_HPCKit_p_2024.2.0.635_offline.sh installer. With
  that I again updated the install directory to the same as above:

    /ford1/share/gmao_SIteam/intel/oneapi
 
  and selected:
 
    Intel MPI Library
    Intel oneAPI DPC++/C++ Compiler
    Intel Fortran Compiler and Intel Fortran Compiler Classic

--]]

family("Compiler")

local compilername = "ifort"
local version = "2024.2"
local oneapidir = "/ford1/share/gmao_SIteam/intel/oneapi"
local compilerdir = pathJoin(oneapidir,"compiler",version)
local mkldir = pathJoin(oneapidir,"mkl",version)

-- Setup Modulepath for packages built by this compiler
local mroot = "/ford1/share/gmao_SIteam/lmodulefiles"
local mdir  = pathJoin(mroot,"Compiler/ifort-2021.13.0")
prepend_path("MODULEPATH", mdir)

setenv("CC",pathJoin(compilerdir,"bin","icx"))
setenv("CCC",pathJoin(compilerdir,"bin","icpx"))
setenv("CXX",pathJoin(compilerdir,"bin","icpx"))
setenv("FC",pathJoin(compilerdir,"bin","ifort"))
setenv("F90",pathJoin(compilerdir,"bin","ifort"))
setenv("F77",pathJoin(compilerdir,"bin","ifort"))

setenv("I_MPI_CC",pathJoin(compilerdir,"bin","icx"))
setenv("I_MPI_CXX",pathJoin(compilerdir,"bin","icpx"))
setenv("I_MPI_F90",pathJoin(compilerdir,"bin","ifort"))

-- We also need a backing gcc compiler
local gccdir = '/ford1/local/gcc/gcc-12.1.0'
prepend_path("PATH",pathJoin(gccdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(gccdir,"lib64"))
prepend_path("CPATH",pathJoin(gccdir,"include"))

-- ifort specific

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
prepend_path("INCLDUE",pathJoin(mkldir,"include"))
prepend_path("LD_LIBRARY_PATH",pathJoin(mkldir,"lib/intel64"))
prepend_path("LIBRARY_PATH",pathJoin(mkldir,"lib/intel64"))
prepend_path("CPATH",pathJoin(mkldir,"include"))
prepend_path("FPATH",pathJoin(mkldir,"include"))


