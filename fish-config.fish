function fish_prompt
	set_color $fish_color_cwd
	echo -n (prompt_pwd)
	set_color normal
	echo -n ' $ '
end

set -x EDITOR vim
set -x LSCOLORS ExGxBxDxCxEgEdxbxgxcxd