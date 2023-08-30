

curdir=$(pwd | xargs basename)
gitreponame=$(basename `git rev-parse --show-toplevel`)

if [ "$curdir" = "$gitreponame" ]; then
    cd /var/www/html
    sudo sed -i 's|http://crow.local|http://thecacklingcrow.com|g' wp-config.php
    yes | sudo ./wpstatic -tp
    sudo sed -i 's|http://thecacklingcrow.com|http://crow.local|g' wp-config.php
    cd -
    sudo cp /var/www/html/crow.local-static/* . -r
    sudo -u crow git add -A
    sudo -u crow git commit -m "`date`"
    sudo -u crow git push
else
    echo "Error: Set current directory to the repo and then rerun."
    exit 1
fi

