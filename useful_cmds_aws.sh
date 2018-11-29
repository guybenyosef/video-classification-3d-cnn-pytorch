#!/usr/bin/env bash
# youtube-dl
youtube-dl -f best -f mp4 "https://www.youtube.com/watch?v=sJFgo9H6zNo" -o "/storage/gby/datasets/AN/v_sJFgo9H6zNo.mp4"
youtube-dl -f best -f mp4 "https://www.youtube.com/watch?v=gd2aNEHKj1o" -o "gd2aNEHKj1o.mp4"
# parse with ffmpeg
ffmpeg -i ZbM-sZX0TN4.mp4 -ss 00:03:52 -t 00:00:10 -c:v libx264 -c:a copy -threads 1 -loglevel panic ZbM-sZX0TN4_000352_000402.mp4


python main.py --input ./input --video_root ./../../Interactions/data/ --output ./output.json --model /storage/gby/models/C3Ds/resnext-101-kinetics.pth --resnet_shortcut B --mode score --batch_size 6 --model_depth 101 --model_name resnext

 # aws:
python main.py --input ./input --video_root ../../data/fight_data_ec2/ --output ./output.json --model ../../models/C3Ds/resnext-101-kinetics.pth --resnet_shortcut B --mode score --batch_size 6 --model_depth 101 --model_name resnext
python main.py --input ./input --video_root ../../data/fight_data_ec2/ --output ./output.json --model ../../models/C3Ds/resnext-101-kinetics-hmdb51_split1.pth --resnet_shortcut B --mode score --batch_size 6 --model_depth 101 --model_name resnext

python main.py --input ./input_romance --video_root ../../data/romance/ --output ./output.json --model ../../models/C3Ds/resnext-101-kinetics-hmdb51_split1.pth --resnet_shortcut B --mode score --batch_size 32 --model_depth 101 --model_name resnext



 # generate tags:
python generate_result_video/generate_result_video.py ./output.json ../../Interactions/data/ ./generate_result_video/videos_pred class_names_list 5
 # aws:
python generate_result_video/generate_result_video.py ./output.json ../../data/fight_data_ec2/ ./generate_result_video/videos_pred class_names_list 5
python generate_result_video/generate_result_video4_continous_display.py ./output.json ../../data/fight_data_ec2/ ./generate_result_video/videos_pred class_names_list 5



 # generating gif:
 ffmpeg -i _zazCBo7Ppk_000010_000020.mp4 -framerate 5 _zazCBo7Ppk_000010_000020.gif