--[[ File for GEOSpyD

Installed using the GEOSpyD installer script on github:

git@github.com:GMAO-SI-Team/GEOSpyD.git

and I ran
   
ml gcc/12.1.0
./install_miniforge.bash --python_version 3.12 --miniforge_version 24.7.1-0 --ffnet-hack --prefix /ford1/share/gmao_SIteam/GEOSpyD |& tee install.mini24.7.1-0.py3.12.2024-09-04.log

NOTE 1: I have to use the --ffnet-hack to have the script install from a hacked fork of ffnet. For some reason, bucy will *not* install ffnet
        correctly even though all other systems do. Note that this assumes the FC is just 'gfortran'
NOTE 2: You'll need to set the date below!

--]]

family("Python")

local installdir = "/ford1/share/gmao_SIteam/GEOSpyD"

local miniforge_version = "24.7.1-0"
local python_version = "3.12"
local geospyd_version = "py" .. python_version
local builddate = "2024-09-04"

local pathdir = pathJoin(miniforge_version,builddate,'envs',geospyd_version)
local pkgdir = pathJoin(installdir,pathdir)

-- Setup Modulepath for packages built by this compiler
local mroot = "/ford1/share/gmao_SIteam/lmodulefiles"
local mdir  = pathJoin(mroot,"GEOSpyD",miniforge_version,geospyd_version)
prepend_path("MODULEPATH", mdir)

unsetenv("ESMA_F2PY")

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("PROJ_LIB",pathJoin(pkgdir,"share/proj"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
