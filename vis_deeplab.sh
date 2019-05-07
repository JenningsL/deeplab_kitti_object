#!/bin/bash
export CUDA_HOME=/usr/local/cuda-10.0
export PATH=${CUDA_HOME}/bin:${PATH}
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:$LD_LIBRARY_PATH

export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim

BASE_PATH=/data/ssd/public/jlliu/deeplab_kitti
PATH_TO_CHECKPOINT_DIR=${BASE_PATH}/deeplab/exp
PATH_TO_LOG_DIR=${BASE_PATH}/deeplab/exp/vis
PATH_TO_DATASET=${BASE_PATH}/deeplab/datasets/Kitti/tfrecord
export CUDA_VISIBLE_DEVICES=2 && python deeplab/vis.py \
    --logtostderr \
    --vis_split="val" \
    --model_variant="xception_65" \
    --atrous_rates=6 \
    --atrous_rates=12 \
    --atrous_rates=18 \
    --output_stride=16 \
    --decoder_output_stride=4 \
    --vis_crop_size=400 \
    --vis_crop_size=1400 \
    --train_batch_size=1 \
    --dataset="kitti" \
    --colormap_type="cityscapes" \
    --checkpoint_dir=${PATH_TO_CHECKPOINT_DIR} \
    --vis_logdir=${PATH_TO_LOG_DIR} \
    --also_save_raw_predictions=True \
    --dataset_dir=${PATH_TO_DATASET}
