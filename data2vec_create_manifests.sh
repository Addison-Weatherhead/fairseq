#!/bin/bash
#SBATCH --job-name=create_manifests
#SBATCH --output=./slurm_outputs/create_manifests.txt
#SBATCH --qos=m3
#SBATCH --mem=32G
#SBATCH --open-mode=truncate
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --gres=gpu:1

export PYTHONPATH="/h/addisonw/fairseq:${PYTHONPATH}"


#python examples/wav2vec/wav2vec_manifest.py /datasets/librispeech/ \
#    --dest /h/addisonw/fairseq/manifests/librispeech \
#    --ext flac \
#    --valid-percent 0.01



python examples/wav2vec/wav2vec_manifest.py /h/addisonw/fairseq/librispeech_finetuning/ \
    --dest /h/addisonw/fairseq/manifests/finetuning_data10h \
    --ext flac \
    --valid-percent 0.01



python examples/wav2vec/libri_labels.py manifests/finetuning_data10h/train.tsv \
    --output-dir /h/addisonw/fairseq/manifests/finetuning_data10h \
    --output-name train.ltr

python examples/wav2vec/libri_labels.py manifests/finetuning_data10h/valid.tsv \
    --output-dir /h/addisonw/fairseq/manifests/finetuning_data10h \
    --output-name valid.ltr
    