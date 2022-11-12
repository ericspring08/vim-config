set number
set encoding=utf8
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
Plug 'tribela/vim-transparent'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'ghifarit53/tokyonight-vim'
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
Plug 'ryanoasis/vim-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'kyazdani42/nvim-web-devicons'
call plug#end()
let mapleader = " "
colorscheme tokyonight
hi normal guibg=NONE ctermbg=NONE
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

nnoremap <leader>n :NvimTreeFocus<CR>
nnoremap <C-n> :NvimTree<CR>
nnoremap <C-t> :NvimTreeToggle<CR>
nnoremap <C-f> :NvimTreeFind<CR>

nnoremap <s> :w<CR>
nnoremap <Left> <C-W>h
nnoremap <Down> <C-W>j
nnoremap <Up> <C-W>k
nnoremap <Right> <C-W>l

nnoremap <C-a> <Cmd>BufferNext<CR> 
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
let bufferline = get(g:, 'bufferline', {})

" Enable/disable animations
let bufferline.animation = v:true

" Enable/disable auto-hiding the tab bar when there is a single buffer
let bufferline.auto_hide = v:false

" Enable/disable current/total tabpages indicator (top right corner)
let bufferline.tabpages = v:true

" Enable/disable close button
let bufferline.closable = v:true

" Enables/disable clickable tabs
"  - left-click: go to buffer
"  - middle-click: delete buffer
let bufferline.clickable = v:true

" Excludes buffers from the tabline
let bufferline.exclude_ft = ['javascript']
let bufferline.exclude_name = ['package.json']

" Show every buffer
let bufferline.hide = {'current': v:false, 'inactive': v:false, 'visible': v:false}

" Enable/disable icons
" if set to 'buffer_number', will show buffer number in the tabline
" if set to 'numbers', will show buffer index in the tabline
" if set to 'both', will show buffer index and icons in the tabline
" if set to 'buffer_number_with_icon', will show buffer number and icons in the tabline
let bufferline.icons = v:true

" Sets the icon's highlight group.
" If false, will use nvim-web-devicons colors
let bufferline.icon_custom_colors = v:false

" Configure icons on the bufferline.
let bufferline.icon_separator_active = '▎'
let bufferline.icon_separator_inactive = '▎'
let bufferline.icon_close_tab = ''
let bufferline.icon_close_tab_modified = '●'
let bufferline.icon_pinned = '車'

" If true, new buffers will be inserted at the start/end of the list.
" Default is to insert after current buffer.
let bufferline.insert_at_start = v:false
let bufferline.insert_at_end = v:false

" Sets the maximum padding width with which to surround each tab.
let bufferline.maximum_padding = 4

" Sets the minimum padding width with which to surround each tab.
let bufferline.minimum_padding = 1

" Sets the maximum buffer name length.
let bufferline.maximum_length = 30

" If set, the letters for each buffer in buffer-pick mode will be
" assigned based on their name. Otherwise or in case all letters are
" already assigned, the behavior is to assign letters in order of
" usability (see order below)
let bufferline.semantic_letters = v:true

" New buffer letters are assigned in this order. This order is
" optimal for the qwerty keyboard layout but might need adjustement
" for other layouts.
let bufferline.letters =
  \ 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP'

" Sets the name of unnamed buffers. By default format is "[Buffer X]"
" where X is the buffer number. But only a static string is accepted here.
let bufferline.no_name_title = v:null

nnoremap <C-m> :lua require("harpoon.mark").add_file() <CR>
nnoremap <C-p> :lua require("harpoon.ui").toggle_quick_menu() <CR>
