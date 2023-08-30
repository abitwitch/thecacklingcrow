curdir=$(pwd | xargs basename)
gitreponame=$(basename `git rev-parse --show-toplevel`)

lastmod=$(date -r /var/www/html +%s)
if [ ! -f ./lastrun ]; then
    echo 0 > ./lastrun
fi
lastrun=$(cat ./lastrun)

if [ "$curdir" = "$gitreponame" ]; then
    if [ "$lastmod" -gt "$lastrun" ]; then
        #Clean git repo
        sudo find ./ -mindepth 1 ! -regex '^./.git\(/.*\)?' | grep -v '^./.github*' | grep -v './clean.sh' | grep -v './update.sh'  | grep -v './README.md' | grep -v './lastrun' | grep -v './.gitignore' | xargs sudo rm -rf
        #Clean prev run of static site
        sudo rm -r /var/www/html/crow.local-static/
        #Create static version of site
        cd /var/www/html
        yes | sudo ./wpstatic -a
        cd -
        #Copy static site to git repo
        sudo cp /var/www/html/crow.local-static/* . -r
        #Git commit and push
        sudo -u crow git add -A
        sudo -u crow git commit -m "`date`"
        sudo -u crow git push
        #Update lastrun
        date +%s > ./lastrun
    fi
else
    echo "Error: Set current directory to the repo and then rerun."
    exit 1
fi
