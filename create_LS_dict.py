import json

with open('librispeech_finetuning/phones/phones_mapping.json', 'r') as file:
    phoneme_map = json.load(file)

with open('/h/addisonw/fairseq/manifests/finetuning_data10h/dict.ltr.txt', 'w') as file:
    entries = [f"{phoneme} {index}" for phoneme, index in phoneme_map.items()]
    file.write("\n".join(entries))

