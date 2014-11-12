set tags+=.tags
command! GenerateTags Dispatch ctags -Rf ./.tags --exclude=.git `cat .tagsources`
