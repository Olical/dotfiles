set tags+=.tags
command! GenerateTags call system('ctags -Rf ./.tags --python-kinds=-i --exclude=.git `cat .srclist`') | echo
