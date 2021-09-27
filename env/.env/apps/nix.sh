if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
alias xupdate='nix-shell -p niv --run "niv update"'
alias x="nix-shell"