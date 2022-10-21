#!/bin/bash

#SBATCH --job-name=CRIS
#SBATCH --ntasks=1 --cpus-per-task=6
#SBATCH --partition=gpu --gres=gpu:2
#SBATCH --time=06-06:20:00
#SBATCH --output logfiles/cris/hyperparameters_refcoco/twice_image_size_all_rest_same
##### BASELINE EXPERIMENT ######

USE_GRADIENT_ACCUMMULATION=0 # 0: no , 1:yes
gradient_steps=
exp_setup="half"
#let input_size=256
input_size=832 #orig was 416
experiment_name="CRIS_R50_twice_image_size_all_rest_same"
batch_size=32 #original i used is 32
base_lr=0.0001

### ORIGINAL WAY TO RUN THE BASELINE #####

source /home/fabian/miniconda3/bin/activate robust_s3prl
echo "input size: $input_size"

if [ $USE_GRADIENT_ACCUMMULATION -le 0 ]; then
    echo "running train no accum"
    echo "decreasing batch size to $orig_batch_size"
    #let base_lr=0.0001/2
    python -u train.py --config config/refcoco/cris_r50.yaml \
    --opts TRAIN.gradient_acummulation_steps 1 \
    TRAIN.input_size $input_size TRAIN.exp_name ${experiment_name} \
    TRAIN.batch_size $batch_size TRAIN.epochs 50 TRAIN.base_lr $base_lr TRAIN.batch_size_val 32



elif [ $USE_GRADIENT_ACCUMMULATION -ge 1 ]; then
let batch_size=$orig_batch_size/$gradient_steps
echo "batch size is $batch_size"
python -u train.py --config config/refcoco/cris_r50.yaml \
    --opts TRAIN.gradient_acummulation_steps $gradient_steps \
    TRAIN.input_size $input_size TRAIN.exp_name ${experiment_name}_grad_accum_${gradient_steps}_steps \
    TRAIN.batch_size $batch_size

fi

