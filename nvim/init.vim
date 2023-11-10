call plug#begin('~/.local/share/nvim/site/plugged')

Plug 'https://github.com/vim-python/python-syntax'
Plug 'https://github.com/github/copilot.vim'

call plug#end()

let g:python_highlight_all = 1

function! MultipleEdit(p_list)
  for p in a:p_list
    for c in glob(p, 0, 1)
      execute 'edit ' . c
    endfor
  endfor
endfunction

command! -bar -bang -nargs=+ -complete=file Edit call MultipleEdit([<f-args>])
