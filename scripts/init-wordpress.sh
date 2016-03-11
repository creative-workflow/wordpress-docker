#!/usr/bin/env bash

curl https://wordpress.org/latest.tar.gz | tar -xvzf -

cp sources/* wordpress/
