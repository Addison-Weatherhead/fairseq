#!/bin/bash
#SBATCH --job-name=train_data2vec
#SBATCH --output=./slurm_outputs/train_data2vec.txt
#SBATCH --qos=m3
#SBATCH --mem=32G
#SBATCH --open-mode=truncate
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --gres=gpu:1

export PYTHONPATH="/h/addisonw/fairseq:${PYTHONPATH}"

fairseq-hydra-train --config-dir examples/data2vec/config/v2 \
    --config-name base_audio_only_task \
    task.data=/h/addisonw/fairseq/manifests \
    distributed_training.distributed_world_size=1 \
    checkpoint.save_dir=/h/addisonw/fairseq/checkpoints