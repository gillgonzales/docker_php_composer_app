FROM ubuntu:noble

WORKDIR /var/www/html

COPY . .

ENV TERM=xterm
RUN apt-get update && apt-get upgrade -y
RUN apt-get install curl vim -y
RUN curl -fsSL https://php.new/install/linux/8.4 > ./install_php
RUN chmod 0777 ./install_php
RUN ./install_php
RUN ln -s /root/.config/herd-lite/bin/php /usr/local/bin/
RUN ln -s /root/.config/herd-lite/bin/composer /usr/local/bin/

# ENTRYPOINT [ "/var/www/html/composer_start" ]

EXPOSE 8080