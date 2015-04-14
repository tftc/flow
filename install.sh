set -e

if [ ! -n "$FLOW" ]; then
  FLOW_SH=~/.flow
fi

if [ -d "$FLOW_SH" ]; then
  echo "\033[0;33mYou already have flow installed.\033[0m You'll need to remove $FLOW_SH if you want to install"
  exit
fi

echo "\033[0;34mCloning flow...\033[0m"
hash git >/dev/null 2>&1 && env git clone --depth=1 http://123.57.227.107:8085/flow $FLOW_SH || {
  echo "git not installed"
  exit
}

echo "\033[0;34mLooking for an existing $FLOW_SH config...\033[0m"
if [ -f ~/.bashrc ] || [ -h ~/.bashrc ]; then
  echo "\033[0;33mFound ~/.bashrc.\033[0m \033[0;32mBacking up to ~/.bashrc.pre-flow\033[0m";
  cp ~/.bashrc ~/.bashrc.pre-flow;
else
    
  echo "\033[0;34mUsing the flow bashrc template file and adding it to ~/.bashrc\033[0m"
  cp $FLOW_SH/template/bashrc-template ~/.bashrc
fi


echo "\033[0;34mCopying your current PATH and adding it to the end of ~/.bashrc for you.\033[0m"
sed -i -e "/export PATH=/ c\\
export PATH=$PATH:$FLOW_SH
" ~/.bashrc

. ~/.bashrc

EXEC_FILES="flow"
SCRIPT_FILES="gitflow-init gitflow-feature gitflow-release gitflow-common gitflow-shFlags"


install -v -d -m 0755 "$FLOW_SH"

for exec_file in $EXEC_FILES ; do
	install -v -m 0755 "$FLOW_SH/$exec_file" "$FLOW_SH"
done

for script_file in $SCRIPT_FILES ; do
    install -v -m 0644 "$FLOW_SH/$script_file" "$FLOW_SH"
done


echo "\033[0;32m"'flow...is now installed!'"\033[0m"
