--[[ File for git-lfs

  installed as:

  wget https://github.com/git-lfs/git-lfs/releases/download/v3.7.1/git-lfs-linux-amd64-v3.7.1.tar.gz
  tar -xvzf git-lfs-linux-amd64-v3.7.1.tar.gz
  cd git-lfs-3.7.1
  mkdir -p /ford1/share/gmao_SIteam/git-lfs/3.7.1/bin
  mkdir -p /ford1/share/gmao_SIteam/git-lfs/3.7.1/share

  mv git-lfs /ford1/share/gmao_SIteam/git-lfs/3.7.1/bin
  mv man /ford1/share/gmao_SIteam/git-lfs/3.7.1/share


--]]

local version = "3.7.1"
local installdir = "/ford1/share/gmao_SIteam/git-lfs"

local pkgdir = pathJoin(installdir,version)

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
