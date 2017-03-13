#!/bin/bash

#This script runs the sql script that shows how many rows there are in
#each table in the DB

echo "Enter database username. "
read username

echo "Enter database password. "
read password

mysql -u "$username" --password="$password" < tablecount.sql
