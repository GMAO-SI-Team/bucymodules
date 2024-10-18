--[[ stub routine for nag-clang

 Installed as:

  Went to:
    https://monet.nag.co.uk/compiler/r72download/
 
  and copied the URL for the x86 Linux installer.
 
    wget https://monet.nag.co.uk/compiler/r72download/npl6a72na_amd64_7213.tgz
    tar -xf npl6a72na_amd64_7213.tgz
 
    cd NAG_Fortran-amd64/
 
  You run INSTALL.sh and pass in:
 
    /ford1/share/gmao_SIteam/nag/7.2.13/bin
 
  as the path

--]]

family("Compiler")

local compilername = "nag"
local version = "7.2.13"
local siteamdir = "/ford1/share/gmao_SIteam"
local installdir = pathJoin(siteamdir,compilername,version)

-- Setup Modulepath for packages built by this compiler
local mroot = "/ford1/share/gmao_SIteam/lmodulefiles"
local mdir  = pathJoin(mroot,"Compiler/nag-clang-7.2.13")
prepend_path("MODULEPATH", mdir)

-- clang stuff for C compiler

-- We also need a backing gcc compiler
local gccdir = '/ford1/local/gcc/gcc-12.1.0'
prepend_path("PATH",pathJoin(gccdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(gccdir,"lib64"))
prepend_path("CPATH",pathJoin(gccdir,"include"))

local clanginstalldir = "/ford1/share/gmao_SIteam/llvm-flang/2024-09-06"
prepend_path("PATH",pathJoin(clanginstalldir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(clanginstalldir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(clanginstalldir,"lib"))
prepend_path("INCLUDE",pathJoin(clanginstalldir,"include"))
prepend_path("MANPATH",pathJoin(clanginstalldir,"share/man"))

setenv("CC",pathJoin(clanginstalldir,"bin","clang"))
setenv("CXX",pathJoin(clanginstalldir,"bin","clang++"))


-- NAG stuff for Fortran compiler

prepend_path("PATH",pathJoin(installdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(installdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(installdir,"lib"))
prepend_path("MANPATH",pathJoin(installdir,"man"))

setenv("FC",pathJoin(installdir,"bin","nagfor"))
setenv("F90",pathJoin(installdir,"bin","nagfor"))

setenv("NAG_KUSARI_FILE","/ford1/share/gmao_SIteam/nag/nag.key")

