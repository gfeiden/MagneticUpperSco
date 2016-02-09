#
#
import numpy as np

w = 1.0
N = 20.0
M = 4.0
N_Samples = 10000

#data = np.genfromtxt('usco_AFG.txt')
data = np.genfromtxt('tmp.txt')

end0 = min(data[:,2])
end1 = max(data[:,2])

# grid up
distance = end1 - end0
division = distance/N

centers = np.arange(end0, end1 + division, division/M)

print "Total Points: ", len(data)

fout = open('usco_emp_hrd.txt', 'w')

print len(centers), division, w*division
np.random.seed()
for center in centers:
    logL_pdf = np.empty((N_Samples))
    for i in range(N_Samples):
        # collapse data array
        in_bin = [(center - w*division) <= np.random.normal(x[2], x[3]) < (center + w*division) for x in data]
        data_in_bin = np.compress(in_bin, data, axis=0)
        
        if len(data_in_bin) < 3:
            continue
        
        # bootstrap resample
        selection = np.random.randint(0, len(data_in_bin), size=len(data_in_bin))
        new_sample = np.array([data_in_bin[x] for x in selection])
        
        # bootstrap with uncertainties
        logL = np.array([np.random.normal(x[4], x[5]) for x in new_sample])
        logL_pdf[i] = np.median(logL)
    
    if len(data_in_bin) < 3:
        continue
    else:
        print center, "N_bin =", len(data_in_bin)
    logL = np.percentile(logL_pdf, 50.0)
    logL_minus = np.percentile(logL_pdf, 0.5)
    logL_plus  = np.percentile(logL_pdf, 99.5)    

    fout.write("{:12.6f} {:12.6f} {:12.6f} {:12.6f}\n".format(center, logL, logL_minus, logL_plus))

fout.close()
