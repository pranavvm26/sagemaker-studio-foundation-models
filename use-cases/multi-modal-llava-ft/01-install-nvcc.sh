wget https://developer.download.nvidia.com/compute/cuda/12.2.0/local_installers/cuda_12.2.0_535.54.03_linux.run -O /tmp/cuda_linux.run
sudo chmod +x /tmp/cuda_linux.run 
echo "... running nvcc install, please be patient, may take upto ~10 min for this to finish\n"
echo "------ Installation Starting ------\n"
sudo /tmp/cuda_linux.run
echo "------ Installation Complete ------\n"
nvcc --version