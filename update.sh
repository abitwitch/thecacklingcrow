curdir=$(pwd | xargs basename)
gitreponame=$(basename `git rev-parse --show-toplevel`)

if [ "$curdir" = "$gitreponame" ]; then
    #Clean git repo
    sudo find ./ -mindepth 1 ! -regex '^./.git\(/.*\)?' | grep -v '^./.github*' | grep -v './clean.sh' | grep -v './update.sh'  | grep -v './README.md' | grep -v './.gitignore' | xargs sudo rm -rf
    #Re-config site URL
    cd /var/www/html
    #sudo sed -i 's|http://crow.local|http://thecacklingcrow.com|g' wp-config.php
    #Clean prev run of static site
    sudo rm -r /var/www/html/crow.local-static/
    #Create static version of site
    yes | sudo ./wpstatic -a
    #cd -
    #sudo wget --recursive --no-clobber --page-requisites --html-extension --convert-links --restrict-file-names=windows crow.local
    #cd /var/www/html
    #Revert site URL
    #sudo sed -i 's|http://thecacklingcrow.com|http://crow.local|g' wp-config.php
    #Copy static site to git repo
    cd -
    sudo cp /var/www/html/crow.local-static/* . -r
    #sudo cp ./crow.local/* . -r
    #Git commit and push
    sudo -u crow git add -A
    sudo -u crow git commit -m "`date`"
    sudo -u crow git push
else
    echo "Error: Set current directory to the repo and then rerun."
    exit 1
fi
