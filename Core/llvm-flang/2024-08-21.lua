--[[ lmod for llvm-flang built on 2024-08-21

The build script I use is at:

  https://github.com/GMAO-SI-Team/build-llvm-flang

which is based on the scivision gist at:
 
  https://gist.github.com/scivision/33bd9e17c9520d07be0448fe61541605

To use that script, you build need at least GCC 12. 

Then build with:

ml gcc/13.3.0
mkdir -p tmp/
TMPDIR=tmp LLVM_PREFIX=/ford1/share/gmao_SIteam ./build-flang-f18.sh |& tee build.2024-08-21.log

Also you might need to run:
 
  ulimit -n 65536

but this is currently in the build script
 
--]]

family("Compiler")

local compilername = "llvm-flang"
local version = "2024-08-21"
local siteamdir = "/ford1/share/gmao_SIteam"
local installdir = pathJoin(siteamdir,compilername,version)

-- Setup Modulepath for packages built by this compiler
local mroot = "/ford1/share/gmao_SIteam/lmodulefiles"
local mdir  = pathJoin(mroot,"Compiler/llvm-flang-2024-08-21")
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
