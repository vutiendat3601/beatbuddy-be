#!/bin/bash

PGPASSWORD=bbauthdb && pg_dump -w -U bbauthdb -d bbauthdb > /backup/$(date +%Y%m%d'_'%H_%M_%S).sql
