" Fisa-vim-config
" http://fisadev.github.io/fisa-vim-config/
" version: 8.3.1

" ============================================================================
" Vim-plug initialization
" Avoid modify this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
  echo "Installing Vim-plug..."
  echo ""
  silent !mkdir -p ~/.vim/autoload
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/    master/plug.vim
  let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
  :execute 'source '.fnameescape(vim_plug_path)
endif

" Obscure hacks done, you can now modify the rest of the .vimrc as you wish :)

" ============================================================================
" Active plugins
" You can disable or add new ones here:

" this needs to be here, so vim-plug knows we are declaring the plugins we
" want to use
call plug#begin('~/.vim/plugged')

" Plugins from github repos:

" Override configs by directory
Plug 'arielrossanigo/dir-configs-override.vim'
" Better file browser
Plug 'scrooloose/nerdtree'
" Code commenter
Plug 'scrooloose/nerdcommenter'
" Class/module browser
Plug 'majutsushi/tagbar'
" Code and files fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'
" Extension to ctrlp, for fuzzy command finder
Plug 'fisadev/vim-ctrlp-cmdpalette'
" Zen coding
Plug 'mattn/emmet-vim'
" Git integration
Plug 'motemen/git-vim'
" Tab list panel
Plug 'kien/tabman.vim'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
 56 Plug 'vim-airline/vim-airline-themes'
 57 " Terminal Vim with 256 colors colorscheme
 58 Plug 'fisadev/fisa-vim-colorscheme'
 59 " Consoles as buffers
 60 Plug 'rosenfeld/conque-term'
 61 " Pending tasks list
 62 Plug 'fisadev/FixedTaskList.vim'
 63 " Surround
 64 Plug 'tpope/vim-surround'
 65 " Autoclose
 66 Plug 'Townk/vim-autoclose'
 67 " Indent text object
 68 Plug 'michaeljsmith/vim-indent-object'
 69 " Indentation based movements
 70 Plug 'jeetsukumaran/vim-indentwise'
 71 " Python autocompletion, go to definition.
 72 Plug 'davidhalter/jedi-vim'
 73 " Better autocompletion
 74 Plug 'Shougo/neocomplcache.vim'
 75 " Snippets manager (SnipMate), dependencies, and snippets repo
 76 Plug 'MarcWeber/vim-addon-mw-utils'
 77 Plug 'tomtom/tlib_vim'
 78 Plug 'honza/vim-snippets'
 79 Plug 'garbas/vim-snipmate'
 80 " Git/mercurial/others diff icons on the side of the file lines
 81 Plug 'mhinz/vim-signify'
 82 " Automatically sort python imports
 83 Plug 'fisadev/vim-isort'
 84 " Drag visual blocks arround
 85 Plug 'fisadev/dragvisuals.vim'
 86 " Window chooser
 87 Plug 't9md/vim-choosewin'
 88 " Python and other languages code checker
 89 Plug 'scrooloose/syntastic'
 90 " Paint css colors with the real color
 91 Plug 'lilydjwg/colorizer'
 92 " Ack code search (requires ack installed in the system)
 93 Plug 'mileszs/ack.vim'
 94 if has('python')
 95     " YAPF formatter for Python
 96     Plug 'pignacio/vim-yapf-format'
 97 endif
 98 " Relative numbering of lines (0 is the current line)
 99 " (disabled by default because is very intrusive and can't be easily toggled
100 " on/off. When the plugin is present, will always activate the relative 
101 " numbering every time you go to normal mode. Author refuses to add a setting 
102 " to avoid that)
103 " Plug 'myusuf3/numbers.vim'
104 
105 " Plugins from vim-scripts repos:
106 
107 " Search results counter
108 Plug 'vim-scripts/IndexedSearch'
109 " XML/HTML tags navigation
110 Plug 'vim-scripts/matchit.zip'
111 " Gvim colorscheme
112 Plug 'vim-scripts/Wombat'
113 " Yank history navigation
114 Plug 'vim-scripts/YankRing.vim'
115 
116 " Tell vim-plug we finished declaring plugins, so it can load them
117 call plug#end()
118 
119 " ============================================================================
120 " Install plugins the first time vim runs
121 
122 if vim_plug_just_installed
123     echo "Installing Bundles, please ignore key map error messages"
124     :PlugInstall
125 endif
126 
127 " ============================================================================
128 " Vim settings and mappings
129 " You can edit them as you wish
130 
131 " no vi-compatible
132 set nocompatible
133 
134 " allow plugins by file type (required for plugins!)
135 filetype plugin on
136 filetype indent on
137 
138 " tabs and spaces handling
139 set expandtab
140 set tabstop=4
141 set softtabstop=4
142 set shiftwidth=4
143 
144 " tab length exceptions on some file types
145 autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4
146 autocmd FileType htmldjango setlocal shiftwidth=4 tabstop=4 softtabstop=4
147 autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4
148 
149 " always show status bar
150 set ls=2
151 
152 " incremental search
153 set incsearch
154 " highlighted search results
155 set hlsearch
156 
157 " syntax highlight on
158 syntax on
159 
160 " show line numbers
161 set nu
162 
163 " tab navigation mappings
164 map tn :tabn<CR>
165 map tp :tabp<CR>
166 map tm :tabm
167 map tt :tabnew
168 map ts :tab split<CR>
169 map <C-S-Right> :tabn<CR>
170 imap <C-S-Right> <ESC>:tabn<CR>
171 map <C-S-Left> :tabp<CR>
172 imap <C-S-Left> <ESC>:tabp<CR>
173 
174 " navigate windows with meta+arrows
175 map <M-Right> <c-w>l
176 map <M-Left> <c-w>h
177 map <M-Up> <c-w>k
178 map <M-Down> <c-w>j
179 imap <M-Right> <ESC><c-w>l
180 imap <M-Left> <ESC><c-w>h
181 imap <M-Up> <ESC><c-w>k
182 imap <M-Down> <ESC><c-w>j
183 
184 " old autocomplete keyboard shortcut
185 imap <C-J> <C-X><C-O>
186 
187 " Comment this line to enable autocompletion preview window
188 " (displays documentation related to the selected completion option)
189 " Disabled by default because preview makes the window flicker
190 set completeopt-=preview
191 
192 " save as sudo
193 ca w!! w !sudo tee "%"
194 
195 " simple recursive grep
196 nmap ,r :Ack
197 nmap ,wr :Ack <cword><CR>
198 
199 " use 256 colors when possible
200 "if (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256') || has('nvim')
201 "   let &t_Co = 256
202 "    colorscheme fisa
203 "else
204 "    colorscheme delek
205 "endif
206 
207 " colors for gvim
208 if has('gui_running')
209     colorscheme wombat
210 endif
211 
212 " when scrolling, keep cursor 3 lines away from screen border
213 set scrolloff=3
214 
215 " autocompletion of files and commands behaves like shell
216 " (complete only the common part, list the options that match)
217 set wildmode=list:longest
218 
219 " better backup, swap and undos storage
220 set directory=~/.vim/dirs/tmp     " directory to place swap files in
221 set backup                        " make backup files
222 set backupdir=~/.vim/dirs/backups " where to put backup files
223 set undofile                      " persistent undos - undo after you re-open the file
224 set undodir=~/.vim/dirs/undos
225 set viminfo+=n~/.vim/dirs/viminfo
226 " store yankring history file there too
227 let g:yankring_history_dir = '~/.vim/dirs/'
228 
229 " create needed directories if they don't exist
230 if !isdirectory(&backupdir)
231     call mkdir(&backupdir, "p")
232 endif
233 if !isdirectory(&directory)
234     call mkdir(&directory, "p")
235 endif
236 if !isdirectory(&undodir)
237     call mkdir(&undodir, "p")
238 endif
239 
240 " ============================================================================
241 " Plugins settings and mappings
242 " Edit them as you wish.
243 
244 " Tagbar ----------------------------- 
245 
246 " toggle tagbar display
247 map <F4> :TagbarToggle<CR>
248 " autofocus on tagbar open
249 let g:tagbar_autofocus = 1
250 
251 " NERDTree ----------------------------- 
252 
253 " toggle nerdtree display
254 map <F3> :NERDTreeToggle<CR>
255 " open nerdtree with the current file selected
256 nmap ,t :NERDTreeFind<CR>
257 " don;t show these file types
258 let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
259 
260 
261 " Tasklist ------------------------------
262 
263 " show pending tasks list
264 map <F2> :TaskList<CR>
265 
266 " CtrlP ------------------------------
267 
268 " file finder mapping
269 let g:ctrlp_map = ',e'
270 " tags (symbols) in current file finder mapping
271 nmap ,g :CtrlPBufTag<CR>
272 " tags (symbols) in all files finder mapping
273 nmap ,G :CtrlPBufTagAll<CR>
274 " general code finder in all files mapping
275 nmap ,f :CtrlPLine<CR>
276 " recent files finder mapping
277 nmap ,m :CtrlPMRUFiles<CR>
278 " commands finder mapping
279 nmap ,c :CtrlPCmdPalette<CR>
280 " to be able to call CtrlP with default search text
281 function! CtrlPWithSearchText(search_text, ctrlp_command_end)
282     execute ':CtrlP' . a:ctrlp_command_end
283     call feedkeys(a:search_text)
284 endfunction
285 " same as previous mappings, but calling with current word as default text
286 nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
287 nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
288 nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
289 nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
290 nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
291 nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
292 nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
293 " don't change working directory
294 let g:ctrlp_working_path_mode = 0
295 " ignore these files and folders on file finder
296 let g:ctrlp_custom_ignore = {
297   \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules)$',
298   \ 'file': '\.pyc$\|\.pyo$',
299   \ }
300 
301 " Syntastic ------------------------------
302 
303 " show list of errors and warnings on the current file
304 nmap <leader>e :Errors<CR>
305 " check also when just opened the file
306 let g:syntastic_check_on_open = 1
307 " don't put icons on the sign column (it hides the vcs status icons of signify)
308 let g:syntastic_enable_signs = 0
309 " custom icons (enable them if you use a patched font, and enable the previous 
310 " setting)
311 "let g:syntastic_error_symbol = '✗'
312 "let g:syntastic_warning_symbol = '⚠'
313 "let g:syntastic_style_error_symbol = '✗'
314 "let g:syntastic_style_warning_symbol = '⚠'
315 
316 " Jedi-vim ------------------------------
317 
318 " All these mappings work only for python code:
319 " Go to definition
320 let g:jedi#goto_command = ',d'
321 " Find ocurrences
322 let g:jedi#usages_command = ',o'
323 " Find assignments
324 let g:jedi#goto_assignments_command = ',a'
325 " Go to definition in new tab
326 nmap ,D :tab split<CR>:call jedi#goto()<CR>
327 
328 " NeoComplCache ------------------------------
329 
330 " most of them not documented because I'm not sure how they work
331 " (docs aren't good, had to do a lot of trial and error to make 
332 " it play nice)
333 let g:neocomplcache_enable_at_startup = 1
334 let g:neocomplcache_enable_ignore_case = 1
335 let g:neocomplcache_enable_smart_case = 1
336 let g:neocomplcache_enable_auto_select = 1
337 let g:neocomplcache_enable_fuzzy_completion = 1
338 let g:neocomplcache_enable_camel_case_completion = 1
339 let g:neocomplcache_enable_underbar_completion = 1
340 let g:neocomplcache_fuzzy_completion_start_length = 1
341 let g:neocomplcache_auto_completion_start_length = 1
342 let g:neocomplcache_manual_completion_start_length = 1
343 let g:neocomplcache_min_keyword_length = 1
344 let g:neocomplcache_min_syntax_length = 1
345 " complete with workds from any opened file
346 let g:neocomplcache_same_filetype_lists = {}
347 let g:neocomplcache_same_filetype_lists._ = '_'
348 
349 " TabMan ------------------------------
350 
351 " mappings to toggle display, and to focus on it
352 let g:tabman_toggle = 'tl'
353 let g:tabman_focus  = 'tf'
354 
355 " Autoclose ------------------------------
356 
357 " Fix to let ESC work as espected with Autoclose plugin
358 let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}
359 
360 " DragVisuals ------------------------------
361 
362 " mappings to move blocks in 4 directions
363 vmap <expr> <S-M-LEFT> DVB_Drag('left')
364 vmap <expr> <S-M-RIGHT> DVB_Drag('right')
365 vmap <expr> <S-M-DOWN> DVB_Drag('down')
366 vmap <expr> <S-M-UP> DVB_Drag('up')
367 " mapping to duplicate block
368 vmap <expr> D DVB_Duplicate()
369 
370 " Signify ------------------------------
371 
372 " this first setting decides in which order try to guess your current vcs
373 " UPDATE it to reflect your preferences, it will speed up opening files
374 let g:signify_vcs_list = [ 'git', 'hg' ]
375 " mappings to jump to changed blocks
376 nmap <leader>sn <plug>(signify-next-hunk)
377 nmap <leader>sp <plug>(signify-prev-hunk)
378 " nicer colors
379 highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
380 highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
381 highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
382 highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
383 highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
384 highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227
385 
386 " Window Chooser ------------------------------
387 
388 " mapping
389 nmap  -  <Plug>(choosewin)
390 " show big letters
391 let g:choosewin_overlay_enable = 1
392 
393 " Airline ------------------------------
394 
395 let g:airline_powerline_fonts = 0
396 let g:airline_theme = 'bubblegum'
397 let g:airline#extensions#whitespace#enabled = 0
398 
399 " to use fancy symbols for airline, uncomment the following lines and use a
400 " patched font (more info on the README.rst)
401 "if !exists('g:airline_symbols')
402 "   let g:airline_symbols = {}
403 "endif
404 "let g:airline_left_sep = '⮀'
405 "let g:airline_left_alt_sep = '⮁'
406 "let g:airline_right_sep = '⮂'
407 "let g:airline_right_alt_sep = '⮃'
408 "let g:airline_symbols.branch = '⭠'
409 "let g:airline_symbols.readonly = '⭤'
410 "let g:airline_symbols.linenr = '⭡'
