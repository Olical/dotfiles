set SESSION_FILE ~/.bws-session

function bws
  if test -e $SESSION_FILE
    set -x BW_SESSION (cat $SESSION_FILE)
  end

  if ! bw status | grep unlocked > /dev/null
    set -x BW_SESSION (bw unlock --raw)
    if test $status -ne 0
      echo "bw unlock failed"
      return $status
    else
      echo $BW_SESSION > $SESSION_FILE
    end
  end

  bw $argv
end
