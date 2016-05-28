" File: open.vim
" Author: Austin Taylor
" Version: 0.1
" License: Distributable under the same terms as Vim itself (see :help license)
" Description: A collection of commands for opening projects.

command! OpenVimrc :call OpenVimrc()
command! -nargs=1 -complete=dir OpenDir :call OpenDir(<f-args>, 1)
command! -nargs=1 -complete=custom,ProjectComplete Open :call Open(<f-args>)

function! Open(project)
  call OpenDir(g:project_dir . '/' . a:project, 1)
endfunction

function! OpenDir(path, run_callback)
  execute 'lcd ' . a:path
  let t:directory = fnamemodify(a:path, ":t")
  let l:readme = get(split(system("ls README*"), "\n"), 0)
  if filereadable(l:readme)
    execute 'edit ' . l:readme
  else
    new
  endif
  silent only
  if exists('g:open_dir_auto_open_nerdtree') && g:open_dir_auto_open_nerdtree
    execute 'NERDTree ' . a:path
    execute 'normal l'
  endif
  if a:run_callback && exists('g:open_dir_callback')
    execute g:open_dir_callback
  endif
endfunction

function! OpenVimrc()
  call OpenDir("~/.vim", 0)
  execute 'edit ~/.vimrc'
endfunction

function! ProjectComplete(prefix, line, position)
  return system("cd " . g:project_dir . " && find . -maxdepth 3 -type d -name '.git' | sed -e 's/^..//' -e 's/..git$//'")
endfunction

