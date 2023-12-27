#!/bin/bash

PGPASSWORD=beatbuddy && pg_dump -c -w beatbuddy -U beatbuddy >/backup/$(date +%Y%m%d'_'%H_%M_%S).sql