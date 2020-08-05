#!/bin/bash
4.0.0.1744

set -euo pipefail

VER="4.4.0.2170"



wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${VER}-linux.zip
unzip sonar-scanner-cli-${VER}-linux.zip
rm sonar-scanner-cli-${VER}-linux.zip


PATH="$(pwd)/sonar-scanner-${VER}-linux/bin:${PATH}"
export PATH="${PATH}"
echo "Path is now: ${PATH}"

ln -s "$(pwd)/sonar-scanner-${VER}-linux/bin/sonar-scanner" "/usr/bin/sonar-scanner"
