autoload -Uz colors && colors

precmd ()
{
	PROMPT="%{$fg[blue]%}$(virtualenv_prompt_info)%{$reset_color%}%{$fg[blue]%}%~%{$reset_color%} %{$fg_bold[blue]%}➤%{$reset_color%} "
}
