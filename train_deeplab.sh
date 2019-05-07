#!/bin/bash
export CUDA_HOME=/usr/local/cuda-10.0
export PATH=${CUDA_HOME}/bin:${PATH}
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:$LD_LIBRARY_PATH

export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim

PATH_TO_INITIAL_CHECKPOINT=/data/ssd/public/jlliu/models/research/deeplab/checkpoints/deeplabv3_cityscapes_train/model.ckpt
PATH_TO_TRAIN_DIR=/data/ssd/public/jlliu/models/research/deeplab/exp
PATH_TO_DATASET=/data/ssd/public/jlliu/models/research/deeplab/datasets/Kitti/tfrecord
export CUDA_VISIBLE_DEVICES=5 && python deeplab/train.py \
    --logtostderr \
    --training_number_of_steps=90000 \
    --train_split="train" \
    --model_variant="xception_65" \
    --atrous_rates=6 \
    --atrous_rates=12 \
    --atrous_rates=18 \
    --output_stride=16 \
    --decoder_output_stride=4 \
    --train_crop_size=360 \
    --train_crop_size=1200 \
    --train_batch_size=1 \
    --dataset="kitti" \
    --tf_initial_checkpoint=${PATH_TO_INITIAL_CHECKPOINT} \
    --train_logdir=${PATH_TO_TRAIN_DIR} \
    --dataset_dir=${PATH_TO_DATASET} \
    --initialize_last_layer=False \
    --last_layers_contain_logits_only=True \
    --fine_tune_batch_norm=False
