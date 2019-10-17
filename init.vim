" python location
let g:python3_host_prog='/home/telperion/envs/neovim/bin/python3'

" tabstops
set tabstop=2
set shiftwidth=2
set expandtab

" turn hybrid line numbers on
set number relativenumber
set nu rnu

" ----------------------------------------------------------------------
let mapleader=" "
" sets Ctrl-s to <Esc>:w
imap <C-s> <Esc>:w<Enter>
nmap <C-s> :w<Enter>

" sets jk to <Esc>
inoremap jk <Esc>

" sets Ctrl-j to up-arrow
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
" sets Ctrl-k to up-arrow
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" sets Ctrl-j and Ctrl-k to previous and next ale error
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" clipboard
inoremap <C-v> <Esc>"+pa
inoremap <C-c> "+y
inoremap <C-d> "+d

" splits
nnoremap <leader>l :vsplit<CR>
nnoremap <leader>k :split<CR>
nnoremap <leader>r gg=G<C-o><C-o>

" map for easy-motion to use just \{letter} for hotkey
map "\\" <Plug>(easymotion-prefix)

" ----------------------------------------------------------------------

" plug location:
call plug#begin('/home/telperion/.local/share/nvim/site/autoload/')
" UI:
Plug 'cocopon/iceberg.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntax:
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

" QoL:
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'mattn/emmet-vim' " emmet-vim is for html
Plug 'dense-analysis/ale' " ale is for syntax checking
Plug 'skywind3000/asyncrun.vim' " asyncrun is for background commands

" deoplete:
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }

call plug#end()


" UI stuff
colorscheme iceberg
let g:airline_theme='lucius'
let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
  let g:airline_symbols={}
endif

" deoplete settings:
let g:deoplete#enable_at_startup=1

" emmet settings
let g:user_emmet_mode='a'
let g:user_emmet_leader_key=','

" syntax settings
let g:javascript_plugin_jsdoc=1
let g:javascript_plugin_ngdoc=1

" ale settings:
let g:ale_fix_on_save=1
let g:ale_sign_highlight_linenrs=1
let g:airline#extensions#ale#enabled=1

" to run prettier every time:
autocmd BufWritePost *.js,*.jsx AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

" ale plugin load
packloadall

