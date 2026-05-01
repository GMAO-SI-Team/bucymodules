--[[ File for vim


 Remember: If you move to vim 9.3, change all the 92 to 93 below

 Built as guided by: https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source

  ml GEOSpyD/25.3.1-0/3.13

  ./configure --prefix=/ford1/share/gmao_SIteam/vim/9.2.0131 \
    --with-features=huge \
    --enable-fail-if-missing \
    --enable-multibyte \
    --enable-luainterp=yes \
    --enable-cscope \
    --enable-python3interp=yes \
    --with-python3-command=$Python3_ROOT_DIR/bin/python3 \
    --enable-gui=gtk3 \
    --with-tlib=ncurses \
    CC=/usr/bin/gcc CXX=/usr/bin/g++ \
    CPPFLAGS="-I$Python3_ROOT_DIR/include/python3.13" \
    LDFLAGS="-L$Python3_ROOT_DIR/lib -Wl,-rpath,$Python3_ROOT_DIR/lib" \
    |& tee configure.log

 make -j4 |& tee make.log

 make install |& tee makeinstall.log

--]]

local version = "9.2.0131"
local installdir = "/ford1/share/gmao_SIteam/vim"

local pkgdir = pathJoin(installdir,version)

setenv("VIMRUNTIMEDIR",pathJoin(pkgdir,"share/vim/vim92"))
setenv("VIMRUNTIME",pathJoin(pkgdir,"share/vim/vim92"))

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
