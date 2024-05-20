git clone https://github.com/haotian-liu/LLaVA.git 
cd /home/sagemaker-user/LLaVA/ && pip install -e ".[train]"
cd /home/sagemaker-user/
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
pip install flash-attn==2.5.8 --no-build-isolation --no-cache-dir
pip install tensorboardX==2.6.2.2
pip install deepspeed
wget http://images.cocodataset.org/zips/train2017.zip 
unzip -Z1 train2017.zip | head -10000 | sed 's| |\\ |g' | xargs unzip train2017.zip
echo "Sampling dataset..."
python3 /home/sagemaker-user/download_and_sample_data.py