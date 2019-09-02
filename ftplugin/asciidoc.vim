" Vim filetype plugin file
" Language:    AsciiDoc
" Maintainer:  Jaromir Hradilek <jhradilek@gmail.com>
" URL:         https://github.com/jhradilek/vim-asciidoc
" Last Change: 3 September 2019
" Description: A filetype plugin file for the AsciiDoc markup language.

" Run this plugin only once for the current buffer:
if exists('b:did_ftplugin')
  finish
endif

" Save the compatibility options to avoid problems in compatible mode:
let s:save_cpo = &cpo
set cpo&vim

" Add support for the Tagbar plug-in:
let g:tagbar_type_asciidoc = {
  \ 'ctagstype': 'asciidoc',
  \ 'deffile': expand('<sfile>:p:h:h') . '/ctags/asciidoc.cnf',
  \ 'sort': 0,
  \ 'kinds': [
    \ 's:Table of Contents',
    \ 'i:Included Files',
    \ 'I:Images',
    \ 'v:Videos'
  \ ]
\}

" Restore the compatibility options:
let &cpo = s:save_cpo
unlet s:save_cpo
