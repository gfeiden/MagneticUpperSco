#
import sys
import numpy as np
import fileinput as fi
from scipy.interpolate import Akima1DInterpolator as AkimaSpline
from scipy.interpolate import interp1d

files = [x.rstrip() for x in fi.input(sys.argv[1])]
fi.close()

ages = np.arange(5.0, 15.1, 0.5)*1.0e6
masses = []

for age in ages:
    print "Processing Age: {:07.1f} Myr".format(age/1.0e6)
    for f in files:
        try:
            # import age, log(Teff), log(g), log(L/Lo), log(R/Ro), N(Li), Mconv,env
            trk = np.genfromtxt(f, skiprows=100, usecols=(2, 6, 5, 3, 4, 56, 8))
        except (IOError, StopIteration):
            print "FAIL: {0}".format(f)
            continue        
        
        # convert ages to yr
        trk[:, 0] = trk[:, 0]*1.0e9

        # convert Li to A(Li)
        trk[:, 5] = np.log10(trk[:, 5]) + 12.0
        
        # interpolate to get properties at desired age 
        mass_index = f.rfind('/') + 2
        mass = float(f[mass_index:mass_index + 4])/1000.
        masses.append(mass)
        try:
            icurve = interp1d(trk[:, 0], trk[:, 1:], kind='linear', axis=0)
        except:
            continue
    
        props = icurve(age)
        props = np.append(mass, props)
    
        try:
            all_props = np.vstack((all_props, props))
        except NameError:
            all_props = props

    #icurve = AkimaSpline(all_props[:,0], all_props)
    #icurve = interp1d(all_props[:,0], all_props, axis=0, kind='cubic')
    #all_props = icurve(np.arange(min(masses), max(masses), 0.02))

    header  = 'Dartmouth Stellar Evolution Model: Quick Isochrone \n\n'
    header += 'Age = {:7.1f} Myr   [Fe/H] = {:+5.2f}   [a/Fe] = {:+5.2f} \n\n'.format(age/1.e6, 0.0, 0.0)
    header += '{:^14} {:^14} {:^14} {:^14} {:^14} {:^14} {:^14}'.format('Mass', 'log(Teff)', 'log(g)', 'log(L/Lo)', 
                                                                        'log(R/Ro)', 'A(Li)', 'Mconv,env')
    np.savetxt('./dmestar_{:07.1f}myr_z+0.00_a+0.00_phx_magBeq.iso'.format(age/1.e6), all_props, fmt='%14.7f', header=header)
    del all_props
