--[[ File for codee

  First get the tarfile from code and copy to:

  /ford1/share/gmao_SIteam/codee/src/codee-2025.4.8-linux-x86_64.tar.gz

  Then in there just untar to the new directory:

  mkdir -p /ford1/share/gmao_SIteam/codee/2025.4.8
  tar -xzf codee-2025.4.8-linux-x86_64.tar.gz -C /ford1/share/gmao_SIteam/codee/2025.4.8 --strip-components=1

--]]

local version = "2025.4.8"
local installdir = "/ford1/share/gmao_SIteam/codee"

local pkgdir = pathJoin(installdir,version)

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
