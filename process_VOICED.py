import numpy as np
from scipy.io.wavfile import write

lens = []
def txt_to_wav(txt_file, wav_file):
    # Read the float values from the text file
    with open(txt_file, 'r') as file:
        audio_data = [float(line.strip()) for line in file]
        lens.append(len(audio_data))
    write(wav_file, 8000, np.array(audio_data, dtype=np.float32))

def txt_to_np(txt_file):
    # Read the float values from the text file
    with open(txt_file, 'r') as file:
        return np.array([float(line.strip()) for line in file], dtype=np.float32)
    
np_arrs = []
for i in range(1, 209):
    i_str = str(i).zfill(3)
    txt_to_wav('voice-icar-federico-ii-database-1.0.0/voice%s.txt'%i_str, 'processed_VOICED/wavs/voice%s.wav'%i_str)
    np_arrs.append(txt_to_np('voice-icar-federico-ii-database-1.0.0/voice%s.txt'%i_str))

np.savez('processed_VOICED/np_arrays/voice.npz', np.array(np_arrs, dtype=object), allow_pickle=True)                 

print('Min len: ', min(lens))
print('Max len: ', max(lens))