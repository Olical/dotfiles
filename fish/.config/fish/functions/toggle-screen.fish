function toggle-screen
  set -l IN "eDP1"
  set -l EXT "DP1"

  if xrandr | grep "$EXT disconnected"
    xrandr --output $IN --auto --output $EXT --off
  else
    xrandr --output $IN --auto --primary --output $EXT --auto --below $IN
  end
end
