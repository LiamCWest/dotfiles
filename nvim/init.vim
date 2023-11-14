call plug#begin('~/.local/share/nvim/site/plugged')

Plug 'https://github.com/vim-python/python-syntax'
Plug 'https://github.com/github/copilot.vim'
Plug 'gelguy/wilder.nvim'
Plug 'andweeb/presence.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' }
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'rmagatti/auto-session'
Plug 'rmagatti/session-lens'
call plug#end()

call wilder#setup({
      \ 'modes': [':', '/', '?'],
      \ 'next_key': '<Tab>',
      \ 'previous_key': '<S-Tab>',
      \ 'accept_key': '<Down>',
      \ 'reject_key': '<Up>',
      \ })
let g:auto_session_enable = 1
let g:auto_session_root_dir = '~/.config/nvim/sessions'
let g:python_highlight_all = 1
set sessionoptions+=winpos,terminal,folds

nnoremap <leader>ss :SaveSession<CR>
nnoremap <leader>sr :RestoreSession<CR>

function! MultipleEdit(p_list)
  for p in a:p_list
    for c in glob(p, 0, 1)
      execute 'edit ' . c
    endfor
  endfor
endfunction

command! -bar -bang -nargs=+ -complete=file Edit call MultipleEdit([<f-args>])
