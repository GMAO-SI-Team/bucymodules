--[[ lmod for llvm-flang 22.1.0-rc3 build

The build script I use is at:

  https://github.com/GMAO-SI-Team/build-llvm-flang

which is based on the scivision gist at:

  https://gist.github.com/scivision/33bd9e17c9520d07be0448fe61541605

To use that script, you should use GCC 12. If you use GCC 13, the GLIBC version is too new and while the build will succeed, the resulting compiler will not work.

Then build with:

cd /ford1/share/gmao_SIteam/build-llvm-flang
ml gcc/12.5.0
mkdir -p /ford1/share/gmao_SIteam/build-llvm-flang/tmp
TMPDIR=/ford1/share/gmao_SIteam/build-llvm-flang/tmp ./build-flang.sh --prefix=/ford1/share/gmao_SIteam --llvm-version=22.1.0-rc3 |& tee build.22.1.0-rc3.log

If/when the build fails, you can rebuild with:

TMPDIR=/ford1/share/gmao_SIteam/build-llvm-flang/tmp ./build-flang.sh --prefix=/ford1/share/gmao_SIteam --llvm-version=22.1.0-rc3 --rebuild |& tee build.22.1.0-rc3.rebuild.log

Or do:

cd /ford1/share/gmao_SIteam/build-llvm-flang/tmp/llvm-build
ninja -j6 install

NOTE 1: I have to do the rebuild thing because, for some reason, the first build fails on bucy every time. But you just re run the build command
        and it works. Seems race condition like?
NOTE 2: the script automatically appends "llvm-flang" to the prefix and then the --llvm-version=22.1.0-rc3 option adds the date to the end of the directory name.

Also you might need to run:

  ulimit -n 65536

but this is currently in the build script

--]]

family("Compiler")

local compilername = "llvm-flang"
local version = "22.1.0-rc3"
local siteamdir = "/ford1/share/gmao_SIteam"
local installdir = pathJoin(siteamdir,compilername,version)

-- Setup Modulepath for packages built by this compiler
local mroot = "/ford1/share/gmao_SIteam/lmodulefiles"
local mdir  = pathJoin(mroot,"Compiler/llvm-flang-22.1.0-rc3")
prepend_path("MODULEPATH", mdir)

-- We also need a backing gcc compiler
local gccdir = '/ford1/share/gmao_SIteam/gcc/gcc-12.5.0'
prepend_path("PATH",pathJoin(gccdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(gccdir,"lib64"))
-- Possible fix for OpenMP issue: https://github.com/llvm/llvm-project/issues/113487
prepend_path("LIBRARY_PATH",pathJoin(gccdir,"lib64"))
prepend_path("CPATH",pathJoin(gccdir,"include"))

prepend_path("PATH",pathJoin(installdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(installdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(installdir,"lib"))
prepend_path("INCLUDE",pathJoin(installdir,"include"))
prepend_path("MANPATH",pathJoin(installdir,"share/man"))

prepend_path("LD_LIBRARY_PATH",pathJoin(installdir,"lib/x86_64-unknown-linux-gnu"))
prepend_path("LIBRARY_PATH",pathJoin(installdir,"lib/x86_64-unknown-linux-gnu"))

setenv("CC",pathJoin(installdir,"bin","clang"))
setenv("CXX",pathJoin(installdir,"bin","clang++"))
setenv("FC",pathJoin(installdir,"bin","flang"))
setenv("F90",pathJoin(installdir,"bin","flang"))
