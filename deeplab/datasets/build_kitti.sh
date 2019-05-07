#!/bin/bash

  #--list_folder="/data/ssd/public/jlliu/Kitti/object" \
python ./build_voc2012_data.py \
  --image_folder="/data/ssd/public/jlliu/Kitti/object/training/image_2" \
  --semantic_segmentation_folder="/data/ssd/public/jlliu/Kitti/object/training/semantic_mask" \
  --list_folder="/data/ssd/public/jlliu/Kitti/object" \
  --image_format="png" \
  --output_dir="/data/ssd/public/jlliu/models/research/deeplab/datasets/Kitti/tfrecord"
