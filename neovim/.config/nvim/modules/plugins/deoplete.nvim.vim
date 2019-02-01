let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
set completeopt-=preview

call deoplete#custom#source('omni', 'functions', {
      \ 'clojure': ['conjure#omnicomplete']
      \})

call deoplete#custom#var('omni', 'input_patterns', {
      \ 'clojure': '\w+|/|\.|\-'
      \})
