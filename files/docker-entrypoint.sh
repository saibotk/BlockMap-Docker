#!/bin/sh
# Stop this script on the first failure (e.g. cannot create the output folder)
set -e

echo "[INFO] Start rendering..."

java -jar /opt/blockmap/blockmap.jar render-many /config.json $@

echo "[INFO] Rendering finished!"
