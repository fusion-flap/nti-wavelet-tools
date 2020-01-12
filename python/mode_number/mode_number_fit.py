#+
# Name: nti_wavelet_mode_number_fit.py
#
# Written by: Borsi Marton 2016.09.01.
#
# Purpose: Calculate toroidal and poloidal modenumbers simultaneously.
#
# Calling function:
#	[toroidal_modes, toroidal_errors, poloidal_modes, poloidal_errors] = nti_wavelet_mode_number_fit(time_freq_matrix, probe_pos_diff, tor_min, tor_max, pol_min, pol_max)
#
# Inputs:
#       time-freq_matrix: 3D matrix contianing the phase difference in every time-frequency point for each probe pair      (probe pair x time x frequency)
#		chpos: 2D array for toroidal and poloidal position for each probe 				                                   (2xN)
#       toroidal_mode_range: upper and lower limits of toroidal mode                                                       (2 x int)
#       poloidal_mode_range: upper and lower limits of poloidal mode                                                       (2 x int)
#       toroidal_mode_step:                                                                                                (int)
#       poloidal_mode_step:                                                                                                (int)
# Outputs:
#       toroidal_modes: 2D matrix, toroidal modes in every time-frequency point                                            (time x frequency)
#       poloidal_modes: 2D matrix, poloidal modes in every time-frequency point                                            (time x frequency)
#       global_error_matrix: 2D matrix, errors of poloidal modes in every time-frequency point                             (time x frequency)
#-



import math
import cmath
import numpy


def fit_mode_number(chpos, time_freq_matrix, toroidal_mode_range=[-10, 10], poloidal_mode_range=[-10, 10],
                    toroidal_mode_step=1, poloidal_mode_step=1):


    # calculating the toroidal and poloidal position differences for every probe pair
    tor_pos_diff = []  # contains the toroidal probe position differences
    pol_pos_diff = []  # contains the poloidal probe position differences
    pos_diff_tmp = 0  # contains position difference temporarily

    for i in range(len(chpos[0])):
        for j in range(i + 1, len(chpos[0])):

            pos_diff_tmp = chpos[0, i] - chpos[0, j]
            if (pos_diff_tmp < 0):
                pos_diff_tmp = pos_diff_tmp + 2 * math.pi
            tor_pos_diff.append(pos_diff_tmp)

            pos_diff_tmp = chpos[1, i] - chpos[1, j]
            if (pos_diff_tmp < 0):
                pos_diff_tmp = pos_diff_tmp + 2 * math.pi
            pol_pos_diff.append(pos_diff_tmp)

    # putting the mode number ranges into single integers (from 2x1 array)
    tor_min = toroidal_mode_range[0]
    tor_max = toroidal_mode_range[1]
    pol_min = poloidal_mode_range[0]
    pol_max = poloidal_mode_range[1]

    # changing the maxima according to the mode steps
    tor_step = toroidal_mode_step
    pol_step = poloidal_mode_step

    tor_max = int((tor_max - tor_min) / tor_step) * tor_step + tor_min
    pol_max = int((pol_max - pol_min) / pol_step) * pol_step + pol_min

    # creating the matrices to contain the mode numbers and their errors in every time-frequency point
    toroidal_modes = numpy.empty([int( len(time_freq_matrix[0]) ), int(len(time_freq_matrix[0, 0]) )])
    poloidal_modes = numpy.empty([int( len(time_freq_matrix[0]) ), int(len(time_freq_matrix[0, 0]) )])
    global_error_matrix = numpy.empty([int( len(time_freq_matrix[0]) ), int(len(time_freq_matrix[0, 0]) )])


    # calculating the optimal mode numbers in every time-frequency point

    for l in range(int( len(time_freq_matrix[0]) )):  # l: time
        for m in range(int(len(time_freq_matrix[0][0]) )):  # m: frequency



            # copying the phase differences of the current time-frequency point to a 1D array

            phase_diff = []
            for i in range(len(time_freq_matrix)):
                phase_diff.append(time_freq_matrix[i][l][m])

                # calculating errors in case of every possible toroidal-poloidal mode number pair

                error_matrix = numpy.empty([int((tor_max - tor_min) / tor_step + 1), int((pol_max - pol_min) / pol_step + 1)])
                # contains the errors for every toroidal-poloidal mode number pair (coordinate system-like: x-pol, y-tor)
            calc_phase_diff = 0  # the ideal phase difference, calculated for every probe pair and every mode number pair
            error = 0  # error sum for the current toroidal-poloidal mode number pair
            diff = 0  # error of the current probe pair

            for i in range(int((tor_max - tor_min) / tor_step + 1)):  # i:toroidal mode
                for j in range(int((pol_max - pol_min) / pol_step + 1)):  # j:poloidal mode
                    for k in range(len(pol_pos_diff)):  # summing the errors of every probe pair

                        # calculated phase_difference
                        calc_phase_diff = ((tor_min + i * tor_step) * tor_pos_diff[k] + (pol_min + j * pol_step) *
                                           pol_pos_diff[k]) % (2 * math.pi)

                        # difference between the measured and calculated differences
                        diff = abs(phase_diff[k] - calc_phase_diff)
                        if diff > math.pi:
                            diff = 2 * math.pi - diff

                        error = error + diff ** 2

                    error_matrix[int((tor_max - tor_min) / tor_step - i), j] = (math.sqrt(error))
                    error = 0

            # searching for minimal error in the error matrix in order to determine the optimal toroidal-poroidal number pair

            min_error = error_matrix[0][0]
            tor_mode = tor_min
            pol_mode = pol_min
            for i in range(int((tor_max - tor_min) / tor_step + 1)):  # i: toroidal mode
                for j in range(int((pol_max - pol_min) / pol_step + 1)):  # j:poloidal mode
                    if error_matrix[int((tor_max - tor_min) / tor_step - i)][j] < min_error:
                        min_error = error_matrix[int((tor_max - tor_min) / tor_step - i)][j]
                        tor_mode = (tor_min + i * tor_step)
                        pol_mode = (pol_min + j * pol_step)

            # copying the mode numbers and the errors into the proper time-frequency matrices

            toroidal_modes[l, m] = tor_mode
            poloidal_modes[l, m] = pol_mode
            global_error_matrix[l, m] = min_error

    return (toroidal_modes, poloidal_modes, global_error_matrix)