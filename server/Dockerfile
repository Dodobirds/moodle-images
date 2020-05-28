FROM bitnami/moodle:3.8.2

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
COPY moosh /moosh

RUN mv run.sh entry.sh
COPY run.sh /

ENV MOODLE_DATABASE_USER="moodle_db_user" \
    MOODLE_DATABASE_NAME="moodle_db" \
    MOODLE_DATABASE_PASSWORD="moodle_db_password" \
    MOODLE_USERNAME="user" \
    MOODLE_PASSWORD="pass"

RUN cd /moosh && composer install && ln -s $PWD/moosh.php /bin/moosh

