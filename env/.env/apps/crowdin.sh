if [ $IS_LINUX ]; then
  export PATH="/usr/local/opt/crowdin@3/bin:$PATH"
elif [ $IS_DARWIN ]; then
  export PATH="/opt/homebrew/opt/crowdin@3/bin:$PATH"
fi
