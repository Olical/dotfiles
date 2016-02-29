function altnode
  mkdir -p ~/.altnode/cache
  mkdir -p /tmp/altnode

  if count $argv > /dev/null
    set -l cmd $argv[1]
    set -l source "https://nodejs.org/dist"

    switch $cmd
      case local
        ls ~/.altnode/cache | cut -d "." -f 1-3
      case remote
        curl "$source/" | grep "v[0-9\\.]*/" | cut -d "\"" -f 2 | cut -d "/" -f 1
      case clear
        rm ~/bin/node
      case fetch
        set -l ver $argv[2]
        curl "$source/$ver/node-$ver-linux-x86.tar.gz" -o "$HOME/.altnode/cache/$ver.tar.gz"
      case use
        set -l ver $argv[2]
        tar -zxvf "$HOME/.altnode/cache/$ver.tar.gz" -C "/tmp/altnode" "node-$ver-linux-x86/bin/node"
        mv "/tmp/altnode/node-$ver-linux-x86/bin/node" "$HOME/bin/node"
        rm -r "/tmp/altnode/node-$ver-linux-x86"
      case '*'
        echo "Command '$cmd' not supported, use no args to print help"
    end
  else
    echo "Usage: altnode {COMMAND}"
    echo -e '\tlocal: List local version'
    echo -e '\tremote: List remote version'
    echo -e '\tclear: Remove altnode binary, use system binary'
    echo -e '\tfetch {VERSION}: Download specified version'
    echo -e '\tuse {VERSION}: Use specified version'
  end
end
