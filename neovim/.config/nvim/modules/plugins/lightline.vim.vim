function! LightlineFilename()
  let l:name = winwidth(0) > 70 ? expand('%:p:h:t') . '/' . expand('%:t') : expand('%:t')
  return expand('%:t') !=# '' ? l:name : ''
endfunction

function! LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 && &filetype !=# '' ? &filetype : ''
endfunction

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'readonly': 'LightlineReadonly',
      \   'filetype': 'LightlineFiletype',
      \ },
      \ 'active': {
      \   'left': [['mode', 'paste'],
      \            ['readonly', 'filename', 'modified']],
      \   'right': [['lineinfo'],
      \             ['percent']]
      \ },
      \ 'inactive': {
      \   'left': [['filename']],
      \   'right': []
      \ },
      \ }
