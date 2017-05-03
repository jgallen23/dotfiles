# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish
set -x CLICOLOR 1
set -x EDITOR vim
set -x CDPATH $CDPATH . ~ $HOME/projects $HOME/clients
set -gx PATH /home/ubuntu/projects/aws-extras $PATH
set -gx FZF_DEFAULT_COMMAND 'ag --hidden --ignore .git -g ""'

if test -f $HOME/.fish_env
  . $HOME/.fish_env
end
