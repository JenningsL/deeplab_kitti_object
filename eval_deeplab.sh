#!/bin/bash
export CUDA_HOME=/usr/local/cuda-10.0
export PATH=${CUDA_HOME}/bin:${PATH}
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:$LD_LIBRARY_PATH

export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim

PATH_TO_CHECKPOINT_DIR=/data/ssd/public/jlliu/models/research/deeplab/exp
PATH_TO_LOG_DIR=/data/ssd/public/jlliu/models/research/deeplab/exp/evaluation
PATH_TO_DATASET=/data/ssd/public/jlliu/models/research/deeplab/datasets/Kitti/tfrecord
export CUDA_VISIBLE_DEVICES=6 && python deeplab/eval.py \
    --logtostderr \
    --eval_split="val" \
    --model_variant="xception_65" \
    --atrous_rates=6 \
    --atrous_rates=12 \
    --atrous_rates=18 \
    --output_stride=16 \
    --decoder_output_stride=4 \
    --eval_crop_size=400 \
    --eval_crop_size=1400 \
    --dataset="kitti" \
    --checkpoint_dir=${PATH_TO_CHECKPOINT_DIR} \
    --eval_logdir=${PATH_TO_LOG_DIR} \
    --dataset_dir=${PATH_TO_DATASET}
