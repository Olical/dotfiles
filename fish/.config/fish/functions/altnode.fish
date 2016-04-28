function altnode
  mkdir -p ~/.altnode/cache
  mkdir -p /tmp/altnode

  if count $argv > /dev/null
    set -l cmd $argv[1]
    set -l source "https://nodejs.org/dist"
    set -l platform

    switch (uname)
      case Linux
        set platform "linux-x86"
      case Darwin
        set platform "darwin-x64"
      case "*"
        echo "Platform not supported:" (uname)
        return
    end

    switch $cmd
      case local
        ls ~/.altnode/cache | cut -d "." -f 1-3
      case remote
        curl -s "$source/" | grep "v[0-9\\.]*/" | cut -d "\"" -f 2 | cut -d "/" -f 1
      case reset
        rm ~/bin/node
      case fetch
        set -l ver $argv[2]
        set -l url "$source/$ver/node-$ver-$platform.tar.gz" 
        echo "Fetching from" $url
        curl -f $url -o "$HOME/.altnode/cache/$ver.tar.gz"

        if [ $status != "0" ]
          echo "Node version '$ver' not found on the remote"
        end
      case use
        set -l ver $argv[2]
        set -l tarball "$HOME/.altnode/cache/$ver.tar.gz"
        set -l tmpdir "/tmp/altnode/node-$ver-$platform"

        if test -e "$tarball"
          tar -zxvf "$tarball" -C "/tmp/altnode" "node-$ver-$platform/bin/node"
          mv "$tmpdir/bin/node" "$HOME/bin/node"
          rm -r "$tmpdir"
        else
          echo "Node version '$ver' not found locally, fetch it first"
        end
      case rm
        set -l ver $argv[2]
        set -l tarball "$HOME/.altnode/cache/$ver.tar.gz"

        if test -e "$tarball"
          rm "$tarball"
        else
          echo "Node version '$ver' not found locally"
        end
      case show
        node -v
        which node
        if [ (which node) = "$HOME/bin/node" ]
          echo "(from altnode)"
        else
          echo "(from system)"
        end
      case "*"
        echo "Command '$cmd' not supported, use no args to print help"
    end
  else
    echo "Usage: altnode {COMMAND}"
    echo -e "\tlocal: List local version"
    echo -e "\tremote: List remote version"
    echo -e "\treset: Remove altnode binary, use system binary"
    echo -e "\tfetch {VERSION}: Download specified version"
    echo -e "\tuse {VERSION}: Use specified version"
    echo -e "\trm {VERSION}: Remove the specified version from the cache"
    echo -e "\tshow: Display current version and binary location"
  end
end
