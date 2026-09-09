function sync
    # Early sudo because it's needed later.
    sudo echo "Updating everything!"

    chezmoi re-add
    chezmoi update

    set -l disabled_steps containers vim guix uv

    if command -q dnf
        sudo dnf upgrade; or return
        sudo dnf offline clean; or return
        set -a disabled_steps system
    end

    topgrade --disable $disabled_steps

    nvim --headless -c 'lua require("config.sync")'

    chezmoi re-add
end
