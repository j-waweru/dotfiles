function cdls --description "cd into directory and list contents"
    if test (count $argv) -eq 0
        cd ~
    else
        cd $argv[1]
    end

    and eza -lah --icons
end
