#!/bin/sh

set -e
python manage.py initadmin
python manage.py syncdb
python manage.py migrate
python manage.py runserver 0.0.0.0:80
