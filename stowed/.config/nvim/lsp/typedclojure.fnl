{;; :cmd ["clojure" "-Sdeps"
 ;;       "{:deps {io.github.Olical/typedclojure-lsp {:git/tag \"v0.0.1\", :git/sha \"05bfd50\"}}}"
 ;;       "-X:typedclojure-lsp" "typedclojure-lsp.main/start!"
 ;;       ]
 :cmd ["clojure" "-X:typedclojure-lsp:test:dev:build" "typedclojure-lsp.dev/start!"]
 :filetypes ["clojure"]
 :root_markers ["deps.edn" "project.clj" ".git"]}
