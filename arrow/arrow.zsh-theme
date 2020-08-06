autoload -Uz colors && colors

precmd ()
{
	PROMPT="%{$fg[blue]%}%~%{$reset_color%} %{$fg_bold[blue]%}➤%{$reset_color%} "
}
