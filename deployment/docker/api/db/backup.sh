#!/bin/bash

PGPASSWORD=bbapidb && pg_dump -w bbapidb -U bbapidb --exclude-table='flyway_schema_history' > /backup/$(date +%Y%m%d'_'%H_%M_%S).sql
