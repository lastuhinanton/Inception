#!/bin/sh

./node_exporter &
nginx -g "daemon off;"