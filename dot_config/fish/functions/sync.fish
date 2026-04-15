function sync
    # Early sudo because it's needed later.
    sudo echo "Updating everything!"

    chezmoi re-add
    chezmoi update

    topgrade --disable containers vim guix uv

    nvim --headless -c 'lua require("config.sync")'

    chezmoi re-add
end
