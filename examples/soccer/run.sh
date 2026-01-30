#!/usr/bin/bash

modes=('PITCH_DETECTION' 'PLAYER_DETECTION' 'BALL_DETECTION' 'PLAYER_TRACKING' 'TEAM_CLASSIFICATION' 'RADAR')
for video in data/*.mp4; do
	for mode in "${modes[@]}"; do
		python main.py -m $mode -d cuda -O data/tests "$video"
	done
done
