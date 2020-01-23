# -*- coding: utf-8 -*-
"""
Created on Fri Dec  6 15:00:17 2019

@author: poloskei
"""
import numpy as np
import matplotlib.pyplot as plt

def calculateBicoherence(signal, timeax, blocksize, phaserandomized = False, debug = False):
    """Calculate the bicoherence matrix for a given signal.

    Inputs:
    signal -- measured 1D numpy array [n]/double
    timeax -- corresponding timeax in seconds [n]/double
    blocksize -- length of a single blocksize [1]/int
    
    phaserandomized -- boolean for phaserandomized calculations [1]/bool
    debug -- boolean for additional output (plotting and signal processing info) [1]/bool
    
    Outputs:
    freq -- frequency axis of the bicoherence matrix [blocksize/2]/int
    bicoherence_matrix -- 2D matrix containing bicoherence values [blocksize/2, blocksize/2]/double
    """
    
    n_signal = len(signal)
    n_block = int(n_signal/blocksize)
    
    if debug is True:
        print('Signal length / s : ', '{:.2f}'.format((timeax[-1]-timeax[0])))
        print('Blocksize: ', blocksize)
        print('Single block length / ms: ', '{:.2f}'.format((timeax[blocksize]-timeax[0])*1000))
        print('Number of blocks:', n_block)
    
    #Cut signal into smaller pieces, cut edge, remove mean.
    signal -= np.mean(signal)
    signal = np.reshape(signal[0:n_block*blocksize], [n_block,blocksize])
    timeax = timeax[0:blocksize]
    
    #Do FFT
    sp = np.fft.fft(signal)
    freq = np.fft.fftfreq(blocksize, d =(timeax[1]-timeax[0]))/1000. #Hz to kHz
    ind = np.where(freq >=0)
    freq = freq[ind]
    n_sp = len(freq)
    sp = sp[:,ind][:,0,:]
    dim = np.shape(sp)
    if phaserandomized is True:
        r = np.random.uniform(low = 0., high = 2*np.pi, size = (dim[0],dim[1]))
        expo = np.exp(1j*r)
        sp*=expo
    
    #Calculate bicoherence
    cross_term = np.zeros((n_block, n_sp, n_sp), dtype = complex)
    for i in range(n_block):
        cross_term[i,:,:] =  np.matmul(sp[i,:].reshape(-1,1), sp[i,:].reshape(1,-1))
        
    shift_term = np.zeros((n_block, n_sp, n_sp), dtype = complex)
    for i in range(n_block):
        for j in range(int(blocksize/2)):
            shift_term[i,j,:] = np.roll(sp[i,:], -(j+1))
    bispec = np.mean(cross_term*np.conj(shift_term), axis = 0)
    norm1 = np.sqrt(np.mean(np.abs(cross_term**2),axis = 0))
    norm2 = np.sqrt(np.mean(np.abs(shift_term**2),axis = 0))

    bicoherence_matrix = np.abs(bispec)/(norm1*norm2)
    
    if debug is True:
        lo = 6 #kHz
        hi = 10 #kHz
        ind = np.where((lo<freq) & (freq<hi))[0]
        fig = plt.figure()
        ax = fig.add_subplot(211)
        ax.plot(freq, np.mean(bicoherence_matrix[ind,:], axis = 0), color  = 'xkcd:black', label = str(lo)+' - '+str(hi)+' kHz')
        ax.set_xlabel('Frequency [kHz]')
        ax.set_ylabel('<b>')
        ax.legend()
        
        ax = fig.add_subplot(223)
        ax.plot(np.mean(np.abs(sp)**2, axis=0)/160000, freq)
        ax.set_xlabel('Amplitude [a.u.]')
        ax.set_ylabel('Frequency [kHz]')
        
        ax = fig.add_subplot(224)
        cm = ax.pcolormesh(freq,freq, bicoherence_matrix**0.2, alpha = 1.)
        ax.contour(freq,freq, bicoherence_matrix, colors = 'black', linewidths = 0.2)
        cbar = plt.colorbar(cm)
        cbar.set_label('Bicoherence')
        ax.plot(freq,freq, 'k--')
        ax.plot(freq,-freq+np.max(freq), 'k--')
        ax.set_xlabel('Frequency [kHz]')
        ax.set_ylabel('Frequency [kHz]')
        fig.tight_layout()
    return freq, bicoherence_matrix

def calculateBicoherenceSignificance(signal, timeax, blocksize, n_samples, debug = False):
    print("Sampling random bicoherence density function.")
    print("It might take a while.")
    freq, b = calculateBicoherence(signal, timeax, blocksize, False, False)
    dim_b = np.shape(b)
    b_dens_array = np.zeros((n_samples,dim_b[0], dim_b[1]))
    for i in range(n_samples):
        printProgressBar(i,n_samples)
        freq, b = calculateBicoherence(signal, timeax, blocksize, True, False)
        b_dens_array[i,:,:] = b
    return freq, b_dens_array

def filterBicoherenceMatrix(freq, bicoherence, bicoherence_density, alpha, debug = False):
    dim = np.shape(bicoherence_density)
    filtered_bicoherence = np.zeros_like(bicoherence)
    
    for i in range(dim[1]):
        for j in range(dim[2]):
            count = len(np.where(bicoherence[i,j] > bicoherence_density[:,i,j])[0])
            if count/dim[0] > alpha:
                filtered_bicoherence[i,j] = bicoherence[i,j]
    if debug is True:
        cmap=plt.cm.get_cmap('plasma')
        cmap.set_bad(color='white')
        masked_array = np.ma.masked_where(filtered_bicoherence == 0, filtered_bicoherence)
        
        fig = plt.figure(figsize=(12,6))
        ax = fig.add_subplot(121)
        cm = ax.pcolormesh(freq, freq,bicoherence**0.2, alpha = 1., vmin = 0., vmax = 1., cmap = cmap)
        ax.contour(freq, freq, bicoherence, colors = 'black', linewidths = 0.2)
        cbar = plt.colorbar(cm)
        cbar.set_label('Bicoherence')
        ax.plot(freq,freq, 'k--')
        ax.plot(freq,-freq+np.max(freq), 'k--')
        ax.set_xlabel('Frequency [kHz]')
        ax.set_ylabel('Frequency [kHz]')    
        
        ax = fig.add_subplot(122, sharex=ax, sharey=ax)
        cm = ax.pcolormesh(freq, freq, masked_array**0.2, alpha = 1., vmin = 0., vmax = 1., cmap = cmap)
        ax.contour(freq, freq, filtered_bicoherence, colors = 'black', linewidths = 0.2)
        cbar = plt.colorbar(cm)
        cbar.set_label('Filtered - bicoherence')
        ax.plot(freq,freq, 'k--')
        ax.plot(freq,-freq+np.max(freq), 'k--')
        ax.set_xlabel('Frequency [kHz]')
#        ax.set_ylabel('Frequency [kHz]')
        fig.tight_layout()
    return filtered_bicoherence

def printProgressBar(iteration, total, prefix = '', suffix = '', decimals = 1, length = 100, fill = '█', printEnd = "\r"):
    """
    Call in a loop to create terminal progress bar
    @params:
        iteration   - Required  : current iteration (Int)
        total       - Required  : total iterations (Int)
        prefix      - Optional  : prefix string (Str)
        suffix      - Optional  : suffix string (Str)
        decimals    - Optional  : positive number of decimals in percent complete (Int)
        length      - Optional  : character length of bar (Int)
        fill        - Optional  : bar fill character (Str)
        printEnd    - Optional  : end character (e.g. "\r", "\r\n") (Str)
    """
    percent = ("{0:." + str(decimals) + "f}").format(100 * (iteration / float(total)))
    filledLength = int(length * iteration // total)
    bar = fill * filledLength + '-' * (length - filledLength)
    print('\r%s |%s| %s%% %s' % (prefix, bar, percent, suffix), end = printEnd)
    # Print New Line on Complete
    if iteration == total: 
        print()

if __name__ == '__main__':
    # simple test cas for the runs
    plt.close('all')
    # setup a signal which shows bicoherence
    n = 80000
    t = np.linspace(0,0.8,n)
    dt = t[1]-t[0]
    A1 = 5
    A2 = 5
    w1 = 30e3
    w2 = 38e3
    w3 = 8e3
    x = 10*np.random.rand(n) + A1*np.sin(2*np.pi*w1*t) + A2*np.sin(2*np.pi*w2*t) +  5*np.sin(2*np.pi*w3*t)
#    print(1/dt/1000., ' kHz')
    n = 200 # number of samples drawn from the local (f1,f2) random bicoherence density function
    blocksize = 2**9
    f, b = calculateBicoherence(x,t,blocksize,False,True)
#    _f, b_dens = calculateBicoherenceSignificance(x,t,blocksize,n)
    filtered_b = filterBicoherenceMatrix(f, b, b_dens, 0.995, True)