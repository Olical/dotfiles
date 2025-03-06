function mise-eval
    set output (mise run $argv)
    echo "$output"
    eval $output
end
