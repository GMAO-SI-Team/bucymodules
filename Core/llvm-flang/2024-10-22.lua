--[[ lmod for llvm-flang built on 2024-10-22

The build script I use is at:

  https://github.com/GMAO-SI-Team/build-llvm-flang

which is based on the scivision gist at:
 
  https://gist.github.com/scivision/33bd9e17c9520d07be0448fe61541605

To use that script, you should use GCC 12. If you use GCC 13, the GLIBC version is too new and while the build will succeed, the resulting compiler will not work.

Then build with:

cd /ford1/share/gmao_SIteam/build-llvm-flang
ml gcc/12.1.0
mkdir -p tmp/
TMPDIR=tmp ./build-flang-f18.sh --prefix=/ford1/share/gmao_SIteam --add-date |& tee build.2024-10-22.log

If/when the build fails, you can rebuild with:

TMPDIR=tmp ./build-flang-f18.sh --prefix=/ford1/share/gmao_SIteam --add-date --rebuild |& tee build.2024-10-22.rebuild.log

NOTE 1: I have to do the rebuild thing because, for some reason, the first build fails on bucy every time. But you just re run the build command 
        and it works. Seems race condition like?
NOTE 2: the script automatically appends "llvm-flang" to the prefix and then the --add-date option adds the date to the end of the directory name.

Also you might need to run:
 
  ulimit -n 65536

but this is currently in the build script
 
--]]

family("Compiler")

local compilername = "llvm-flang"
local version = "2024-10-22"
local siteamdir = "/ford1/share/gmao_SIteam"
local installdir = pathJoin(siteamdir,compilername,version)

-- Setup Modulepath for packages built by this compiler
local mroot = "/ford1/share/gmao_SIteam/lmodulefiles"
local mdir  = pathJoin(mroot,"Compiler/llvm-flang-2024-10-22")
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
