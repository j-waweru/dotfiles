function extract --description "Extract many archive types"
    if test (count $argv) -eq 0
        echo "Usage: extract <file>"
        return 1
    end

    set file $argv[1]

    switch $file
        case "*.tar.bz2"
            tar xjf $file

        case "*.tar.gz"
            tar xzf $file

        case "*.bz2"
            bunzip2 $file

        case "*.rar"
            unrar x $file

        case "*.gz"
            gunzip $file

        case "*.tar"
            tar xf $file

        case "*.tbz2"
            tar xjf $file

        case "*.tgz"
            tar xzf $file

        case "*.zip"
            unzip $file

        case "*.xz"
            unxz $file

        case "*.7z"
            7z x $file

        case '*'
            echo "Cannot extract '$file'"
    end
end
