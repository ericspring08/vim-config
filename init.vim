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
Plug 'andweeb/presence.nvim'
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
Plug 'townk/vim-autoclose'
call plug#end()
let mapleader = " "
colorscheme tokyonight
hi normal guibg=NONE ctermbg=NONE
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg :lua require('telescope.builtin').live_grep({grep_open_files=true})<CR>
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
" default
let g:transparent_groups = ['Normal', 'Comment', 'Constant', 'Special', 'Identifier',
                            \ 'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String',
                            \ 'Function', 'Conditional', 'Repeat', 'Operator', 'Structure',
                            \ 'LineNr', 'NonText', 'SignColumn', 'CursorLineNr', 'EndOfBuffer']

" Pmenu
let g:transparent_groups += ['Pmenu']

" coc.nvim
let g:transparent_groups += ['NormalFloat', 'CocFloating']

augroup transparent
    autocmd VimEnter,ColorScheme * call MyTransparent()
augroup END

function! MyTransparent()
    " Customize the highlight groups for transparency in here.

    " CursorLine
    "hi CursorLine ctermfg=NONE ctermbg=239 guibg=NONE guibg=#4e4e4e

    " coc.nvim
    "hi CocMenuSel ctermbg=239 guibg=#4e4e4e
endfunction

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
      {icon = '📅  ',
      desc = 'Recently latest session                  ',
      shortcut = 'SPC s l',
      action ='lua require("harpoon").load_session()'},
      {icon = '🗄️ ',
      desc = 'Recently opened files                   ',
      action =  'DashboardFindHistory',
      shortcut = 'SPC f h'},
      {icon = '🔍 ',
      desc = 'Find  File                              ',
      action = 'Telescope find_files',
      shortcut = 'SPC f f'},
      {icon = '📁 ',
      desc ='File Browser                            ',
      action =  'NvimTreeToggle',
      shortcut = 'SPC f b'},
    }
EOF
nnoremap <C-m> :lua require("harpoon.mark").add_file() <CR>
nnoremap <C-p> :lua require("harpoon.ui").toggle_quick_menu() <CR>

au VimLeave * :lua require("harpoon").save_session()
au VimLeave * :

" General options
let g:presence_auto_update         = 1
let g:presence_neovim_image_text   = "The One True Text Editor"
let g:presence_main_image          = "neovim"
let g:presence_client_id           = "793271441293967371"
let g:presence_log_level           = "debug"
let g:presence_debounce_timeout    = 10
let g:presence_enable_line_number  = 0
let g:presence_blacklist           = []
let g:presence_buttons             = 1
let g:presence_file_assets         = {}
let g:presence_show_time           = 1

" Rich Presence text options
let g:presence_editing_text        = "Editing %s"
let g:presence_file_explorer_text  = "Browsing %s"
let g:presence_git_commit_text     = "Committing changes"
let g:presence_plugin_manager_text = "Managing plugins"
let g:presence_reading_text        = "Reading %s"
let g:presence_workspace_text      = "Working on %s"
let g:presence_line_number_text    = "Line %s out of %s"
