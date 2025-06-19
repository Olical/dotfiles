(import-macros {: tx} :config.macros)

[(tx "zbirenbaum/copilot.lua"
   {:event "VeryLazy"
    :cmd "Copilot"
    :main "copilot"
    :opts {;; Let copilot-cmp handle this.
           :suggestion {:enabled false}
           :panel {:enabled false}}})

 (tx "zbirenbaum/copilot-cmp"
   {:main "copilot_cmp"
    :opts {:fix_pairs false}
    :dependencies ["zbirenbaum/copilot.lua"]})]
