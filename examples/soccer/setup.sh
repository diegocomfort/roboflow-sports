#!/bin/bash

# Get the directory where the script is located
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check if 'data' directory does not exist and then create it
if [[ ! -e $DIR/data/tests ]]; then
    mkdir -p "$DIR/data/tests"
fi

uv init --python 3.11
uv add \
   ultralytics \
   gdown\
   pillow \
   tqdm \
   scikit-learn \
   umap-learn \
   supervision \
   opencv-python \
   opencv-python-headless \
   numpy \
   'torch>=2.0' \
   'transformers>=4.37,<4.41' \
   sentencepiece \
   protobuf \
   'llvmlite==0.46.0' \
   'numba==0.63.1'

RUNNER="uv run"
[[ $(which gdown 2>/dev/null) ]] && RUNNER=""

# download the models
$RUNNER gdown -O "$DIR/data/football-ball-detection.pt" "https://drive.google.com/uc?id=1isw4wx-MK9h9LMr36VvIWlJD6ppUvw7V"
$RUNNER gdown -O "$DIR/data/football-player-detection.pt" "https://drive.google.com/uc?id=17PXFNlx-jI7VjVo_vQnB1sONjRyvoB-q"
$RUNNER gdown -O "$DIR/data/football-pitch-detection.pt" "https://drive.google.com/uc?id=1Ma5Kt86tgpdjCTKfum79YMgNnSjcoOyf"

# download the videos
$RUNNER gdown -O "$DIR/data/0bfacc_0.mp4" "https://drive.google.com/uc?id=12TqauVZ9tLAv8kWxTTBFWtgt2hNQ4_ZF"
$RUNNER gdown -O "$DIR/data/2e57b9_0.mp4" "https://drive.google.com/uc?id=19PGw55V8aA6GZu5-Aac5_9mCy3fNxmEf"
$RUNNER gdown -O "$DIR/data/08fd33_0.mp4" "https://drive.google.com/uc?id=1OG8K6wqUw9t7lp9ms1M48DxRhwTYciK-"
$RUNNER gdown -O "$DIR/data/573e61_0.mp4" "https://drive.google.com/uc?id=1yYPKuXbHsCxqjA9G-S6aeR2Kcnos8RPU"
$RUNNER gdown -O "$DIR/data/121364_0.mp4" "https://drive.google.com/uc?id=1vVwjW1dE1drIdd4ZSILfbCGPD4weoNiu"
