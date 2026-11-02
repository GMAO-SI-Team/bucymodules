--[[

Module for installing mepo 2.5.0

First go to https://github.com/pypa/pipx and get the pipx.pyz file and
install in:

/ford1/share/gmao_SIteam/mepo-pip/pipx

and run:

PIPX_HOME=/ford1/share/gmao_SIteam/mepo-pip/2.5.0 \
PIPX_BIN_DIR=/ford1/share/gmao_SIteam/mepo-pip/2.5.0/bin \
PIPX_MAN_DIR=/ford1/share/gmao_SIteam/mepo-pip/2.5.0/man \
/ford1/share/gmao_SIteam/GEOSpyD/26.7.2-0/2026-10-16/envs/py3.14/bin/python3 /ford1/share/gmao_SIteam/mepo-pip/pipx/pipx.pyz install mepo==2.5.0

--]]


local name = "mepo"
local version = "2.5.0"
local installdir = "/ford1/share/gmao_SIteam/mepo-pip"
local pkgdir = pathJoin(installdir,version)

whatis([===[loads the mepo 2.5.0 environment]===])

prepend_path{"PATH",pathJoin(pkgdir,"bin")}
