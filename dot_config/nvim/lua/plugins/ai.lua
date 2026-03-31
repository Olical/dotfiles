-- [nfnl] fnl/plugins/ai.fnl
return {{"zbirenbaum/copilot.lua", cmd = "Copilot", event = "VeryLazy", main = "copilot", opts = {suggestion = {enabled = false}, panel = {enabled = false}}}, {"zbirenbaum/copilot-cmp", dependencies = {"zbirenbaum/copilot.lua"}, main = "copilot_cmp", opts = {fix_pairs = false}}}
