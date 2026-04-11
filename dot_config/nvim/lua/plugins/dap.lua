-- [nfnl] fnl/plugins/dap.fnl
local function _1_()
  local dap = require("dap")
  dap.adapters.clojure = {type = "executable", command = "clojure", args = {"-Sdeps", "{:deps {uk.me.oli/clojure-dap {:mvn/version \"RELEASE\"}}}", "-X", "clojure-dap.main/run"}}
  dap.configurations.clojure = {{name = "Attach to nREPL", type = "clojure", request = "attach"}}
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
local function _10_()
  return require("dapui").toggle()
end
local function _11_()
  local dapui = require("dapui")
  local dap = require("dap")
  dapui.setup()
  local function _12_()
    return dapui.open()
  end
  dap.listeners.after.event_initialized["dapui"] = _12_
  local function _13_()
    return dapui.close()
  end
  dap.listeners.before.event_terminated["dapui"] = _13_
  local function _14_()
    return dapui.close()
  end
  dap.listeners.before.event_exited["dapui"] = _14_
  return nil
end
return {{"mfussenegger/nvim-dap", config = _1_, keys = {{"<leader>db", _2_, desc = "Toggle breakpoint"}, {"<leader>dc", _3_, desc = "Continue / Start debug"}, {"<leader>dn", _4_, desc = "Step over"}, {"<leader>di", _5_, desc = "Step into"}, {"<leader>do", _6_, desc = "Step out"}, {"<leader>dr", _7_, desc = "Open REPL"}, {"<leader>dl", _8_, desc = "Run last"}, {"<leader>dx", _9_, desc = "Terminate"}, {"<leader>du", _10_, desc = "Toggle DAP UI"}}}, {"rcarriga/nvim-dap-ui", config = _11_, dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"}}}
