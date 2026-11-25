#!/bin/sh
# Downloads a local copy of three.js so the 3D hand works with no internet.
# Run this inside the folder that holds index.html, then commit the vendor folder.
# index.html checks for the local copy first and falls back to the CDN on its own.

set -e
mkdir -p vendor
curl -L --fail -o vendor/three.module.min.js \
  https://cdn.jsdelivr.net/npm/three@0.160.0/build/three.module.min.js

echo "Saved vendor/three.module.min.js"
echo "The page will now run offline. Commit the vendor folder along with index.html."
