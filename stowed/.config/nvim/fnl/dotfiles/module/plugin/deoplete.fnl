(module dotfiles.module.plugin.deoplete
  {require {nvim aniseed.nvim}})

(def- lisp-pattern "[\\w!$%&*+/:<=>?@\\^_~\\-\\.#]*")

(set nvim.g.deoplete#enable_at_startup true)

(nvim.fn.deoplete#custom#option
  :keyword_patterns
  {:clojure lisp-pattern})

(nvim.fn.deoplete#custom#option
  :omni_patterns
  {:fennel lisp-pattern
   :janet lisp-pattern})

(nvim.ex.set "completeopt-=preview")
