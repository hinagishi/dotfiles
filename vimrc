if has('vim_starting')
   set nocompatible               " Be iMproved

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 NeoBundle 'Shougo/neocomplete.vim' 
 NeoBundle 'Shougo/unite.vim'
 NeoBundle 'Shougo/vimshell.vim'
 NeoBundle 'Shougo/vimproc.vim'
 NeoBundle 'Shougo/neosnippet.vim'
 NeoBundle 'Shougo/neosnippet-snippets'
 NeoBundle 'git://github.com/hinagishi/wombat256.vim.git'
 NeoBundle 'git://github.com/altercation/vim-colors-solarized.git'
 NeoBundle 'git://github.com/Shougo/unite-ssh.git'
 NeoBundle 'git://github.com/Shougo/vimfiler.git'
 NeoBundle 'git://github.com/Shougo/unite-build.git'
 NeoBundle 'git://github.com/ujihisa/neco-look.git'
 NeoBundle 'git://github.com/mattn/emmet-vim'
 NeoBundle 'https://github.com/tyru/eskk.vim.git'
 NeoBundle 'https://github.com/majutsushi/tagbar.git'
 NeoBundle 'https://github.com/Shougo/unite-outline.git'
 NeoBundle 'haya14busa/incsearch.vim'
 NeoBundle 'marijnh/tern_for_vim', {
    \ 'build': {
    \   'others': 'npm install'
    \}}


 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck


 set t_Co=256
 colorscheme wombat256mod
 let g:solarized_termcolors=256

 set autoindent
 set autoread
 set backspace=indent,eol,start
 set foldmethod=marker
 set hidden
 set ignorecase
 set incsearch
 set nohlsearch
 set noswapfile
 set number
 set expandtab
 set shiftwidth=4
 set showmatch
 set matchtime=1
 set showmode
 set tabstop=4
 set wrap
 set ruler
 set virtualedit+=block
set cursorcolumn
set cursorline
set textwidth=100
set pumheight=10
 syntax enable

 let g:vimfiler_as_default_explorer = 1


 "unite.vim
 let g:unite_enable_start_insert=0
 noremap <silent> <Space>uf :Unite -winheight=15 -buffer-name=file file<CR>
 noremap <silent> <Space>ub :Unite buffer<CR>
 noremap <silent> <Space>up :Unite process<CR>
 noremap <silent> <Space>um :Unite file_mru<CR>
 noremap <silent> <Space>ur :Unite register<CR>
 noremap <silent> <Space>uo :Unite outline<CR>
 noremap <silent> <Space>ubd :Unite build<CR>
 noremap <silent> <Space>uw :UniteWithBufferDir file<CR>
 noremap <silent> <Space>un :Unite file/new<CR>
 au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
 au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
"

"neocomplete
	let g:neocomplete#enable_at_startup = 1
	let g:neocomplete#enable_ignore_case = 1
	let g:neocomplete#enable_smart_case = 1
	let g:neocomplete#sources#syntax#min_keyword_length = 3
	let g:neocomplete#sources#dictionary#dictionaries = {
	\ 'default' : '',
	\'vimshell' : $HOME.'/.vimshell_hist',
	\'cpp' : $HOME.'/.cpp_hist',
	\'java' : $HOME.'/.java_hist',
	\'javascript' : $HOME.'/.js_hist',
	\'tex' : $HOME.'/.tex_hist',
	\'plaintex' : $HOME.'/.tex_hist'
	\}
"Keymap
inoremap <expr><C-c> neocomplete#cancel_popup()
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-h> neocomplete#smart_close_popup() . '<C-h>'
inoremap <expr><BS>  neocomplete#smart_close_popup() . '<BS>'
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-l> neocomplete#complete_common_string()
nnoremap <C-l><C-i> :set list!<CR>
nnoremap <C-h><C-l> :set hlsearch!<CR>
nnoremap <C-p><C-p> :set paste!<CR>
"

"neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

"supertab like snippets behavior
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? 
			\ "\<Plug>(neosnippet_expand_or_jump)"
			\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? 
			\ "\<Plug>(neosnippet_expand_or_jump)"
			\: "\<TAB>"
"


"Unite grep
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates = 200
nnoremap <silent> <Space>ug :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> <Space>cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W><CR>
nnoremap <silent> <Space>rg :<C-u>UniteResume search-buffer<CR>

"VimFiler
nnoremap <silent> <Space>f :VimFiler<CR>

"ToggleNumberOptions
if version >= 703
	nnoremap <silent> <Leader>n :call ToggleNumber()<CR>
	function ToggleNumber()
		if &number
			set relativenumber
		elseif &relativenumber
			set number
		endif
	endfunction
endif

set laststatus=2
nnoremap <Space>e :e ~/.vimrc<CR>


"emmet-vim (for zen-coding)
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"eskk.vim
set imdisable
let g:eskk#enable_completion = 1
imap <C-r> <Plug>(eskk:toggle)

nnoremap <silent><Space>E :TagbarToggle<CR>


"incsearch.vim
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

autocmd BufNewFile *.html 0r $HOME/.vim/template/html.txt
autocmd BufNewFile *.c 0r $HOME/.vim/template/c.txt
autocmd BufNewFile *.cpp 0r $HOME/.vim/template/cpp.txt
autocmd BufNewFile *.tex 0r $HOME/.vim/template/tex.txt

