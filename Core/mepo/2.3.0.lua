--[[

Module for installing mepo 2.3.0

First go to https://github.com/pypa/pipx and get the pipx.pyz file and
install in:

/ford1/share/gmao_SIteam/mepo-pip/pipx

and run:

PIPX_HOME=/ford1/share/gmao_SIteam/mepo-pip/2.3.0 \
PIPX_BIN_DIR=/ford1/share/gmao_SIteam/mepo-pip/2.3.0/bin \
PIPX_MAN_DIR=/ford1/share/gmao_SIteam/mepo-pip/2.3.0/man \
/ford1/share/gmao_SIteam/GEOSpyD/24.7.1-0/2024-09-04/bin/python3 /ford1/share/gmao_SIteam/mepo-pip/pipx/pipx.pyz install mepo==2.3.0

--]]


local name = "mepo"
local version = "2.3.0"
local installdir = "/ford1/share/gmao_SIteam/mepo-pip"
local pkgdir = pathJoin(installdir,version)

whatis([===[loads the mepo 2.3.0 environment]===])

prepend_path{"PATH",pathJoin(pkgdir,"bin")}
