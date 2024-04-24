#!/bin/bash
#SBATCH --job-name=train_data2vec
#SBATCH --output=./fairseq/slurm_outputs/train_data2vec.txt
#SBATCH --qos=m3
#SBATCH --mem=32G
#SBATCH --open-mode=truncate
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --gres=gpu:1

python fairseq_cli/hydra_train.py -m --config-dir examples/data2vec/config/audio/pretraining \
--config-name base_librispeech task.data=/path/to/manifests common.user_dir=examples/data2vec