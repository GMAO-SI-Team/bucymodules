--[[ modulefile for opencode

cd /ford1/share/gmao_SIteam/opencode
OPENCODE_TARGET=linux-x64 ./install-opencode.sh 2.2.5 /ford1/share/gmao_SIteam/opencode


--]]

local version = "2.2.5"
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

-- Opencode's managed background service binds a fixed default port (49374)
-- that is shared by every user on the machine, so on a multi-user system
-- only one user can run it. Give each user their own port, derived from
-- their UID (range 21000-31999, below the kernel ephemeral range), the first time they load the module. This writes
-- ~/.config/opencode/service.json only if it does not already exist, so a
-- user's own choice is never overwritten. Nothing is undone on unload.
if mode() == "load" then
    execute{cmd='f="$HOME/.config/opencode/service.json"; [ -e "$f" ] || { mkdir -p "${f%/*}" && echo "{\\"port\\": $((21000 + $(id -u) % 11000))}" > "$f"; }',
            modeA={"load"}}
end
