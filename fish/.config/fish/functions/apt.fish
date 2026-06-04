function apt --description "Run apt update before install and autoremove after remove"
    if test (count $argv) -ge 1
        switch $argv[1]

            case install
                echo "🔄 Running apt update..."
                command sudo apt update

                if test $status -eq 0
                    echo "📦 Installing package(s): $argv[2..-1]"
                    command sudo apt install $argv[2..-1]
                else
                    echo "❌ apt update failed. Installation aborted."
                end

            case remove
                echo "🗑️ Removing package(s): $argv[2..-1]"
                command sudo apt remove $argv[2..-1]

                if test $status -eq 0
                    echo "🧹 Running apt autoremove..."
                    command sudo apt autoremove -y
                else
                    echo "❌ Package removal failed. Skipping autoremove."
                end

            case '*'
                command sudo apt $argv
        end
    else
        command sudo apt
    end
end
