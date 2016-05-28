## About

Vim-open assumes you a have a projects directory somewhere, under which you have a directory for each project. For instance:

    ~/Code/
    ├── project_one/
    ├── project_two/
    ├── client_one/
    │   ├── project_x/
    │   └── project_y/
    ├── client_two/
    │   └── project_z/
    └── etc/

As long as your projects are within the top two directories of your projects directory, everything works nicely. To tell vim-open where your projects directory is, see configuration options below.


## Configuration

`let g:project_dir = '~/all/my/projects'`<br />*required* This tells vim-open where to look for projects.

`let g:open_dir_auto_open_nerdtree = 0`<br />If you have [NERDTree](http://www.vim.org/scripts/script.php?script_id=1658) and want it to auto-open when opening a project, set to `1`. Otherwise you can ignore this option.

`let g:open_dir_callback = 'CtrlP'`<br />In addition to (or instead of) opening NERDTree, you can specify an arbitrary callback command to execute when vim-open runs. For instance you can use this to prime [CtrlP](http://kien.github.com/ctrlp.vim/)'s cache. Please see note in usage below.


## Usage

`:Open project_two`<br />Changes vim's working directory to project\_two, opens the project's README (if present), opens NERDTree (if configured) and executes callback in `g:open_dir_callback`. This is how you will normally use vim-open.

`:OpenDir ~/some/other/dir`<br />Changes vim's working directory to ~/some/other/dir, opens the directory's README (if present), opens NERDTree (if configured) and executes callback in `g:open_dir_callback`. This is useful if you need to open an arbitrary directory.

`:OpenVimrc`<br />Changes vim's working directory to ~/.vim, opens ~/.vimrc and opens NERDTree (if configured). Please note that the callback in `g:open_dir_callback` will be ignored.
