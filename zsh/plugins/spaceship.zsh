# Display time
SPACESHIP_TIME_SHOW=false

# Display username always
SPACESHIP_USER_SHOW=always

# Do not truncate path in repos
SPACESHIP_DIR_TRUNC_REPO=false

# Add a custom vi-mode section to the prompt
# See: https://github.com/spaceship-prompt/spaceship-vi-mode
source $ZSH_PLUGIN_DIR/spaceship-vi-mode/spaceship-vi-mode.plugin.zsh
eval spaceship_vi_mode_enable
spaceship add --before char vi_mode

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  time          # Time stamps section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  golang        # Go section
  rust          # Rust section
  docker        # Docker section
  aws           # Amazon Web Services section
  gcloud        # Google Cloud Platform section
  venv          # virtualenv section
  python        # Python virtualenv section
  conda         # conda virtualenv section
  kubectl       # Kubectl context section
  terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
