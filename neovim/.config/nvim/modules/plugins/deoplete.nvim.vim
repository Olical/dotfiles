let g:deoplete#enable_at_startup = 1

call deoplete#custom#option('omni_patterns', {
\ 'clojure': '[\w!$%&*+/:<=>?@\^_~\-\.#]*',
\})

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
set completeopt-=preview
