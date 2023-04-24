#!/bin/bash
sudo rm -rf ./data/database/* ./data/www/* ./data/logs/* ./data/grafana_data/*
sudo chmod -R 777 ./data/database/ ./data/www/ ./data/logs/ ./data/grafana_data/*