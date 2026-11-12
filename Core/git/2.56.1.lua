--[[ File for git

Built as:

wget https://www.kernel.org/pub/software/scm/git/git-2.56.1.tar.gz
wget https://www.kernel.org/pub/software/scm/git/git-manpages-2.56.1.tar.gz

tar -xf git-2.56.1.tar.gz
cd git-2.56.1

./configure --prefix=/ford1/share/gmao_SIteam/git/git-2.56.1 |& tee configure.log

Then:

make -j4 all NO_RUST=YesPlease |& tee make.log
make install NO_RUST=YesPlease |& tee makeinstall.log

To install the man pages:

mkdir -p /ford1/share/gmao_SIteam/git/git-2.56.1/share/man
tar -xf git-manpages-2.56.1.tar.gz -C /ford1/share/gmao_SIteam/git/git-2.56.1/share/man/

--]]

local version = "git-2.56.1"
local installdir = "/ford1/share/gmao_SIteam/git"

local pkgdir = pathJoin(installdir,version)

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
