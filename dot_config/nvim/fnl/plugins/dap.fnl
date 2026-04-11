(import-macros {: tx} :config.macros)

[(tx "mfussenegger/nvim-dap"
   {:config
    (fn []
      (let [dap (require :dap)]
        (set dap.adapters.clojure
             {:type "executable"
              :command "clojure"
              :args ["-Sdeps"
                     "{:deps {uk.me.oli/clojure-dap {:mvn/version \"RELEASE\"}}}"
                     "-X" "clojure-dap.main/run"]})

        (set dap.configurations.clojure
             [{:name "Attach to nREPL"
               :type "clojure"
               :request "attach"}])))

    :keys [(tx "<leader>db" (fn [] ((. (require :dap) :toggle_breakpoint))) {:desc "Toggle breakpoint"})
           (tx "<leader>dc" (fn [] ((. (require :dap) :continue))) {:desc "Continue / Start debug"})
           (tx "<leader>dn" (fn [] ((. (require :dap) :step_over))) {:desc "Step over"})
           (tx "<leader>di" (fn [] ((. (require :dap) :step_into))) {:desc "Step into"})
           (tx "<leader>do" (fn [] ((. (require :dap) :step_out))) {:desc "Step out"})
           (tx "<leader>dr" (fn [] ((. (require :dap) :repl :open))) {:desc "Open REPL"})
           (tx "<leader>dl" (fn [] ((. (require :dap) :run_last))) {:desc "Run last"})
           (tx "<leader>dx" (fn [] ((. (require :dap) :terminate))) {:desc "Terminate"})
           (tx "<leader>du" (fn [] ((. (require :dapui) :toggle))) {:desc "Toggle DAP UI"})]})

 (tx "rcarriga/nvim-dap-ui"
   {:dependencies ["mfussenegger/nvim-dap" "nvim-neotest/nvim-nio"]
    :config (fn []
              (let [dapui (require :dapui)
                    dap (require :dap)]
                (dapui.setup)
                (tset dap.listeners.after.event_initialized :dapui
                      (fn [] (dapui.open)))
                (tset dap.listeners.before.event_terminated :dapui
                      (fn [] (dapui.close)))
                (tset dap.listeners.before.event_exited :dapui
                      (fn [] (dapui.close)))))})]
