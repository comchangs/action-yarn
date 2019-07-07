#!/bin/sh -l

set -e

echo "Starting..."

npm install -g yarn

sh -c "$*"

echo "Finished!"