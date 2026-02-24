--[[ lmod for llvm-flang 22.1.0-rc2

This was retreived from:

https://github.com/llvm/llvm-project/releases/download/llvmorg-22.1.0-rc2/LLVM-22.1.0-rc2-Linux-X64.tar.xz

we then want to untar it into /ford1/share/gmao_SIteam/llvm-flang/22.1.0-rc2:

mkdir -p /ford1/share/gmao_SIteam/llvm-flang/22.1.0-rc2
tar -xf LLVM-22.1.0-rc2-Linux-X64.tar.xz -C /ford1/share/gmao_SIteam/llvm-flang/22.1.0-rc2 --strip-components=1

--]]

family("Compiler")

local compilername = "llvm-flang"
local version = "22.1.0-rc2"
local siteamdir = "/ford1/share/gmao_SIteam"
local installdir = pathJoin(siteamdir,compilername,version)

-- Setup Modulepath for packages built by this compiler
local mroot = "/ford1/share/gmao_SIteam/lmodulefiles"
local mdir  = pathJoin(mroot,"Compiler/llvm-flang-22.1.0-rc2")
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
