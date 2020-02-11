(module config.module.plugin.conjure
  {require {nvim aniseed.nvim}})

(set nvim.g.conjure_log_blacklist [:up :ret :ret-multiline :load-file :eval])
