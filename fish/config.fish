
set -x CLICOLOR 1

function parse_git_branch
  # git branch outputs lines, the current branch is prefixed with a *
  set -l branch (git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/') 
  git diff --quiet HEAD ^&-
  if test $status = 1
    echo (set_color red)"($branch)"
  else
    echo (set_color blue)"($branch)"
  end
end

function fish_prompt -d "Write out the prompt"
  ~/bin/nametab (basename (pwd))
  printf '%s%s@%s%s' (set_color brown) (whoami) (hostname|cut -d . -f 1) (set_color normal) 

  # Color writeable dirs green, read-only dirs red
  if test -w "."
    printf ' %s%s' (set_color green) (prompt_pwd)
  else
    printf ' %s%s' (set_color red) (prompt_pwd)
  end

  # Print git branch
  if test -z (git branch --quiet 2>| awk '/fatal:/ {print "no git"}')
    printf ' %s%s%s' (set_color normal) (parse_git_branch)
  end
  printf '%s> ' (set_color normal)
end

# Load custom settings for current hostname
set HOST_SPECIFIC_FILE ~/.config/fish/(hostname).fish
if test -f $HOST_SPECIFIC_FILE
   . $HOST_SPECIFIC_FILE
else 
   echo Creating host specific file: $HOST_SPECIFIC_FILE
   touch $HOST_SPECIFIC_FILE
end
   
# Load custom settings for current user
set USER_SPECIFIC_FILE ~/.config/fish/(whoami).fish
if test -f $USER_SPECIFIC_FILE
   . $USER_SPECIFIC_FILE
else
   echo Creating user specific file: $USER_SPECIFIC_FILE
   touch $USER_SPECIFIC_FILE
end

# Load custom settings for current OS
set PLATFORM_SPECIFIC_FILE ~/.config/fish/(uname -s).fish
if test -f $PLATFORM_SPECIFIC_FILE
   . $PLATFORM_SPECIFIC_FILE
else
   echo Creating platform specific file: $PLATFORM_SPECIFIC_FILE
   touch $PLATFORM_SPECIFIC_FILE
end  

function v
  ls -lah
end

function github
  git clone git@github.com:/jgallen23/$1.git
end
