--[[ lmod for llvm-flang built on 2024-07-12

  First go to:
 
    https://gist.github.com/scivision/33bd9e17c9520d07be0448fe61541605
 
  and get that script to build. You then need to edit it to point to
  the right places for gcc-12, g++-12 and set LLVM_HOME and LLVM_TEMP.
 
  NOTE: Do not put LLVM_TEMP into /tmp/somewhere. It does not work there.
 
  Also you  might need to run:
 
    ulimit -n 65536
 
  as one step in the build links a *lot* of files.

--]]

family("Compiler")

local compilername = "llvm-flang"
local version = "2024-07-12"
local siteamdir = "/ford1/share/gmao_SIteam"
local installdir = pathJoin(siteamdir,compilername,version)

-- Setup Modulepath for packages built by this compiler
local mroot = "/ford1/share/gmao_SIteam/lmodulefiles"
local mdir  = pathJoin(mroot,"Compiler/llvm-flang-2024-07-12")
prepend_path("MODULEPATH", mdir)

-- We also need a backing gcc compiler
local gccdir = '/ford1/local/gcc/gcc-12.1.0'
prepend_path("PATH",pathJoin(gccdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(gccdir,"lib64"))
prepend_path("CPATH",pathJoin(gccdir,"include"))

prepend_path("PATH",pathJoin(installdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(installdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(installdir,"lib"))
prepend_path("INCLUDE",pathJoin(installdir,"include"))
prepend_path("MANPATH",pathJoin(installdir,"share/man"))

setenv("CC",pathJoin(installdir,"bin","clang"))
setenv("CXX",pathJoin(installdir,"bin","clang++"))
setenv("FC",pathJoin(installdir,"bin","flang-new"))
setenv("F90",pathJoin(installdir,"bin","flang-new"))
