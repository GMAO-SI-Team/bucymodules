--[[ File for ninja

  installed as:

   wget https://github.com/ninja-build/ninja/releases/download/v1.12.1/ninja-linux.zip
   unzip ninja-linux.zip
   mkdir -p /ford1/share/gmao_SIteam/ninja/1.12.1
   mv ninja /ford1/share/gmao_SIteam/ninja/1.12.1
 
--]]

local version = "1.12.1"
local installdir = "/ford1/share/gmao_SIteam/ninja"

local pkgdir = pathJoin(installdir,version)

prepend_path("PATH",pkgdir)
