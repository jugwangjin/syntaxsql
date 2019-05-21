#!/bin/bash

export CUDA_VISIBLE_DEVICES=0,1,2,3
TEST_DATA=data\\dev.json

# # full + aug
# SAVE_PATH=generated_datasets/generated_data_augment/saved_models_hs=full_tbl=std
# CUDA_VISIBLE_DEVICES=0,1,2,3 python test.py \
#     --test_data_path  ${TEST_DATA} \
#     --models          ${SAVE_PATH} \
#     --output_path     ${SAVE_PATH}/dev_result.txt \
#     --history_type    full \
#     --table_type      std \
#      > ${SAVE_PATH}/dev_result.out.txt 2>&1 &


# - aug
# mkdir generated_datasets\\generated_data\\saved_models_hs=full_tbl=std
SAVE_PATH=generated_datasets\\generated_data\\saved_models_hs=full_tbl=std
CUDA_VISIBLE_DEVICES=0,1,2,3 python test.py \
    --test_data_path  ${TEST_DATA} \
    --models          ${SAVE_PATH} \
    --output_path     ${SAVE_PATH}/dev_result.txt \
    --history_type    full \
    --table_type      std \
     > ${SAVE_PATH}\\dev_result.out.txt 2>&1 &


# # - aug - table
# SAVE_PATH=generated_datasets/generated_data/saved_models_hs=full_tbl=no
# CUDA_VISIBLE_DEVICES=0,1,2,3 python test.py \
#     --test_data_path  ${TEST_DATA} \
#     --models          ${SAVE_PATH} \
#     --output_path     ${SAVE_PATH}/dev_result.txt \
#     --history_type    full \
#     --table_type      no \
#      > ${SAVE_PATH}/dev_result.out.txt 2>&1 &


# - aug - table - history
# SAVE_PATH=generated_datasets/generated_data/saved_models_hs=no_tbl=no
# CUDA_VISIBLE_DEVICES=0,1,2,3 python test.py \
#     --test_data_path  ${TEST_DATA} \
#     --models          ${SAVE_PATH} \
#     --output_path     ${SAVE_PATH}/dev_result.txt \
#     --history_type    no \
#     --table_type      no \
#      > ${SAVE_PATH}/dev_result.out.txt 2>&1 &
done