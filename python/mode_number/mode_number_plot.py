#+
# Name: nti_wavelet_mode_number_fit_plot.py
#
# Written by: Borsi Marton 2016.09.20.
#
# Purpose: make plots of toroidal and poloidal mode numbers and their errors in different time-frequency points
#
# Calling function:
#	[] = nti_wavelet_mode_number_fit(toroidal_modes, poloidal_modes, global_error_matrix)
#
# Inputs:
#   toroidal_modes: 2D matrix for toroidal mode numbers in different time-frequency points                              (time x frequency)
#   poloidal_modes: 2D matrix for poloidal mode numbers in different time-frequency points                              (time x frequency)
#   global_error_matrix: 2D matrix for the errors of mode number fitting in different time-frequency points             (time x frequency)
#-



import math
import numpy
import matplotlib.pyplot


def plot_mode_number(toroidal_modes, poloidal_modes, global_error_matrix):


    toroidal_modes = numpy.rot90(toroidal_modes)
    poloidal_modes = numpy.rot90(poloidal_modes)
    global_error_matrix = numpy.rot90(global_error_matrix)




    matplotlib.pyplot.imshow(toroidal_modes, interpolation="nearest", aspect="auto")
    matplotlib.pyplot.colorbar()
    matplotlib.pyplot.xlabel('Time')
    matplotlib.pyplot.ylabel('Frequency')
    matplotlib.pyplot.title('Toroidal mode numbers')
    matplotlib.pyplot.show()

    matplotlib.pyplot.imshow(poloidal_modes, interpolation="nearest", aspect="auto")
    matplotlib.pyplot.colorbar()
    matplotlib.pyplot.xlabel('Time')
    matplotlib.pyplot.ylabel('Frequency')
    matplotlib.pyplot.title('Poloidal mode numbers')
    matplotlib.pyplot.show()

    matplotlib.pyplot.imshow(global_error_matrix, interpolation="nearest", aspect="auto")
    colorbar = matplotlib.pyplot.colorbar()
    colorbar.set_clim(0.5, 13)
    matplotlib.pyplot.xlabel('Time')
    matplotlib.pyplot.ylabel('Frequency')
    matplotlib.pyplot.title('Errors')
    matplotlib.pyplot.show()