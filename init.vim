set number
set relativenumber
set ru
set nohlsearch
set hidden
set noswapfile
set incsearch
set scrolloff=8
set nowrap
set termguicolors
set signcolumn=yes
call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'EdenEast/nightfox.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pantharshit00/vim-prisma'
Plug 'ervandew/supertab'
Plug 'neovim/nvim-lspconfig'
Plug 'github/copilot.vim'
Plug 'f-person/git-blame.nvim'
Plug 'ThePrimeagen/vim-be-good'
Plug 'nvim-lua/plenary.nvim' " don't forget to add this one if you don't have it yet!
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'
call plug#end()
colorscheme nightfox 
let mapleader = " "

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

let g:coc_global_extensions = ['coc-tsserver', 'coc-pyright', 'coc-tailwindcss', 'coc-json', 'coc-markdownlint', 'coc-go', 'coc-clangd']
let g:tailwindcss_filetypes = ['javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'svelte', 'html', 'css', 'scss', 'less']
" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
map <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)

" remap copilot autocomplete
imap <silent><script><expr> <C-Tab> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

lua << EOF
require("nvim-tree").setup()
EOF
