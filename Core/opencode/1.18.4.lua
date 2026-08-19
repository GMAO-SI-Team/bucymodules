--[[ modulefile for opencode

Go to /ford1/share/gmao_SIteam/opencode and run:

OPENCODE_TARGET=linux-x64 ./install-opencode.sh 1.18.4 /ford1/share/gmao_SIteam/opencode


--]]

local version = "1.18.4"
local installdir = "/ford1/share/gmao_SIteam/opencode"

local pkgdir = pathJoin(installdir,version)

prepend_path("PATH",pathJoin(pkgdir,"bin"))

-- Opencode seems to have issues if TMPDIR is set to /tmp, which is the
-- default on many systems. This can lead to problems with temporary file
-- handling. We will check the value of TMPDIR and issue a warning if it is
-- set to /tmp or not set at all (which defaults to /tmp).

-- Only execute this check when the module is actively being loaded
-- if mode() == "load" then
--     -- Fetch the current value of TMPDIR
--     local tmpdir = os.getenv("TMPDIR")
--
--     -- Check if it is explicitly set to /tmp or if it is not set (which defaults to /tmp)
--     if tmpdir == "/tmp" or tmpdir == nil then
--         LmodWarning("TMPDIR is set to /tmp (or not set at all). Opencode is known to experience issues with this configuration. Please consider setting it to a different directory before running Opencode.")
--     end
-- end
