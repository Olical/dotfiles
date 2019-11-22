(local nvim (require :aniseed.nvim))

(fn expand [path]
  (nvim.fn.expand path))

{:expand expand}
