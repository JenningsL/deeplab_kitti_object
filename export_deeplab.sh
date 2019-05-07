#!/bin/bash
export CUDA_HOME=/usr/local/cuda-10.0
export PATH=${CUDA_HOME}/bin:${PATH}
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:$LD_LIBRARY_PATH

export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim

CHECKPOINT_PATH="/data/ssd/public/jlliu/models/research/deeplab/exp/model.ckpt-90000"
OUTPUT_DIR=/data/ssd/public/jlliu/models/research/deeplab/exp
export CUDA_VISIBLE_DEVICES=7 && python deeplab/export_model.py \
    --logtostderr \
    --model_variant="xception_65" \
    --atrous_rates=6 \
    --atrous_rates=12 \
    --atrous_rates=18 \
    --output_stride=16 \
    --decoder_output_stride=4 \
    --crop_size=400 \
    --crop_size=1400 \
    --num_classes=4 \
    --checkpoint_path=${CHECKPOINT_PATH} \
    --export_path=${OUTPUT_DIR}/frozen_inference_graph.pb.feat
