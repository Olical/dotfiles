(local uu (require :user.util))

(uu.tx
  :rcarriga/nvim-notify
  {:opts {:render :compact
          :stages :static}})
