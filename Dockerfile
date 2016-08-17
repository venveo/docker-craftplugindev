FROM venveo/baseimage:7.0-apache
MAINTAINER Jason McCallister

# download and install craft cms from latest
RUN ["/bin/bash", "-c", "curl -L -o /tmp/craft.zip https://craftcms.com/latest.zip?accept_license=yes"]

# Unzip craft
RUN unzip /tmp/craft.zip -d /var/www

# configure the cms to use docker images
COPY config/db.php /var/www/craft/config/db.php
COPY config/general.php /var/www/craft/config/general.php

# rename htaccess
RUN ["/bin/bash", "-c", "mv /var/www/public/htaccess /var/www/public/.htaccess"]

# make storage and config writeable
RUN ["/bin/bash", "-c", "chmod -R 777 /var/www/craft/storage"]
RUN ["/bin/bash", "-c", "chmod -R 777 /var/www/craft/config"]

WORKDIR /var/www
