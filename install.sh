set -e

if [ ! -n "$FLOW" ]; then
  FLOW_SH=~/.flow
fi


if [ -d "$FLOW_SH" ]; then
  echo "\033[0;33mYou already have flow installed.\033[0m You'll need to remove $FLOW_SH if you want to install"
  exit
fi

echo "\033[0;34mCloning flow...\033[0m"
hash git >/dev/null 2>&1 && env git clone --depth=1 https://github.com/tftc/flow.git $FLOW_SH || {
  echo "git not installed"
  exit
}

echo "\033[0;34mLooking for an existing $FLOW_SH config...\033[0m"
if [ -f ~/.bashrc ] || [ -h ~/.bashrc ] ; then
  echo "\033[0;33mFound ~/.bashrc.\033[0m \033[0;32mBacking up to ~/.bashrc.pre-flow\033[0m";
  cp ~/.bashrc ~/.bashrc.pre-flow;
else
    
  echo "\033[0;34mUsing the flow bashrc template file and adding it to ~/.bashrc\033[0m"
  cp $FLOW_SH/template/bashrc-template ~/.bashrc
fi


echo "\033[0;34mCopying your current PATH and adding it to the end of ~/.bashrc for you.\033[0m"


if ! grep -q 'export PATH=' ~/.bashrc ; then
     echo "export PATH=$PATH">>~/.bashrc;
fi
#check .flow is contains in path
if ! echo "$PATH" | grep -q "$FLOW_SH" ; then 
    sed -i -e "/export PATH=/ c\\
    export PATH=$PATH:$FLOW_SH
    " ~/.bashrc

. ~/.bashrc



if [ -f ~/.zshrc ] ; then
    echo "\033[0;34mExisting zsh config... Copying your current PATH and adding it to the end of ~/.zshrc for you.\033[0m"
    cp ~/.zshrc ~/.zshrc.pre-flow;
    sed -i -e "/export PATH=/ c\\
    export PATH=\"$PATH\"
    " ~/.zshrc
    echo "\033[0;32m"'flow...is now installed!'"\033[0m"
    exit 0
fi

echo "\033[0;32m"'flow...is now installed!'"\033[0m"
