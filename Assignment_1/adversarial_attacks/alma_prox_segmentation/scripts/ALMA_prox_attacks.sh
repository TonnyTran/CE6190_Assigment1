#!/bin/bash

cd ..

python attack_experiment.py -F ~/scratch/Documents/CE6190/adversarial_attacks/alma_prox_segmentation/exps with dataset.pascal_voc_2012 model.deeplabv3plus_resnet50 cudnn_flag=benchmark attack.alma_prox_l1 dataset.num_images=100 save_adv=True
python attack_experiment.py -F ~/scratch/Documents/CE6190/adversarial_attacks/alma_prox_segmentation/exps with dataset.pascal_voc_2012 model.deeplabv3plus_resnet50 cudnn_flag=benchmark attack.alma_prox_l1 dataset.num_images=100 save_adv=True
python attack_experiment.py -F ~/scratch/Documents/CE6190/adversarial_attacks/alma_prox_segmentation/exps with dataset.pascal_voc_2012 model.deeplabv3plus_resnet50 cudnn_flag=benchmark attack.alma_prox_l1 dataset.num_images=100 save_adv=True
