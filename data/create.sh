#! /bin/bash

# Get working directory
dir="'"$(pwd)"'"

## ----------------------------------
## CREATE DIRECTORY FOR CLEAN TABLES
## ----------------------------------
if [ -z $(find -type d | grep -v ^\.$ ) ]
then
    mkdir clean_data
fi

## -------------------------
## CLEAN TABLES
## -------------------------
for i in $(ls | grep .*csv); do name=$(echo $i | sed 's/export_//g'); tail -n +2 $i > "./clean_data/clean_"$name ; done

## -------------------------
## CREATE DB
## -------------------------
existDB=$(psql -lqt -U postgres | awk -F '|' '{print $1}' | grep -iE 'fact.*' | wc -l)
# Create database
if [ $existDB -eq 0 ]
then
    echo -e 'DATABASE facturama DOES NOT EXISTS. CREATING...'
    echo -e "-----------------\n ENTER POSTGRES USER PASSWORD \n-----------------"
    createdb -U postgres -O fact facturama
else
    echo -e 'DATABASE facturama ALREADY EXISTS.'
fi

## -------------------------
## CREATE TABLES
## -------------------------
echo $dir
psql -v v1=$dir -d facturama -a -f createDB.sql -U fact
