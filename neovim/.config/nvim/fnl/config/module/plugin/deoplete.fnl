(local nvim (require :aniseed.nvim))

(set nvim.g.deoplete#enable_at_startup true)
(nvim.fn.deoplete#custom#option :keyword_patterns {:clojure "[\\w!$%&*+/:<=>?@\\^_~\\-\\.#]*"})
(nvim.ex.set "completeopt-=preview")
