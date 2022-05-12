" Vim compiler file
" Language:    AsciiDoc
" Maintainer:  Jaromir Hradilek <jhradilek@gmail.com>
" URL:         https://github.com/jhradilek/vim-asciidoc
" Last Change: 13 May 2022
" Description: A compiler plugin for AsciiDoctor.

" Do not override run-time compiler settings:
if exists('g:current_compiler')
  finish
endif

" Define the current compiler:
let g:current_compiler = 'asciidoctor'

" Ensure the plug-in is compatible with old versions of Vim:
if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

" Use asciidoctor to build the file and produce errors:
CompilerSet makeprg=asciidoctor\ -v\ --safe\ %

" Parse error messages:
CompilerSet errorformat=
  \%.%#:\ %tRROR:\ %f:\ line\ %l:\ %m,
  \%.%#:\ %tARNING:\ %f:\ line\ %l:\ %m,
  \%.%#:\ %tARNING:\ %m,
  \%.%#:\ %tNFO:\ %m,
  \%E%.%#:\ FAILED:\ %m,
  \%-Z%.%#

" Save the compatibility options to avoid problems in compatible mode:
let s:save_cpo = &cpo
set cpo&vim

" Restore the compatibility options:
let &cpo = s:save_cpo
unlet s:save_cpo
