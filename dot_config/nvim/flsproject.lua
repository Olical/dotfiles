-- [nfnl] flsproject.fnl
--[[ (local config (require "nfnl.config")) (let [{:fennel-macro-path macro-path :fennel-path fennel-path} (config.default {:root-dir "." :rtp-patterns ["."]})] {:extra-globals "vim" :fennel-path fennel-path :lua-version "lua5.1" :macro-path macro-path}) ]]
return {["extra-globals"] = "vim", ["lua-version"] = "lua5.1"}
