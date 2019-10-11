# FreeAgent puts the powerline style in zsh !

if [ "$POWERLINE_RIGHT_B" = "" ]; then
  POWERLINE_RIGHT_B=%D{%H:%M:%S}
fi

if [ "$POWERLINE_RIGHT_A" = "" ]; then
  POWERLINE_RIGHT_A=%D{%Y-%m-%d}
fi

POWERLINE_CURRENT_PATH="%d"

if [ "$POWERLINE_FULL_CURRENT_PATH" = "" ]; then
  POWERLINE_CURRENT_PATH="%1~"
fi

POWERLINE_GIT_INFO_LEFT=""
POWERLINE_GIT_INFO_RIGHT="%F{red}"$'\u2b82'"%F{black}%K{red}"$'$(git_prompt_info)'" %f"
if [ "$POWERLINE_SHOW_GIT_ON_RIGHT" = "" ]; then
    POWERLINE_GIT_INFO_LEFT=$'$(git_prompt_info)'
    POWERLINE_GIT_INFO_RIGHT=""
fi

POWERLINE_COLOR_BG_GRAY=%K{240}
POWERLINE_COLOR_BG_LIGHT_GRAY=%K{240}
POWERLINE_COLOR_BG_WHITE=%K{255}

POWERLINE_COLOR_FG_GRAY=%F{240}
POWERLINE_COLOR_FG_LIGHT_GRAY=%F{240}
POWERLINE_COLOR_FG_WHITE=%F{255}

GIT_DIRTY_COLOR=%F{197}
GIT_CLEAN_COLOR=%F{green}
GIT_PROMPT_INFO=%F{012}

ZSH_THEME_GIT_PROMPT_PREFIX=" \u2b60 "
ZSH_THEME_GIT_PROMPT_SUFFIX="$GIT_PROMPT_INFO"
ZSH_THEME_GIT_PROMPT_DIRTY=" $GIT_DIRTY_COLOR✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" $GIT_CLEAN_COLOR✔"

ZSH_THEME_GIT_PROMPT_ADDED="%F{082}✚%f"
ZSH_THEME_GIT_PROMPT_MODIFIED="%F{166}✹%f"
ZSH_THEME_GIT_PROMPT_DELETED="%F{160}✖%f"
ZSH_THEME_GIT_PROMPT_RENAMED="%F{220]➜%f"
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{082]═%f"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{190]✭%f"

POWERLINE_SEC1_BG=%K{034}
POWERLINE_SEC1_FG=%F{034}
POWERLINE_SEC1_TXT=%F{white}
if [ "$POWERLINE_DETECT_SSH" != "" ]; then
  if [ -n "$SSH_CLIENT" ]; then
    POWERLINE_SEC1_BG=%K{red}
    POWERLINE_SEC1_FG=%F{red}
    POWERLINE_SEC1_TXT=%F{white}
  fi
fi
PROMPT="$POWERLINE_SEC1_BG$POWERLINE_SEC1_TXT %n %k%f$POWERLINE_SEC1_FG%K{053}"$'\u2b80'"%k%f%F{white}"

if [ "$POWERLINE_NO_BLANK_LINE" = "" ]; then
    PROMPT="
"$PROMPT
fi
