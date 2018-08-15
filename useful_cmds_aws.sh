# run their best model: e.g., 
python main.py --input ./input --video_root ./../../Interactions/data/ --output ./output.json --model /storage/gby/models/C3Ds/resnext-101-kinetics.pth --resnet_shortcut B --mode score --batch_size 6 --model_depth 101 --model_name resnext

# aws:
python main.py --input ./input --video_root ../../data/fight_data_ec2/ --output ./output.json --model ../../models/C3Ds/resnext-101-kinetics-hmdb51_split1.pth --resnet_shortcut B --mode score --batch_size 6 --model_depth 101 --model_name resnext

# generate tags:
python generate_result_video/generate_result_video.py ./output.json ../../Interactions/data/ ./generate_result_video/videos_pred class_names_list 5
# aws:
python generate_result_video/generate_result_video.py ./output.json ../../data/fight_data_ec2/ ./generate_result_video/videos_pred class_names_list 5



# generating gif:
ffmpeg -i _zazCBo7Ppk_000010_000020.mp4 -framerate 5 _zazCBo7Ppk_000010_000020.gif
