#!/bin/bash

PGPASSWORD=beatbuddyapidb && pg_dump -c -w beatbuddyapidb -U beatbuddyapidb > /backup/$(date +%Y%m%d'_'%H_%M_%S).sql