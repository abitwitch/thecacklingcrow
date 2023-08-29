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

## 
