#!/bin/bash

PGPASSWORD=beatbuddyauthdb && pg_dump -c -w beatbuddyauthdb -U beatbuddyauthdb > /backup/$(date +%Y%m%d'_'%H_%M_%S).sql