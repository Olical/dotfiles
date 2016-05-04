function dock
  set -l IN "eDP1"
  set -l EXT "DP1"

  xrandr > /dev/null

  if xrandr | grep "$EXT disconnected" > /dev/null
    xrandr --output $IN --primary --auto --output $EXT --off
    xmodmap -e "pointer = 1 2 3" ^ /dev/null
    echo "-> Laptop mode"
  else
    xrandr --output $IN --auto --output $EXT --primary --auto --above $IN
    xmodmap -e "pointer = 3 2 1" ^ /dev/null
    echo "-> Desktop mode"
  end
end
