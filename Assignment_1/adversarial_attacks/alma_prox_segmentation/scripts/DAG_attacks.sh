#!/bin/bash

cd ..

python attack_experiment.py -F exps with dataset.pascal_voc_2012 model.deeplabv3plus_resnet50 cudnn_flag=benchmark attack.dag attack.gamma=0.003 dataset.num_images=100 save_adv=True

python attack_experiment.py -F exps with dataset.pascal_voc_2012 model.deeplabv3plus_resnet50 cudnn_flag=benchmark attack.dag attack.gamma=0.001 dataset.num_images=100 save_adv=True

python attack_experiment.py -F exps with dataset.pascal_voc_2012 model.deeplabv3plus_resnet50 cudnn_flag=benchmark attack.dag attack.dag attack.p=2 attack.gamma=0.1 dataset.num_images=100 save_adv=True

python attack_experiment.py -F exps with dataset.pascal_voc_2012 model.deeplabv3plus_resnet50 cudnn_flag=benchmark attack.dag attack.dag attack.p=2 attack.gamma=0.03 dataset.num_images=100 save_adv=True

python attack_experiment.py -F exps with dataset.pascal_voc_2012 model.deeplabv3plus_resnet50 cudnn_flag=benchmark attack.dag attack.p=1 attack.gamma=100 dataset.num_images=100 save_adv=True

python attack_experiment.py -F exps with dataset.pascal_voc_2012 model.deeplabv3plus_resnet50 cudnn_flag=benchmark attack.dag attack.p=1 attack.gamma=30 dataset.num_images=100 save_adv=True