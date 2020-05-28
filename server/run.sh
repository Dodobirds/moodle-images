#!/bin/bash

cd /bitnami/moodle

## Default installs it inside the webfolder, moving it makes permissions easier
mv /bitnami/moodle/moodledata /bitnami
sed -i "s+/bitnami/moodle/moodledata+/bitnami/moodledata+g" /bitnami/moodle/config.php

# Moosh install plugin
sudo -u bitnami moosh plugin-list
sudo -u bitnami moosh plugin-install mod_vpl
# Moosh create a category
sudo -u bitnami moosh category-create -p 1 -v 1 -d "Exam" exam
# moosh add the course
sudo -u bitnami moosh course-restore /course/backup.mbz 1

chmod -R 0777 /bitnami/moodledata

## Clearing a cache
rm -r /bitnami/moodledata/lock/*
cd /

# So basically the entrypoint looks to see if CMD is called run.sh to run the
# moodle install scripts. We just renamed the original run.sh and call it here
# after inserting our own scripts above.
exec /bin/bash /entry.sh
