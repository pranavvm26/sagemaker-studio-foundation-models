"""download llava default dataset json and only keep subnet for model finetuning """

import os
import json
from tqdm import tqdm
from huggingface_hub import hf_hub_download

if __name__ == "__main__":

    print("Downloading liuhaotian/LLaVA-Instruct-150K dataset")
    filepath = hf_hub_download(
        repo_id="liuhaotian/LLaVA-Instruct-150K", 
        filename="llava_instruct_80k.json", 
        repo_type="dataset", 
        local_dir="./"
    )

    image_folder = "./train2017"
    temp_images = os.listdir(image_folder)
    list_data_dict = json.load(open("./llava_instruct_80k.json", "r"))
    sample_list_data_dict = []
    for row in tqdm(list_data_dict, total=len(list_data_dict), desc="slicing dataset"):
        if row['image'] in temp_images:
            sample_list_data_dict.append(row)
    
    with open('./sample-training-data.json', 'w') as f:
        json.dump(sample_list_data_dict, f)