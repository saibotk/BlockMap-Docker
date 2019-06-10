#!/bin/sh +x
# Stop this script on the first failure (e.g. cannot create the output folder)
set -e

# This script renders one or more worlds with different settings. It is an example for how to use BlockMap in scripts. Adapt these
# variables to point to the required data for
# this to work. Further below are the actual render commands. Feel free to adapt them to your needs.
#
# The current configuration will render each dimension at least once, the overworld even multiple times (ocean ground view and
# cave view). All images are written to a different
# subfolder for each setting.

WORLD_FOLDER_OVERWORLD=/opt/blockmap/overworld
WORLD_FOLDER_NETHER=/opt/blockmap/nether
WORLD_FOLDER_END=/opt/blockmap/end
OUTPUT_DIR=/opt/blockmap/output
BLOCKMAP_FILE=/opt/blockmap/BlockMap.jar

# mkdir -p $OUTPUT_DIR
ls -l /opt/blockmap
# A simple and plain overworld view
echo "[INFO] Rendering overworld..."
mkdir -p $OUTPUT_DIR/overworld
java -jar $BLOCKMAP_FILE -v render -l -o=$OUTPUT_DIR/overworld $WORLD_FOLDER_OVERWORLD save --world-name="Overworld" --file="$OUTPUT_DIR/rendered.json"
# The ocean grounds of the overworld
echo "[INFO] Rendering overworld_ocean..."
mkdir -p $OUTPUT_DIR/overworld_ocean
java -jar $BLOCKMAP_FILE -v render -l -o=$OUTPUT_DIR/overworld_ocean -c=OCEAN_GROUND $WORLD_FOLDER_OVERWORLD save --world-name="Overworld (Ocean)" --file="$OUTPUT_DIR/rendered.json"
# All caves up to height 30
echo "[INFO] Rendering overworld_cave..."
mkdir -p $OUTPUT_DIR/overworld_cave
java -jar $BLOCKMAP_FILE -v render -l -o=$OUTPUT_DIR/overworld_cave -c=CAVES --max-height=30 $WORLD_FOLDER_OVERWORLD save --world-name="Overworld (Cave)" --file="$OUTPUT_DIR/rendered.json"
# The nether up to height 64
echo "[INFO] Rendering overworld_nether..."
mkdir -p $OUTPUT_DIR/overworld_nether
java -jar $BLOCKMAP_FILE -v render -l -o=$OUTPUT_DIR/nether --max-height=64 $WORLD_FOLDER_NETHER save --world-name="Nether" --file="$OUTPUT_DIR/rendered.json"
# A plain view of the end
echo "[INFO] Rendering overworld_end..."
mkdir -p $OUTPUT_DIR/overworld_end
java -jar $BLOCKMAP_FILE -v render -l -o=$OUTPUT_DIR/end $WORLD_FOLDER_END save --world-name="End" --file="$OUTPUT_DIR/rendered.json"
echo "[INFO] Rendering finished!"
