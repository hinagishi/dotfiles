
function peco_src
    ghq list --full-path | peco | read dest
    if [ -n $dest ]
        cd $dest
    end
end

