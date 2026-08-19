load("git")
load("git-lfs")
load("cmake")
load("mepo")
load("gh")
load("tig")
load("xxdiff")
load("ninja")
load("codee")

-- Opencode modulefile might emit
-- a warning which can cause havoc with
-- some run scripts in GEOS. So just don't
-- autoload with GEOSenv
--load("opencode")

setenv("LOCAL_REGRESSION_DATA_DIR","/ford1/share/gmao_SIteam/regression-data")
