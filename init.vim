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
set smartindent
set tabstop=2
set expandtab
set shiftwidth=2
call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'arzg/vim-colors-xcode'
Plug 'ryanoasis/vim-devicons'
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
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'glepnir/dashboard-nvim'
Plug 'tpope/vim-commentary'
call plug#end()
let mapleader = " "
colorscheme xcodedarkhc
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

nnoremap <leader>n :NvimTreeFocus<CR>
nnoremap <C-n> :NvimTree<CR>
nnoremap <C-t> :NvimTreeToggle<CR>
nnoremap <C-f> :NvimTreeFind<CR>

nnoremap <s> :w<CR>
nnoremap <Left> <C-W>h
nnoremap <Down> <C-W>j
nnoremap <Up> <C-W>k
nnoremap <Right> <C-W>l
lua << EOF
require("nvim-tree").setup()
  local home = os.getenv('HOME')
  local db = require('dashboard')
  -- macos
  -- linux
  --
  db.custom_center = 'default'
  db.preview_file_height = 11
  db.preview_file_width = 70
  db.custom_center = {
      {icon = '  ',
      desc = 'Recently latest session                  ',
      shortcut = 'SPC s l',
      action ='SessionLoad'},
      {icon = '  ',
      desc = 'Recently opened files                   ',
      action =  'DashboardFindHistory',
      shortcut = 'SPC f h'},
      {icon = '  ',
      desc = 'Find  File                              ',
      action = 'Telescope find_files',
      shortcut = 'SPC f f'},
      {icon = '  ',
      desc ='File Browser                            ',
      action =  'NvimTreeToggle',
      shortcut = 'SPC f b'},
    }
EOF
