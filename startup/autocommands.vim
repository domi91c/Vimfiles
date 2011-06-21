" Custom autocommands group:
augroup custom
  " Clear all custom autocommands:
  autocmd!

  " Clean all useless whitespace:
  autocmd BufWritePre * CleanWhitespace

  " When editing a file, always jump to the last known cursor position.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  autocmd FileType text setlocal textwidth=98

  autocmd BufEnter *.c setlocal tags+=~/tags/unix.tags

  autocmd BufEnter *.c    compiler gcc
  autocmd BufEnter *.cpp  compiler gcc
  autocmd BufEnter *.php  compiler php
  autocmd BufEnter *.html compiler tidy
  autocmd BufEnter *.xml  compiler eclim_xmllint
  autocmd BufEnter *.js   compiler jsl

  autocmd BufEnter Gemfile RunCommand !bundle install

  autocmd BufEnter *access.log* set filetype=httplog
  autocmd BufEnter *.hsc        set filetype=haskell
  autocmd BufEnter *.tags       set filetype=tags
  autocmd BufEnter jquery.*.js  set filetype=jquery
  autocmd BufEnter httpd*.conf  set filetype=apache

  autocmd User BufEnterRails Rnavcommand factory spec/factories -glob=* -suffix=.rb -default=model()

  " For some reason, this doesn't work in ftplugin/man.vim
  autocmd FileType man set nonu

  " Custom filetypes:
  autocmd BufEnter Result set filetype=dbext_result.txt

  " Experimental omnicompletion
  autocmd FileType ruby setlocal omnifunc=rubycomplete_custom#Complete

  " Maximise on open on Win32:
  if has('win32')
    autocmd GUIEnter * simalt ~x
  endif
augroup end
