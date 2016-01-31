#
import sys
import fileinput as fi
import numpy as np

files = [f.rstrip('\n') for f in fi.input(sys.argv[1])]

for f in files:
    data = [line for line in fi.input(f)]
    
    head = data[:14] 
    data = data[14:]

    file_out = open(f[:-4] + 'ntrk', 'w')
    print f[:-4] + 'ntrk'
    for line in head:
        file_out.write('# ' + line)

    for i in range(0, len(data) - 6, 6):
        time_step = ''
        for j in range(6):
            time_step += data[i + j].rstrip('\n')
        dtrk = ''.join(time_step)
        dtrk.replace('\\n', '')
        
        file_out.write(dtrk + '\n')
    file_out.close()

#    cols = [x for x in range(30)]
#
#    new_data = np.genfromtxt(f[:-4] + 'ntrk', skiprows=14, usecols=tuple(cols))
#    new_iso  = np.empty((len(new_data), 12))
#    for i, time_step in enumerate(new_data):
#        new_iso[i, 0] = time_step[2]*1.0e9
#        new_iso[i, 1] = time_step[6]
#        new_iso[i, 2] = time_step[5]
#        new_iso[i, 3] = time_step[3]
#        new_iso[i, 4] = time_step[4]
#        new_iso[i, 5] = 1.0 - time_step[28] - time_step[29]
#        new_iso[i, 6] = time_step[29]
#        new_iso[i, 7] = time_step[12]/time_step[11]
#        new_iso[i, 8] = sum(time_step[13:17])/(3.846e33)
#        new_iso[i, 9] = time_step[17]/(3.846e33)
#        new_iso[i,10] = time_step[10]
#        new_iso[i,11] = 0.0
#
#    header_file = [line[2:] for line in fi.input(f[:-4] + 'trk') if line[0] == '#']
#    head = header_file[2] + header_file[3].rstrip('\n')
#    
#    np.savetxt(f[:-4] + 'niso', new_iso, fmt='%14.7e', header=head)
