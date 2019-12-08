(vim.schedule
  (fn []
    (local colorizer (require :colorizer))
    (colorizer.setup)))
