-- [nfnl] fnl/plugins/dap.fnl
local clojure_dap_path = "/home/olical/repos/Olical/clojure-dap"
local function _1_()
  local dap = require("dap")
  dap.adapters.clojure = {type = "executable", command = "clojure", args = {"-Sdeps", ("{:deps {clojure-dap/clojure-dap {:local/root \"" .. clojure_dap_path .. "\"}}}"), "-X", "clojure-dap.main/run"}}
  dap.configurations.clojure = {{"Attach to nREPL", request = "attach", type = "clojure"}}
  return nil
end
local function _2_()
  return require("dap").toggle_breakpoint()
end
local function _3_()
  return require("dap").continue()
end
local function _4_()
  return require("dap").step_over()
end
local function _5_()
  return require("dap").step_into()
end
local function _6_()
  return require("dap").step_out()
end
local function _7_()
  return require("dap").repl.open()
end
local function _8_()
  return require("dap").run_last()
end
local function _9_()
  return require("dap").terminate()
end
return {{"mfussenegger/nvim-dap", config = _1_, keys = {{"<leader>db", _2_, desc = "Toggle breakpoint"}, {"<leader>dc", _3_, desc = "Continue / Start debug"}, {"<leader>dn", _4_, desc = "Step over"}, {"<leader>di", _5_, desc = "Step into"}, {"<leader>do", _6_, desc = "Step out"}, {"<leader>dr", _7_, desc = "Open REPL"}, {"<leader>dl", _8_, desc = "Run last"}, {"<leader>dx", _9_, desc = "Terminate"}}}}
