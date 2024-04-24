#!/bin/bash
#SBATCH --job-name=data2vec_finetune_LS_gaussianNoise
#SBATCH --output=./slurm_outputs/data2vec_finetune_LS_gaussianNoise.txt
#SBATCH --qos=m3
#SBATCH --mem=32G
#SBATCH --open-mode=truncate
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --gres=gpu:4
#SBATCH --time=02:30:00

export PYTHONPATH="/h/addisonw/fairseq:${PYTHONPATH}"
export HYDRA_FULL_ERROR=1 # full stack trace

srun python fairseq_cli/hydra_train.py -m \
    --config-dir examples/wav2vec/config/finetuning \
    --config-name nD2V_gaussianNoise \
    distributed_training.distributed_world_size=4 \
    +trainer.tensorboard_logdir=/h/addisonw/fairseq/logs/tb/ \
    task.data=/h/addisonw/fairseq/manifests/finetuning_data10h \
    model.w2v_path=/h/addisonw/fairseq/pretrained_models/base_libri.pt \
    common.user_dir=examples/data2vec 


    