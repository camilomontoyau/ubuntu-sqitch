#!/bin/bash

# this script reads the sqitch.plan file and replaces the project name with the value of the MYSQL_DATABASE environment variable

# Get MYSQL_DATABASE environment variable
MYSQL_DATABASE=${MYSQL_DATABASE:-default}