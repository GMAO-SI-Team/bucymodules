--[[ File for vim

 Built as guided by: https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source

  I also had to load other/python/GEOSpyD/Min4.11.0_py3.9

 ./configure --prefix=/ford1/share/gmao_SIteam/vim/9.0.1470 \
    --with-features=huge --enable-multibyte \
    --enable-luainterp=yes --enable-cscope \
    --enable-gui=gtk2 --enable-rubyinterp=yes \
     --enable-python3interp=dynamic --with-python3-config-dir=/ford1/share/gmao_SIteam/GEOSpyD/4.11.0_py3.9/2022-04-28/lib/python3.9/config-3.9-x86_64-linux-gnu \
     --with-python3-command=/ford1/share/gmao_SIteam/GEOSpyD/4.11.0_py3.9/2022-04-28/bin/python3.9 \
    |& tee configure.log

 make -j4 |& tee make.log

 Next, there is a bug in netrw, so I opened:

    runtime/autoload/netrw.vim

 and changed the line:

    call s:NetrwExe("sil !xdg-open ".s:ShellEscape(fname,1).redir)

 to:

    call s:NetrwExe("sil !setsid xdg-open ".s:ShellEscape(fname,1).redir)

 Then you can run:

 make install |& tee makeinstall.log

--]]

local version = "9.0.1470"
local installdir = "/ford1/share/gmao_SIteam/vim"

local pkgdir = pathJoin(installdir,version)

setenv("VIMRUNTIMEDIR",pathJoin(pkgdir,"share/vim/vim90"))
setenv("VIMRUNTIME",pathJoin(pkgdir,"share/vim/vim90"))

prepend_path("PATH",pathJoin(pkgdir,"bin"))
prepend_path("MANPATH",pathJoin(pkgdir,"share/man"))
