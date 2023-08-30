

curdir=$(pwd | xargs basename)
gitreponame=$(basename `git rev-parse --show-toplevel`)

if [ "$curdir" = "$gitreponame" ]; then
    cd /var/www/html
    sudo sed -i 's|http://crow.local|https://thecacklingcrow.com|g' wp-config.php
    yes | sudo ./wpstatic
    sudo sed -i 's|http://thecacklingcrow.com|https://crow.local|g' wp-config.php
    cd -
    sudo cp /var/www/html/crow.local-static/* . -r
    git add -A
    git commit -m "`date`"
    git push
else
    echo "Error: Set current directory to the repo and then rerun."
    exit 1
fi

