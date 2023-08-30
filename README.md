# thecacklingcrow
The Cackling Crow blog


## Installation on host server
1. Install Raspbian on a raspberry pi
2. `sudo apt-get install apache2 -y`
3. `sudo apt-get install php -y`
4. `sudo apt-get install mariadb-server php-mysql -y`
5. `sudo service apache2 restart`
6. `cd /var/www/html/`
7. `sudo rm *`
8. `sudo wget https://wordpress.org/latest.tar.gz`
9.  `sudo tar xzf latest.tar.gz`
10.  `sudo mv wordpress/* .`
11.  `sudo rm -rf wordpress latest.tar.gz`
12.  `sudo chown -R www-data: .`
13.  `sudo mysql_secure_installation`
    1. Enter system root password
    2. `Switch to unix_socket authentication [Y/n] Y`
    3. `Change the root password? [Y/n] Y`
    4. Enter new DB root password
    5. `Remove anonymous users? [Y/n] Y`
    6. `Disallow root login remotely? [Y/n] Y`
    7. `Remove test database and access to it? [Y/n] Y`
    8. `Reload privilege tables now? [Y/n] Y`
14. `sudo mysql -uroot -p`, enter DB root password
    1. `create database wordpress;`
    2. `GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' IDENTIFIED BY 'YOURPASSWORD';`, change password (keep quotes)
    3. `FLUSH PRIVILEGES;`
    4. Ctrl + d
16. `sudo reboot`

## Wordpress setup
1. After setting up the server
2. Goto local address in browser
3. Follow wizard
    1. Database Name: wordpress
    2. User Name: root
    3. Password: {DB password}
    4. Database Host: localhost
    5. Table Prefix:  wp_
4. "Run installation"
    1. Title: The Cackling Crow
    2. user: {wp user}
    3. pass: {wp pass}
    4. email: {associated email}
5. Login and go to Settings > Permlinks
    1. Set to "Plain" and save

## On server
1. `sudo a2enmod rewrite`
2. `sudo systemctl restart apache2`
3. `cd /var/www/html`
4. `sudo echo "#These two lines are edited by a separate script" >> wp-config.php`
5. `sudo echo "define( 'WP_HOME', 'http://crow.local' );" >> wp-config.php`
6. `sudo echo "define( 'WP_SITEURL', 'http://crow.local' );" >> wp-config.php`

## Make static copy of Wordpress site
1. `cd /var/www/html`
2. `wget https://raw.githubusercontent.com/chnm/WP-Static/master/wpstatic`
3. `chmod +x wpstatic`
4. `sudo ./wpstatic`

## Git sync setup
1. `sudo apt-get update`
2. `sudo apt-get install git`
3. `ssh-keygen -t ed25519 -C "{associated crow email}"`
4. `cat /home/crow/.ssh/id_ed25519.pub`, copy content
5. Add that key as a write access deployment key for the repo on github
6. `cd ~`
7. `git config --global user.name "{name}"`
8. `git config --global user.email "{associated crow email}"`
9. `git clone {repo}` (by sure to use SSH format)
10. `cd {repo}`
11. `sudo cp /var/www/html/crow.local-static/* . -r`
15. `git add -A`
16. `git commit -m "{message}"`
17. `git push`

## Script update
1. `sudo bash ./clean.sh`
2. `sudo bash ./update.sh`

## Cron job
1. `sudo crontab -e`
2. add this line `0 0 * * * /usr/bin/bash /home/crow/thecacklingcrow/update.sh`



