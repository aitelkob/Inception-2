# inception
This project aims to broaden your knowledge of system administration by using Docker. You will virtualize several Docker images, creating them in your new personal virtual machine.

Foreword:
---------------------------------------------------------------------------------------------------------------------------------

This tutorial details my activities, how I acted, and what I read. All of the links provided here are incomplete, and I used StackOverflow and other sources. However, these connections provided me with a broad understanding of how everything works and made it easy to access information. If you like the guide and want me to produce more MANs like this, then leave me a star and subscribe. Thank you, and best wishes with your endeavors!

---------------------------------------------------------------------------------------------------------------------------------

<img alt="visub"  src="srcs/meme.png">

VirtualBox - 8.04.6 LTS (Bionic Beaver), Containers:
---------------------------------------------------------------------------------------------------------------------------------
1. Creating an Ubuntu virtual machine.</a>
2. <a href="https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04-en">Install Docker.</a >
3. <a href="https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04-en">Install Docker-Compose .</a>
4. Install VIM, MAKE, GIT and other programs, plugins necessary for work.
5. Change hosts in Ubuntu: vim /etc/hosts then change localhost to ****.42.fr.
6. Create Makefile:<br>
&emsp; 6.1. We set general Makefile settings - for the convenience of building and rebuilding containers:<br>
&emsp; &emsp; 6.1.1. Running containers.<br>
&emsp; &emsp; 6.1.2. Shutdown.<br>
&emsp; &emsp; 6.1.3. Removing and cleaning everything.
7. <a href="https://dker.ru/docs/docker-compose/compose-file-reference">Create a docker-compose.yml file:</a><br>
&emsp; 7.1. We create network. <br>
&emsp; 7.2. <a href="https://docs.docker.com/storage/volumes/">Creating volumes</a> + another <a href="https://github.com/compose-spec/compose-spec /blob/master/spec.md#volumes-top-level-element">link.</a><br>
&emsp; 7.3. <a href="https://dker.ru/docs/docker-compose/compose-file-reference">Create container build commands - services. Don't forget to connect network and volume.</a><br>
8. NGINX - dockerfile, nginx, config, openssl:<br>
&emsp; 8.1. Install nginx and openssl.<br>
&emsp; 8.2. Signing the certificate openssl.<br>
&emsp; 8.3. Change the nginx config: etc/nginx/sites-enabled/defaul. <a href="https://serveradmin.ru/ustanovka-i-nastrojka-nginx/">Link for general understanding.</a> <br>
&emsp; In <a href="https://nginx.org/en/docs//">documentation</a> everything is written, you'll have to dig:<br>
&emsp; &emsp; 8.3.1. <a href="https://nginx.org/en/docs/beginners_guide.html">Config syntax.</a><br>
&emsp; &emsp; 8.3.2. We are looking for info on the Internet, how to add to the nginx config: ssl_portocol TLSv1.2, TLSv1.3 and ssl_certificate.<br>
&emsp; 8.4. We start the container, demon off.
9. MARIADB - dockerfile, mariadb, config 50-server, database creation:<br>
&emsp; 9.1. Installation. <br>
&emsp; 9.2. Database creation:<br>
&emsp; &emsp; 9.2.1. host_name must be either % or you must force it and use its name.<br>
&emsp; 9.3. Set up 50-server.cnf - close local hosts, open 3306.<br>
&emsp; 9.4. We launch.
10. WORDPRESS - dockerfile, wordpress, php, wp-config, php-fpm, www.conf: <br>
&emsp; 10.1. <a href="https://en.wordpress.org/about/requirements/">Required for wordpress to work.</a> <br>
&emsp; 10.2. <a href="http://xandeadx.ru/blog/php/866">Install php and php-fpm.</a><br>
&emsp; 10.3. Set up <a href="https://www.php.net/manual/ru/install.fpm.configuration.php">www.conf</a> and link to ngixn: /etc/php/x.x/fpm/ pool.d<br>
&emsp; 10.4. <a href="https://codex.wordpress.org/%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0% B0_WordPress#Using_the_MySQL_Client) - wp-config (https://techlist.top/ustanovka-wordpress-odnoj-knopkoj/">Install wordpress: /etc/php/x.x/fpm/pool.d</a> <br>
&emsp; 10.5. <a href="https://linux.die.net/man/8/php-fpm">Running.</a>

