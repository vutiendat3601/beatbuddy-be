#!/bin/bash

PGPASSWORD=beatbuddyapidb && pg_dump -c -w beatbuddyapidb -U beatbuddyapidb --exclude-table='flyway_schema_history' > /backup/$(date +%Y%m%d'_'%H_%M_%S).sql