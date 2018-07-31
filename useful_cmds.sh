#!/usr/bin/env bash
# run their best model: e.g.,
python main.py --input ./input --video_root ./../../Interactions/data/ --output ./output.json --model /storage/gby/models/C3Ds/resnext-101-kinetics.pth --resnet_shortcut B --mode score --batch_size 6 --model_depth 101 --model_name resnext

# generate tags: e.g.,
python generate_result_video/generate_result_video.py ./output.json ../../Interactions/data/ ./generate_result_video/videos_pred class_names_list 5

# generating gif: e.g.,
ffmpeg -i _zazCBo7Ppk_000010_000020.mp4 -framerate 5 _zazCBo7Ppk_000010_000020.gif

# generate GIFs for a list of MP4: e.g., 
sh generate_gif_for_mp4.sh ../input videos_pred/





ffmpeg -i D9uDROiAEig_000040_000050.mp4 -framerate 5 D9uDROiAEig_000040_000050.gif
