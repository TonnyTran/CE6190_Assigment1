#!/bin/bash

#SBATCH --job-name=CRIS
#SBATCH --ntasks=1 --cpus-per-task=6
#SBATCH --partition=new --gres=gpu:1
#SBATCH --time=06-06:20:00
#SBATCH --output logfiles/cris/hyperparameters_refcoco/input_half_size_val
##### BASELINE EXPERIMENT ######

USE_GRADIENT_ACCUMMULATION=0 # 0: no , 1:yes
gradient_steps=2
exp_setup="twice"
input_size=256
experiment_name="CRIS_R50_image_size_all_rest_same"
batch_size=32
test_set=val-test #testA, testB, val-test
test_lmdb=val  #testA, testB, val
### ORIGINAL WAY TO RUN THE BASELINE #####

echo "testing test $test_set"

source /home/fabian/miniconda3/bin/activate robust_s3prl
cd /home/fabian/NTU_courseworks/ce6190_image/assignment1/CE6190/Assignment_1/CRIS/CRIS.pytorch
# basic test.
CUDA_VISIBLE_DEVICES=0 python -u test.py \
--config config/refcoco/cris_r50.yaml --opts TEST.test_split $test_set \
TEST.test_lmdb datasets/lmdb/refcoco/$test_lmdb.lmdb \
TRAIN.exp_name ${experiment_name} TRAIN.gradient_acummulation_steps 1 \
    TRAIN.input_size $input_size TRAIN.batch_size $batch_size TRAIN.epochs 50 TRAIN.batch_size_val $batch_size