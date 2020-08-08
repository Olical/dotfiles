export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH

if [ -f "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" ]
then
  . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
fi

if [[ $(ps --no-header --pid=$PPID --format=cmd) != "fish" ]] \
  && [ -z "$BASH_EXECUTION_STRING" ] \
  && [[ $- == *i* ]] \
  && command -v fish &> /dev/null
then
   exec fish
fi
