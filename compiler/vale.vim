" Vim compiler file
" Language:    AsciiDoc
" Maintainer:  Jaromir Hradilek <jhradilek@gmail.com>
" URL:         https://github.com/jhradilek/vim-asciidoc
" Last Change: 26 February 2026
" Description: A compiler plugin for AsciiDoctor.

" Do not override run-time compiler settings:
if exists('g:current_compiler')
  finish
endif

" Define the current compiler:
let g:current_compiler = 'vale'

" Ensure the plug-in is compatible with old versions of Vim:
if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

" Save the compatibility options to avoid problems in compatible mode:
let s:save_cpo = &cpo
set cpo&vim

" Use a custom vale output format to produce the messages:
if exists('g:vale_config')
  let &l:makeprg = 'vale --no-wrap --config ' . g:vale_config . ' --output ' . expand('<sfile>:p:h:h') . '/templates/vale.tmpl %'
else
  let &l:makeprg = 'vale --no-wrap --output ' . expand('<sfile>:p:h:h') . '/templates/vale.tmpl %'
endif

" Parse the messages:
CompilerSet errorformat=
  \%f:%l:%c:%trror:\ %m,
  \%f:%l:%c:%tarning:\ %m,
  \%f:%l:%c:%tote:\ %m

" Restore the compatibility options:
let &cpo = s:save_cpo
unlet s:save_cpo
