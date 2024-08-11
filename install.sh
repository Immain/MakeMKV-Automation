#!/bin/bash

# Update package list and install necessary dependencies
sudo apt-get update
sudo apt-get install -y build-essential pkg-config libc6-dev libssl-dev libcurl4-openssl-dev libexpat1-dev libavcodec-dev libgl1-mesa-dev libqt5widgets5

# Download MakeMKV source code
wget https://www.makemkv.com/download/makemkv-oss-1.17.7.tar.gz
wget https://www.makemkv.com/download/makemkv-bin-1.17.7.tar.gz

# Extract the downloaded tarballs
tar -xvzf makemkv-oss-1.17.7.tar.gz
tar -xvzf makemkv-bin-1.17.7.tar.gz

# Build and install makemkv-oss
cd makemkv-oss-1.17.7
./configure
make
sudo make install
cd ..

# Build and install makemkv-bin
cd makemkv-bin-1.17.7
make
sudo make install
cd ..

# Clean up
rm -rf makemkv-oss-1.17.7 makemkv-bin-1.17.7
rm makemkv-oss-1.17.7.tar.gz makemkv-bin-1.17.7.tar.gz

echo "MakeMKV 1.17.7 installation completed successfully."
