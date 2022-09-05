#!/bin/bash

cd ..

python attack_experiment.py -F exps with dataset.pascal_voc_2012 model.deeplabv3plus_resnet50 cudnn_flag=benchmark attack.minimal_pgd_linf dataset.num_images=100 save_adv=True

python attack_experiment.py -F exps with dataset.pascal_voc_2012 model.deeplabv3plus_resnet50 cudnn_flag=benchmark attack.minimal_pgd_linf attack.num_steps=10 attack.restarts=4 attack.relative_step_size=0.125 dataset.num_images=100 save_adv=True

python attack_experiment.py -F exps with dataset.pascal_voc_2012 model.deeplabv3plus_resnet50 cudnn_flag=benchmark attack.minimal_pgd_l2 dataset.num_images=100 save_adv=True

python attack_experiment.py -F exps with dataset.pascal_voc_2012 model.deeplabv3plus_resnet50 cudnn_flag=benchmark attack.minimal_pgd_l2 attack.num_steps=10 attack.restarts=4 attack.relative_step_size=0.125 dataset.num_images=100 save_adv=True