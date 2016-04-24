[ -d $HOME/.rbenv/shims ] && export PATH=$HOME/.rbenv/shims:$PATH

SSHFS_DIR="$HOME/${USER}.desktop.foo.com"

alias desktop-mount="if [ ! -d $SSHFS_DIR ]; then echo \"Creating '$SSHFS_DIR'...\"; mkdir -p $SSHFS_DIR; fi; _desktop-mount"
alias _desktop-mount="sshfs -p 22 ${USER}@${USER}.desktop.foo.com:/ $SSHFS_DIR -o auto_cache,reconnect,defer_permissions,noappledouble,negative_vncache,volname=RHEL5_Desktop,transform_symlinks,follow_symlinks"
alias desktop-umount="umount $SSHFS_DIR"
alias desktop-unmount="desktop-umount"

alias firefox-gwt="/Applications/Firefox\ 26.0.app/Contents/MacOS/firefox-bin -p"
