:set number 
:set relativenumber
:set autoindent
:set expandtab
:set tabstop=4
:set shiftwidth=4
:set softtabstop=4
:set mouse=a
:set nobackup
:set nowritebackup
:set updatetime=50
:set cmdheight=2
:set shortmess+=c
:set ignorecase
:set smartcase
:set smartindent
:set termguicolors
:set hidden
:set backspace=indent,eol,start
:set scrolloff=8 " Makes the screan scroll when there is 8 over or under.
:set completeopt-=preview " For No Previews
:set clipboard+=unnamedplus
" :set textwidth=110
:set wrap linebreak


call plug#begin()
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'shaunsingh/nord.nvim'
Plug 'https://github.com/morhetz/gruvbox'
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'Xuyuanp/nerdtree-git-plugin' " Git symbols on the nerdtree.
Plug 'airblade/vim-gitgutter' " Git stuff.
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs' " Auto-close braces and scopes
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim' " Cool fuzzy finder thing.
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
Plug 'alvan/vim-closetag' " Auto closing tags.
Plug 'preservim/nerdcommenter'
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'codechips/coc-svelte', {'do': 'npm install'}
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'Shougo/context_filetype.vim'
Plug 'dylanaraps/wal.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'sonph/onehalf'
Plug 'psliwka/vim-smoothie'
Plug 'rowantran/vim-bspwm-navigator'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'andreasvc/vim-256noir'
Plug 'https://github.com/vim-scripts/SyntaxAttr.vim'
Plug 'vimwiki/vimwiki'
Plug 'https://github.com/lvim-tech/lvim-colorscheme'
Plug 'dhruvasagar/vim-table-mode'

call plug#end()


" Space=mapleader
let mapleader = " " " mapleader = Space


" --- Prettier Settings ---
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat_require_pragma = 0
au BufWritePre *.css,*.svelte,*.pcss,*.html,*.ts,*.js,*.json PrettierAsync
:set encoding=UTF-8


" --- Svelte context shit ---
if !exists('g:context_filetype#same_filetypes')
  let g:context_filetype#filetypes = {}
endif
let g:vim_svelte_plugin_load_full_syntax = 1
let g:context_filetype#filetypes.svelte =
\ [
\   {'filetype' : 'javascript', 'start' : '<script>', 'end' : '</script>'},
\   {
\     'filetype': 'typescript',
\     'start': '<script\%( [^>]*\)\? \%(ts\|lang="\%(ts\|typescript\)"\)\%( [^>]*\)\?>',
\     'end': '',
\   },
\   {'filetype' : 'css', 'start' : '<style \?.*>', 'end' : '</style>'},
\ ]


" Can't remember what this does tbh.
let g:ft = ''


" Find files using Telescope command-line sugar.
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>


" Search in file with CTRL + f
nmap <C-f>f <Plug>CtrlSFPrompt                  


" --- NERDTree ---
nnoremap <C-t> :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
" let g:NERDTreeMouseMode=3


" --- Coc Stuff ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
let g:coc_global_extensions = [
      \'coc-python',
      \'coc-pyright',
      \'coc-tsserver',
      \'coc-json',
      \'coc-eslint',
      \'coc-css',
      \'coc-prettier']

" CTRL l to jumt to defenition
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
nmap <F2> <Plug>(coc-rename) 

" Tab to accept coc suggestions.
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "<Tab>"

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" --- air-line ---
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

 " airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''


" --- gitgutter ---
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0

" Runs TSEnable highlight and indent when ever (neo)vim starts.
autocmd VimEnter * TSEnable highlight


" --- VimWiki ---

set nocompatible
filetype plugin on
syntax on
let g:vimwiki_text_ignore_newline=0
nmap <leader>wha <Plug>VimwikiAll2HTML

let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
let g:vimwiki_list = [wiki]
autocmd bufenter *.wiki :set textwidth=110
autocmd bufenter *.wiki :set spell

"--- Custom VIM keybinds ---
" Tabs Stuffs.  
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Navigate Vim Windows with ctrl + hjkl
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" Save with CTRL + s
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>
map -a	:call SyntaxAttr()<CR>

" escape removes highlighting by setting the search register (@/) to an empty string.
nnoremap <silent> <esc> :let@/=""<cr><esc>

vnoremap <leader>b c*<esc>pa*
vnoremap <leader>( c(<esc>pa)
vnoremap <leader>[ c[<esc>pa]
vnoremap <leader>{ c{<esc>pa}
vnoremap <leader>" c"<esc>pa"
vnoremap <leader>' c'<esc>pa'
"vnoremap<C-b>


"--- Making shit look nice ---
:colorscheme gruvbox


" Makes the backround transparent for all themes (might break some themes)
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE

