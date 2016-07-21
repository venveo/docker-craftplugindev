FROM venveo/baseimage:7.0-apache
MAINTAINER Jason McCallister

# set the env options
ENV DB_HOST localhost
ENV DB_USER craftcms
ENV DB_PASS Password1!
ENV DB_PREFIX craft_

# download and install craft cms from latest
RUN ["/bin/bash", "-c", "curl -L -o /tmp/craft.zip https://craftcms.com/latest.zip?accept_license=yes"]

# Unzip craft
RUN unzip /tmp/craft.zip -d /var/www

# configure the cms to use docker images
COPY build/db.php /var/www/craft/config/db.php
COPY build/general.php /var/www/craft/config/general.php

# rename htaccess
RUN ["/bin/bash", "-c", "mv /var/www/public/htaccess /var/www/public/.htaccess"]

# make storage and config writeable
RUN ["/bin/bash", "-c", "chmod -R 777 /var/www/craft/storage"]
RUN ["/bin/bash", "-c", "chmod -R 777 /var/www/craft/config"]

WORKDIR /var/www
