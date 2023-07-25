# zmodload zsh/zprof # parte superior de su archivo .zshrc
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH="$HOME/.oh-my-zsh"
export ZSH="/home/edicsonabel/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"
# ZSH_DISABLE_COMPFIX=true
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  copybuffer
  copypath
  copyfile
  dirhistory
  history
  history-substring-search
  git
  sudo
  web-search
  zsh-autosuggestions
  zsh-syntax-highlighting
  )

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# ⬇️ THEME HERE ⬇️

# vim:ft=zsh ts=2 sw=2 sts=2
#
# agnoster's Theme - https://gist.github.com/3712874
# A Powerline-inspired theme for ZSH
#
# # README
#
# In order for this theme to render correctly, you will need a
# [Powerline-patched font](https://github.com/Lokaltog/powerline-fonts).
# Make sure you have a recent version: the code points that Powerline
# uses changed in 2012, and older versions will display incorrectly,
# in confusing ways.
#
# In addition, I recommend the
# [Solarized theme](https://github.com/altercation/solarized/) and, if you're
# using it on Mac OS X, [iTerm 2](https://iterm2.com/) over Terminal.app -
# it has significantly better color fidelity.
#
# If using with "light" variant of the Solarized color schema, set
# SOLARIZED_THEME variable to "light". If you don't specify, we'll assume
# you're using the "dark" variant.
#
# # Goals
#
# The aim of this theme is to only show you *relevant* information. Like most
# prompts, it will only show git information when in a git working directory.
# However, it goes a step further: everything from the current user and
# hostname to whether the last call exited with an error to whether background
# jobs are running in this shell will all be displayed automatically when
# appropriate.

### Segment drawing
# A few utility functions to make it easy and re-usable to draw segmented prompts

# Special Powerline characters
() {
  local LC_ALL="" LC_CTYPE="en_US.UTF-8"
  # NOTE: This segment separator character is correct.  In 2012, Powerline changed
  # the code points they use for their special characters. This is the new code point.
  # If this is not working for you, you probably have an old version of the
  # Powerline-patched fonts installed. Download and install the new version.
  # Do not submit PRs to change this unless you have reviewed the Powerline code point
  # history and have new information.
  # This is defined using a Unicode escape sequence so it is unambiguously readable, regardless of
  # what font the user is viewing this source code in. Do not replace the
  # escape sequence with a single literal character.
  # Do not change this! Do not make it '\u2b80'; that is the old, wrong code point.
  SEGMENT_SEPARATOR="\ue0b0"
  ROUNDED_START="\ue0b6"
  PLUSMINUS="\u00b1"
  BRANCH="\ue0a0"
  DETACHED="\u27a6"
  CROSS="\u2718"
  LIGHTNING="\u26a1"
  GEAR="\u2699"
}

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg space

  space=" "
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  [[ -n $4 ]] && space=""

  if [[ $CURRENT_BG_1 != 'NONE' && $1 != $CURRENT_BG_1 && $space != '' ]]; then
    echo -n "$space%{$bg%F{$CURRENT_BG_1}%}$SEGMENT_SEPARATOR%{$fg%}$space"
  else
    echo -n "$space%{$bg%}%{$fg%}$space"
  fi
  CURRENT_BG_1=$1
  [[ -n $3 ]] && echo -n $3
}

prompt_segment_bg() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg=$fg_bold[$2] || fg="%f"
  if [[ $CURRENT_BG_1 != 'NONE' && $1 != $CURRENT_BG_1 ]]; then
    echo -n " %{$bg%F{$CURRENT_BG_1}%}%{$fg%} "
  else
    echo -n "%{$bg%}%{$fg%} "
  fi
  CURRENT_BG_1=$1
  [[ -n $3 ]] && echo -n $3
  echo -n "%{$bg%}%{$fg_no_bold[$2]%}"
}

# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG_1 ]]; then
    echo -n " %{%k%F{$CURRENT_BG_1}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG_1=''
}

prompt_start() {
  if [[ -n $CURRENT_BG_1 ]]; then
    echo -n "%{%F{$CURRENT_BG_1}%}$ROUNDED_START"
  else
    # echo -n "%{%k{$CURRENT_FG_1}%}$ROUNDED_START"
    echo -n "%{k%}"
  fi
}

### Prompt components
# Each component will draw itself, and hide itself if no information needs to be shown

# Context: user@hostname (who am I and where am I)
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    #prompt_segment $CURRENT_BG_1 default "%(!.%{%F{yellow}%}.)%n at %m"
    prompt_segment_bg $CURRENT_BG_1 $CURRENT_FG_1 "%(!.%{%F{$CURRENT_FG_1}%}.)%n"
    # prompt_segment $CURRENT_BG_1 default "%(!.%{%F{yellow}%}.)at"
    # prompt_segment_bg $CURRENT_BG_1 red "%(!.%{%F{yellow}%}.)%m"
  fi
}

# Git: branch/detached head, dirty status
prompt_git() {
  (( $+commands[git] )) || return
  if [[ "$(git config --get oh-my-zsh.hide-status 2>/dev/null)" = 1 ]]; then
    return
  fi
  () {
    local LC_ALL="" LC_CTYPE="en_US.UTF-8"
  }
  local ref dirty mode repo_path

  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    repo_path=$(git rev-parse --git-dir 2>/dev/null)
    dirty=$(parse_git_dirty)
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git rev-parse --short HEAD 2> /dev/null)"
    if [[ -n $dirty ]]; then
      prompt_segment $CURRENT_BG_GIT_CHANGE $CURRENT_FG_GIT_CHANGE
    else
      prompt_segment $CURRENT_BG_GIT_OK $CURRENT_FG_GIT_OK
    fi

    if [[ -e "${repo_path}/BISECT_LOG" ]]; then
      mode=" <B>"
    elif [[ -e "${repo_path}/MERGE_HEAD" ]]; then
      mode=" >M<"
    elif [[ -e "${repo_path}/rebase" || -e "${repo_path}/rebase-apply" || -e "${repo_path}/rebase-merge" || -e "${repo_path}/../.dotest" ]]; then
      mode=" >R>"
    fi

    setopt promptsubst
    autoload -Uz vcs_info

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' get-revision true
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' stagedstr '✚'
    zstyle ':vcs_info:*' unstagedstr '●'
    zstyle ':vcs_info:*' formats ' %u%c'
    zstyle ':vcs_info:*' actionformats ' %u%c'
    vcs_info
    echo -n "${ref/refs\/heads\//$BRANCH }${vcs_info_msg_0_%% }${mode}"
  fi
}

prompt_bzr() {
    (( $+commands[bzr] )) || return
    if (bzr status >/dev/null 2>&1); then
        status_mod=`bzr status | head -n1 | grep "modified" | wc -m`
        status_all=`bzr status | head -n1 | wc -m`
        revision=`bzr log | head -n2 | tail -n1 | sed 's/^revno: //'`
        if [[ $status_mod -gt 0 ]] ; then
            prompt_segment yellow black
            echo -n "bzr@"$revision "✚ "
        else
            if [[ $status_all -gt 0 ]] ; then
                prompt_segment yellow black
                echo -n "bzr@"$revision
            else
                prompt_segment green black
                echo -n "bzr@"$revision
            fi
        fi
    fi
}

prompt_hg() {
  (( $+commands[hg] )) || return
  local rev st branch
  if $(hg id >/dev/null 2>&1); then
    if $(hg prompt >/dev/null 2>&1); then
      if [[ $(hg prompt "{status|unknown}") = "?" ]]; then
        # if files are not added
        prompt_segment red white
        st='±'
      elif [[ -n $(hg prompt "{status|modified}") ]]; then
        # if any modification
        prompt_segment yellow black
        st='±'
      else
        # if working copy is clean
        prompt_segment green $CURRENT_FG_1
      fi
      echo -n $(hg prompt "☿ {rev}@{branch}") $st
    else
      st=""
      rev=$(hg id -n 2>/dev/null | sed 's/[^-0-9]//g')
      branch=$(hg id -b 2>/dev/null)
      if `hg st | grep -q "^\?"`; then
        prompt_segment red black
        st='±'
      elif `hg st | grep -q "^[MA]"`; then
        prompt_segment yellow black
        st='±'
      else
        prompt_segment green $CURRENT_FG_1
      fi
      echo -n "☿ $rev@$branch" $st
    fi
  fi
}

# Dir: current working directory
prompt_dir() {
  ##prompt_segment $CURRENT_BG_2 $CURRENT_FG_2 '%~'
  # prompt_segment $CURRENT_BG_2 $CURRENT_FG_2 '%(1~|%1~|%~)'
  prompt_segment $CURRENT_BG_2 $CURRENT_FG_2 '%(1~|%1~|%~)'
}

# Virtualenv: current working virtualenv
prompt_virtualenv() {
  local virtualenv_path="$VIRTUAL_ENV"
  if [[ -n $virtualenv_path && -n $VIRTUAL_ENV_DISABLE_PROMPT ]]; then
    prompt_segment blue black "(`basename $virtualenv_path`)"
  fi
}

# Status:
# - was there an error
# - am I root
# - are there background jobs?
prompt_status() {
  local -a symbols

  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}$CROSS"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}$LIGHTNING"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}$GEAR"

  # [[ -n "$symbols" ]] && prompt_segment black default "$symbols" none
  prompt_segment $CURRENT_BG_1 default "$symbols" none
}

#AWS Profile:
# - display current AWS_PROFILE name
# - displays yellow on red if profile name contains 'production' or
#   ends in '-prod'
# - displays black on green otherwise
prompt_aws() {
  [[ -z "$AWS_PROFILE" ]] && return
  case "$AWS_PROFILE" in
    *-prod|*production*) prompt_segment red yellow  "AWS: $AWS_PROFILE" ;;
    *) prompt_segment green black "AWS: $AWS_PROFILE" ;;
  esac
}

clipcopy() {
  xclip -sel clip "$@"
}

clippaste(){
  xclip -o "$@"
}

open() {
  xdg-open "$@" > /dev/null 2>&1
}

auto_compinit(){
  autoload -Uz copinit
  for dump in ~/.zcompdump(N.mh+24); do
    compinit
  done
  compinit -C
}

rc() {
  printf '\e[3 q'
}

## COLOR PALETTE ACCORDING TO THE THEME
case ${SOLARIZED_THEME:-dark} in
  light)
    # Light 
    CURRENT_BG_1='black'
    CURRENT_FG_1='white'
    CURRENT_BG_2='red'
    CURRENT_FG_2='black'
    CURRENT_BG_GIT_OK='cyan'
    CURRENT_FG_GIT_OK='black'
    CURRENT_BG_GIT_CHANGE='yellow'
    CURRENT_FG_GIT_CHANGE='black'
    ;;


  dark)
  # Jeva 1.0 Theme
    # CURRENT_BG_1='magenta'
    # CURRENT_FG_1='white'
    # CURRENT_BG_2='red'
    # CURRENT_FG_2='black'
    # CURRENT_BG_GIT_OK='cyan'
    # CURRENT_FG_GIT_OK='black'
    # CURRENT_BG_GIT_CHANGE='yellow'
    # CURRENT_FG_GIT_CHANGE='black'

  # Jeva 2.0 Theme 
    # CURRENT_BG_1='white'
    # CURRENT_FG_1='red'
    # CURRENT_BG_2='red'
    # CURRENT_FG_2='black'
    # CURRENT_BG_GIT_OK='cyan'
    # CURRENT_FG_GIT_OK='black'
    # CURRENT_BG_GIT_CHANGE='magenta'
    # CURRENT_FG_GIT_CHANGE='white'

  # Dark 
    CURRENT_BG_1='black'
    CURRENT_FG_1='white'
    CURRENT_BG_2='red'
    CURRENT_FG_2='black'
    CURRENT_BG_GIT_OK='cyan'
    CURRENT_FG_GIT_OK='black'
    CURRENT_BG_GIT_CHANGE='white'
    CURRENT_FG_GIT_CHANGE='red'
    ;;
esac

## Main prompt
build_prompt() {
  RETVAL=$?
  prompt_start
  prompt_status
  prompt_virtualenv
  prompt_aws
  prompt_context
  prompt_dir
  prompt_git
  prompt_bzr
  prompt_hg
  prompt_end
  auto_compinit
}

PROMPT='%{%f%b%k%}$(build_prompt) '

source ~/.profile
