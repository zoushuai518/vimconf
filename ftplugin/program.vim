" Programming files' common vimscript

if exists('b:_loaded_program') || &cp || version < 700
    finish
endif

let b:_loaded_program = 1

" Format {
    " Set the width of text
    set tw=79
" }

" Tag {
    let g:CTAGS = '/usr/local/bin/ctags'

    " jump to the selected tag
    nmap <S-Right> <C-]>
    " jump back(pop)
    nmap <S-Left> <C-T>
    " jump to the selected tag in a preview window
    nmap <S-Down> :exe('ptag '.expand('<cword>'))<CR>
    " jump to the selected tag in a new tab
    nmap <S-Up> :tab split<CR>:exe('tag '.expand('<cword>'))<CR>
    " jump to the selected tag in a new horizontally split window
    nmap <C-S-Left> :sp <CR>:exe('tag '.expand('<cword>'))<CR>
    " jump to the selected tag in a new vertically split window
    nmap <C-S-Right> :vsp <CR>:exe('tag '.expand('<cword>'))<CR>

    " create a tag file in the current directory
    exe 'nmap <buffer> <C-F12> :!' . g:CTAGS . ' -R -o tags .<CR><CR>'
    " list the tags matching the selected in a preview window(if not, use 'g]')
    nmap <F12> :exe('ptselect '.expand('<cword>'))<CR>
    " list the tags matching the selected in a split window(if not, use 'g]')
    nmap <S-F12> :exe('stselect '.expand('<cword>'))<CR>
    " list tags for the last tag name
    nmap <C-S-F12>  :tselect<CR>

    " set tag files(TODO: configurable)
    let g:TAG_DIR = '~/tags/' . &filetype
    for tagFile in split(globpath(g:TAG_DIR, '*'), '\n')
        if !isdirectory(tagFile)
            exe 'set tags+=' . tagFile
        endif
    endfor
" }

" Compile/Debug {
    nmap <buffer> <F10> :call utils#make()<CR>
    imap <buffer> <F10> <ESC>:call utils#make()<CR>

    " toggle all errors
    nmap <buffer> <C-F9> :call utils#toggleQuickfix(0)<CR>
    imap <buffer> <C-F9> <ESC>:call utils#toggleQuickfix(0)<CR>
    " redisplay the last error
    nmap <buffer> <S-F9>     :cc<CR>
    " list all VALID errors
    nmap <buffer> <F9>       :cl<CR>
    " show previous error
    nmap <buffer> <F7>       :cp<CR>
    " show next error
    nmap <buffer> <F8>       :cn<CR>
" }

" Text object {
    " a function object
    " TODO: currently may depend on syntax, code style, 
    "       indent method and cursor position
    vnoremap <buffer> af :<C-U>silent! norm! [zV]z<CR>
    "vnoremap <buffer> af :<C-U>silent! norm! [[v%<CR>
    omap <buffer> af :norm Vaf<CR>

    vnoremap <buffer> if :<C-U>silent! norm! [zjV]zk<CR>
    omap <buffer> if :norm Vif<CR>
    
" }

"=============Plugin settings=============

if utils#enabledPlugin('taglist') >= 0
    "nmap <ESC>t :TlistToggle<CR>
    "nmap <Leader>l :TlistToggle<CR>
    "nmap <Leader>u :TlistUpdate<CR>
    let Tlist_Ctags_Cmd = g:CTAGS
    let Tlist_Use_Right_Window = 1
    let Tlist_Show_One_File = 1 
    let Tlist_File_Fold_Auto_Close = 1
    let Tlist_Show_Menu = 1
    "let Tlist_Sort_Type=1
    "let Tlist_WinWidth = 50
    "let Tlist_Auto_Open = 1

    " manually load
    call utils#loadPlugin('taglist')
endif

if utils#enabledPlugin('tagbar') >= 0
    nmap <buffer> <Leader>T :TagbarToggle<CR>
    let g:tagbar_ctags_bin = g:CTAGS
    let g:tagbar_autofocus = 1 " auto focus when open

    " manually load
    call utils#loadPlugin('tagbar')
endif

if utils#enabledPlugin('nerdcommenter') >= 0
    " manually load
    call utils#loadPlugin('nerdcommenter')
    " FIXME:
    " DON'T work if the user changes filetype after opening a non-program file
endif

if utils#enabledPlugin('autoclose') >= 0
    nmap <buffer> <Leader>A <Plug>ToggleAutoCloseMappings

    " don't load unless explicitly requested
    " since the plugin conflicts with non-English input(ESC mapping)
    if exists('g:needAutoclose')
        call utils#loadPlugin('autoclose')
    endif
endif
