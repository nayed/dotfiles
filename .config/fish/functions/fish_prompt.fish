# Display full path instead of abbreviated path.
# Set once at load time rather than on every prompt render.
set -g fish_prompt_pwd_dir_length 0

function fish_prompt --description 'Write out the prompt'
  set -l last_pipestatus $pipestatus

  set -q __fish_git_prompt_show_informative_status; or set -g __fish_git_prompt_show_informative_status 1
  set -q __fish_git_prompt_hide_untrackedfiles; or set -g __fish_git_prompt_hide_untrackedfiles 1
  set -q __fish_git_prompt_color_branch; or set -g __fish_git_prompt_color_branch magenta --bold
  set -q __fish_git_prompt_showupstream; or set -g __fish_git_prompt_showupstream "informative"
  set -q __fish_git_prompt_char_upstream_ahead; or set -g __fish_git_prompt_char_upstream_ahead "↑ "
  set -q __fish_git_prompt_char_upstream_behind; or set -g __fish_git_prompt_char_upstream_behind "↓ "
  set -q __fish_git_prompt_char_upstream_prefix; or set -g __fish_git_prompt_char_upstream_prefix ""
  set -q __fish_git_prompt_char_stagedstate; or set -g __fish_git_prompt_char_stagedstate "● "
  set -q __fish_git_prompt_char_dirtystate; or set -g __fish_git_prompt_char_dirtystate "✚ "
  set -q __fish_git_prompt_char_untrackedfiles; or set -g __fish_git_prompt_char_untrackedfiles "… "
  set -q __fish_git_prompt_char_invalidstate; or set -g __fish_git_prompt_char_invalidstate "✖ "
  set -q __fish_git_prompt_char_cleanstate; or set -g __fish_git_prompt_char_cleanstate "✔"
  set -q __fish_git_prompt_color_dirtystate; or set -g __fish_git_prompt_color_dirtystate blue
  set -q __fish_git_prompt_color_stagedstate; or set -g __fish_git_prompt_color_stagedstate yellow
  set -q __fish_git_prompt_color_invalidstate; or set -g __fish_git_prompt_color_invalidstate red
  set -q __fish_git_prompt_color_untrackedfiles; or set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
  set -q __fish_git_prompt_color_cleanstate; or set -g __fish_git_prompt_color_cleanstate green --bold

  set -l color_user
  set -l suffix
  switch "$USER"
    case root toor
      set color_user red
      set suffix '#'
    case '*'
      set color_user blue
      set suffix \uf007
  end

  # Username
  set_color --bold $color_user
  printf '\n%s ' "$USER"

  # PWD
  set_color cyan
  echo -n (prompt_pwd)
  set_color normal

  printf '%s ' (fish_vcs_prompt)

  set -l pipestatus_string (__fish_print_pipestatus "[" "] " "|" (set_color $fish_color_status) (set_color --bold $fish_color_status) $last_pipestatus)
  echo -n $pipestatus_string
  set_color normal

  printf "\n"

  set_color brwhite
  echo -n "$suffix "
end
