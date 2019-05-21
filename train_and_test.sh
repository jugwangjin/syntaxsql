
#!/bin/bash

# ## full + aug
# hs=full
# tbl=std
# d_type="_augment"

# ## - aug
# hs=full
# tbl=std
# d_type=""

## - aug - table
# hs=full
# tbl=no
# d_type=""

# ## - aug - table -history
hs=no
tbl=no
d_type=""


toy="--toy"
# toy=""
# epoch=1 # 600 for spider, 200 for +aug
epoch=5

pretrain=""
# pretrain="--pretrain"

DATE=`date '+%Y-%m-%d-%H-%M-%S'`

data_root=generated_datasets\\generated_data${d_type}
save_dir=${data_root}\\saved_models_hs=${hs}_tbl=${tbl}_epoch${epoch}${pretrain}${toy}_${DATE}
log_dir=${save_dir}\\train_log
mkdir -p ${save_dir}
mkdir -p ${log_dir}

export CUDA_VISIBLE_DEVICES=0,1,2,3
module=col
CUDA_VISIBLE_DEVICES=0,1,2,3 python train.py \
  --data_root    ${data_root} \
  --save_dir     ${save_dir} \
  --history_type ${hs} \
  --table_type   ${tbl} \
  --train_component ${module} \
  --epoch        ${epoch} \
  ${toy} \
  ${pretrain} \
  > "${log_dir}\\train_${d_type}_hs=${hs}_tbl=${tbl}_${module}_${DATE}.txt" \
  2>&1 & wait

export CUDA_VISIBLE_DEVICES=0,1,2,3
module=multi_sql
CUDA_VISIBLE_DEVICES=0,1,2,3 python train.py \
  --data_root    ${data_root} \
  --save_dir     ${save_dir} \
  --history_type ${hs} \
  --table_type   ${tbl} \
  --train_component ${module} \
  --epoch        ${epoch} \
  ${toy} \
  ${pretrain} \
  > "${log_dir}\\train_${d_type}_hs=${hs}_tbl=${tbl}_${module}_${DATE}.txt" \
  2>&1 & wait

export CUDA_VISIBLE_DEVICES=0,1,2,3
module=keyword
CUDA_VISIBLE_DEVICES=0,1,2,3 python train.py \
  --data_root    ${data_root} \
  --save_dir     ${save_dir} \
  --history_type ${hs} \
  --table_type   ${tbl} \
  --train_component ${module} \
  --epoch        ${epoch} \
  ${toy} \
  ${pretrain} \
  > "${log_dir}\\train_${d_type}_hs=${hs}_tbl=${tbl}_${module}_${DATE}.txt" \
  2>&1 & wait

export CUDA_VISIBLE_DEVICES=0,1,2,3
module=op
CUDA_VISIBLE_DEVICES=0,1,2,3 python train.py \
  --data_root    ${data_root} \
  --save_dir     ${save_dir} \
  --history_type ${hs} \
  --table_type   ${tbl} \
  --train_component ${module} \
  --epoch        ${epoch} \
  ${toy} \
  ${pretrain} \
  > "${log_dir}\\train_${d_type}_hs=${hs}_tbl=${tbl}_${module}_${DATE}.txt" \
  2>&1 & wait

export CUDA_VISIBLE_DEVICES=0,1,2,3
module=agg
CUDA_VISIBLE_DEVICES=0,1,2,3 python train.py \
  --data_root    ${data_root} \
  --save_dir     ${save_dir} \
  --history_type ${hs} \
  --table_type   ${tbl} \
  --train_component ${module} \
  --epoch        ${epoch} \
  ${toy} \
  ${pretrain} \
  > "${log_dir}\\train_${d_type}_hs=${hs}_tbl=${tbl}_${module}_${DATE}.txt" \
  2>&1 & wait

export CUDA_VISIBLE_DEVICES=0,1,2,3
module=root_tem
CUDA_VISIBLE_DEVICES=0,1,2,3 python train.py \
  --data_root    ${data_root} \
  --save_dir     ${save_dir} \
  --history_type ${hs} \
  --table_type   ${tbl} \
  --train_component ${module} \
  --epoch        ${epoch} \
  ${toy} \
  ${pretrain} \
  > "${log_dir}\\train_${d_type}_hs=${hs}_tbl=${tbl}_${module}_${DATE}.txt" \
  2>&1 & wait

export CUDA_VISIBLE_DEVICES=0,1,2,3
module=des_asc
CUDA_VISIBLE_DEVICES=0,1,2,3 python train.py \
  --data_root    ${data_root} \
  --save_dir     ${save_dir} \
  --history_type ${hs} \
  --table_type   ${tbl} \
  --train_component ${module} \
  --epoch        ${epoch} \
  ${toy} \
  ${pretrain} \
  > "${log_dir}\\train_${d_type}_hs=${hs}_tbl=${tbl}_${module}_${DATE}.txt" \
  2>&1 & wait

export CUDA_VISIBLE_DEVICES=0,1,2,3
module=having
CUDA_VISIBLE_DEVICES=0,1,2,3 python train.py \
  --data_root    ${data_root} \
  --save_dir     ${save_dir} \
  --history_type ${hs} \
  --table_type   ${tbl} \
  --train_component ${module} \
  --epoch        ${epoch} \
  ${toy} \
  ${pretrain} \
  > "${log_dir}\\train_${d_type}_hs=${hs}_tbl=${tbl}_${module}_${DATE}.txt" \
  2>&1 & wait

export CUDA_VISIBLE_DEVICES=0,1,2,3
module=andor
CUDA_VISIBLE_DEVICES=0,1,2,3 python train.py \
  --data_root    ${data_root} \
  --save_dir     ${save_dir} \
  --history_type ${hs} \
  --table_type   ${tbl} \
  --train_component ${module} \
  --epoch        ${epoch} \
  ${toy} \
  ${pretrain} \
  > "${log_dir}\\train_${d_type}_hs=${hs}_tbl=${tbl}_${module}_${DATE}.txt" \
  2>&1 & wait


TEST_DATA=data\\dev.json
CUDA_VISIBLE_DEVICES=0,1,2,3 python test.py \
    --test_data_path  ${TEST_DATA} \
    --models          ${save_dir} \
    --output_path     ${save_dir}/dev_result.txt \
    --history_type    full \
    --table_type      std \
     > ${SAVE_PATH}\\dev_result.out.txt 2>&1 & wait



pretrain="--pretrain"
DATE=`date '+%Y-%m-%d-%H-%M-%S'`

data_root=generated_datasets\\generated_data${d_type}
save_dir=${data_root}\\saved_models_hs=${hs}_tbl=${tbl}_epoch${epoch}${pretrain}${toy}_${DATE}
log_dir=${save_dir}\\train_log
mkdir -p ${save_dir}
mkdir -p ${log_dir}

export CUDA_VISIBLE_DEVICES=0,1,2,3
module=col
CUDA_VISIBLE_DEVICES=0,1,2,3 python train.py \
  --data_root    ${data_root} \
  --save_dir     ${save_dir} \
  --history_type ${hs} \
  --table_type   ${tbl} \
  --train_component ${module} \
  --epoch        ${epoch} \
  ${toy} \
  ${pretrain} \
  > "${log_dir}\\train_${d_type}_hs=${hs}_tbl=${tbl}_${module}_${DATE}.txt" \
  2>&1 & wait

export CUDA_VISIBLE_DEVICES=0,1,2,3
module=multi_sql
CUDA_VISIBLE_DEVICES=0,1,2,3 python train.py \
  --data_root    ${data_root} \
  --save_dir     ${save_dir} \
  --history_type ${hs} \
  --table_type   ${tbl} \
  --train_component ${module} \
  --epoch        ${epoch} \
  ${toy} \
  ${pretrain} \
  > "${log_dir}\\train_${d_type}_hs=${hs}_tbl=${tbl}_${module}_${DATE}.txt" \
  2>&1 & wait

export CUDA_VISIBLE_DEVICES=0,1,2,3
module=keyword
CUDA_VISIBLE_DEVICES=0,1,2,3 python train.py \
  --data_root    ${data_root} \
  --save_dir     ${save_dir} \
  --history_type ${hs} \
  --table_type   ${tbl} \
  --train_component ${module} \
  --epoch        ${epoch} \
  ${toy} \
  ${pretrain} \
  > "${log_dir}\\train_${d_type}_hs=${hs}_tbl=${tbl}_${module}_${DATE}.txt" \
  2>&1 & wait

export CUDA_VISIBLE_DEVICES=0,1,2,3
module=op
CUDA_VISIBLE_DEVICES=0,1,2,3 python train.py \
  --data_root    ${data_root} \
  --save_dir     ${save_dir} \
  --history_type ${hs} \
  --table_type   ${tbl} \
  --train_component ${module} \
  --epoch        ${epoch} \
  ${toy} \
  ${pretrain} \
  > "${log_dir}\\train_${d_type}_hs=${hs}_tbl=${tbl}_${module}_${DATE}.txt" \
  2>&1 & wait

export CUDA_VISIBLE_DEVICES=0,1,2,3
module=agg
CUDA_VISIBLE_DEVICES=0,1,2,3 python train.py \
  --data_root    ${data_root} \
  --save_dir     ${save_dir} \
  --history_type ${hs} \
  --table_type   ${tbl} \
  --train_component ${module} \
  --epoch        ${epoch} \
  ${toy} \
  ${pretrain} \
  > "${log_dir}\\train_${d_type}_hs=${hs}_tbl=${tbl}_${module}_${DATE}.txt" \
  2>&1 & wait

export CUDA_VISIBLE_DEVICES=0,1,2,3
module=root_tem
CUDA_VISIBLE_DEVICES=0,1,2,3 python train.py \
  --data_root    ${data_root} \
  --save_dir     ${save_dir} \
  --history_type ${hs} \
  --table_type   ${tbl} \
  --train_component ${module} \
  --epoch        ${epoch} \
  ${toy} \
  ${pretrain} \
  > "${log_dir}\\train_${d_type}_hs=${hs}_tbl=${tbl}_${module}_${DATE}.txt" \
  2>&1 & wait

export CUDA_VISIBLE_DEVICES=0,1,2,3
module=des_asc
CUDA_VISIBLE_DEVICES=0,1,2,3 python train.py \
  --data_root    ${data_root} \
  --save_dir     ${save_dir} \
  --history_type ${hs} \
  --table_type   ${tbl} \
  --train_component ${module} \
  --epoch        ${epoch} \
  ${toy} \
  ${pretrain} \
  > "${log_dir}\\train_${d_type}_hs=${hs}_tbl=${tbl}_${module}_${DATE}.txt" \
  2>&1 & wait

export CUDA_VISIBLE_DEVICES=0,1,2,3
module=having
CUDA_VISIBLE_DEVICES=0,1,2,3 python train.py \
  --data_root    ${data_root} \
  --save_dir     ${save_dir} \
  --history_type ${hs} \
  --table_type   ${tbl} \
  --train_component ${module} \
  --epoch        ${epoch} \
  ${toy} \
  ${pretrain} \
  > "${log_dir}\\train_${d_type}_hs=${hs}_tbl=${tbl}_${module}_${DATE}.txt" \
  2>&1 & wait

export CUDA_VISIBLE_DEVICES=0,1,2,3
module=andor
CUDA_VISIBLE_DEVICES=0,1,2,3 python train.py \
  --data_root    ${data_root} \
  --save_dir     ${save_dir} \
  --history_type ${hs} \
  --table_type   ${tbl} \
  --train_component ${module} \
  --epoch        ${epoch} \
  ${toy} \
  ${pretrain} \
  > "${log_dir}\\train_${d_type}_hs=${hs}_tbl=${tbl}_${module}_${DATE}.txt" \
  2>&1 & wait

TEST_DATA=data\\dev.json
CUDA_VISIBLE_DEVICES=0,1,2,3 python test.py \
    --test_data_path  ${TEST_DATA} \
    --models          ${save_dir} \
    --output_path     ${save_dir}/dev_result.txt \
    --history_type    full \
    --table_type      std \
     > ${SAVE_PATH}\\dev_result.out.txt 2>&1 & wait


# export CUDA_VISIBLE_DEVICES=0,1,2,3
# module=col
# epoch=600
# CUDA_VISIBLE_DEVICES=0,1,2,3 python train.py \
#   --data_root    ${data_root} \
#   --save_dir     ${save_dir} \
#   --history_type ${hs} \
#   --table_type   ${tbl} \
#   --train_component ${module} \
#   --epoch        ${epoch} \
#   ${toy} \
#   > "${log_dir}/train_${d_type}_hs=${hs}_tbl=${tbl}_${module}_${DATE}.txt" \
#   2>&1 &

# export CUDA_VISIBLE_DEVICES=0,1,2,3
# epoch=300
# for module in col multi_sql keyword op agg root_tem des_asc having andor
# do
#   python train.py \
#     --data_root    ${data_root} \
#     --save_dir     ${save_dir} \
#     --history_type ${hs} \
#     --table_type   ${tbl} \
#     --train_component ${module} \
#     --epoch        ${epoch} \
#     ${toy} \
#     > "${log_dir}/train_${d_type}_hs=${hs}_tbl=${tbl}_${module}_${DATE}.txt" \
#     2>&1 &