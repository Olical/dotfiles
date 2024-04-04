(local uu (require :dotfiles.util))

(uu.tx
  :rcarriga/nvim-notify
  {:opts {:render :compact
          :stages :static}})
