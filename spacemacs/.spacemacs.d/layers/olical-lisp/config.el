(require 'cider)
(setq cider-cljs-lein-repl
      "(do (require '[cljs.repl :as repl] '[cljs.repl.node :as node])
           (compile 'cljs.repl.node)
           (cemerick.piggieback/cljs-repl (cljs.repl.node/repl-env)))")15
