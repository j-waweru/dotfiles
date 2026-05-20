function apt --description "Run apt update automatically before install"
    if test (count $argv) -ge 1
        switch $argv[1]
            case install
                echo "Running apt update first..."
                command sudo apt update
                and command sudo apt install $argv[2..-1]

            case '*'
                command sudo apt $argv
        end
    else
        command sudo apt
    end
end
