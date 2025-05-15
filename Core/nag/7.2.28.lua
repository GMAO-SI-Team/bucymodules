--[[ stub routine for nag

 Installed as:

  Went to:
    https://monet.nag.co.uk/compiler/r72download/
 
  and copied the URL for the x86 Linux installer.
 
    wget https://monet.nag.co.uk/compiler/r72download/npl6a72na_amd64_7228.tgz
    tar -xf npl6a72na_amd64_7228.tgz
 
    cd NAG_Fortran-amd64/
 
  You run INSTALL.sh and pass in:
 
    /ford1/share/gmao_SIteam/nag/7.2.28/bin
 
  as the path

--]]

family("Compiler")

local compilername = "nag"
local version = "7.2.28"
local siteamdir = "/ford1/share/gmao_SIteam"
local installdir = pathJoin(siteamdir,compilername,version)

-- Setup Modulepath for packages built by this compiler
local mroot = "/ford1/share/gmao_SIteam/lmodulefiles"
local mdir  = pathJoin(mroot,"Compiler/nag-7.2.28")
prepend_path("MODULEPATH", mdir)

-- gcc stuff for C compiler

local compilername = "gcc"
local version = "12.1.0"
local versioned_compiler = compilername .. "-" .. version
local gccdir = "/ford1/local"
local gccinstalldir = pathJoin(gccdir,compilername,versioned_compiler)

prepend_path("PATH",pathJoin(gccinstalldir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(gccinstalldir,"lib64"))
prepend_path("LIBRARY_PATH",pathJoin(gccinstalldir,"lib64"))
prepend_path("INCLUDE",pathJoin(gccinstalldir,"include"))
prepend_path("INCLUDE",pathJoin(gccinstalldir,"include/c++",version))
prepend_path("MANPATH",pathJoin(gccinstalldir,"man"))

setenv("CC",pathJoin(gccinstalldir,"bin","gcc"))
setenv("CXX",pathJoin(gccinstalldir,"bin","g++"))

-- NAG stuff for Fortran compiler

prepend_path("PATH",pathJoin(installdir,"bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(installdir,"lib"))
prepend_path("LIBRARY_PATH",pathJoin(installdir,"lib"))
prepend_path("MANPATH",pathJoin(installdir,"man"))

setenv("FC",pathJoin(installdir,"bin","nagfor"))
setenv("F90",pathJoin(installdir,"bin","nagfor"))

setenv("NAG_KUSARI_FILE","/ford1/share/gmao_SIteam/nag/nag.key")

