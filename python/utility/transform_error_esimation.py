import numpy as np
import scipy
import logging
import flap

# This command does not overwrite loggers, only needed at initialization
logging.basicConfig(filename='log.log',
                    filemode='w',
                    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
                    datefmt='%y.%b.%d. %H:%M:%S',
                    level=logging.INFO)
default_logger = logging.getLogger('convert_dict_to_flap')
default_logger.setLevel(logging.DEBUG)


def distribution_region_fit(transform, time_start=None, time_end=None, freq_start=None, freq_end=None,
                            coords=["Time", "Frequency"], fit_method=scipy.stats.rice.fit, logger=default_logger):
    # fits a (Rician) noise to the abs of a region of a linear (2d) transform (for eg. stft).
    # returns fit parameters
    # user should select a region where only white noise or stationary signal is present

    """ INPUT:
            transform:
                flap.Dataobject, containing a Time and a Frequency coordinate object (for eg. sets of STFTs)
            time_start,time_end,freq_start,freq_end:
                boundaries of the region where the Rice fit should be made
                (in the final unit, (for eg s and Hz))
                for getting back inexes, use flap's index_from_coordinate() function
            fit_method: The method used for fitting. The default is a Rice distribution
        Output:
            A list containing the fit parameters returned by fit_method, in the shape of the dataobject
            (one set for every time-freq axis pair, eg. one set for every STFT)
    """

    if transform.data is None:
        logger.error("Cannot do distribution fitting without data.", exc_info=True)

    t_axis = transform.get_coordinate_object(coords[0]).dimension_list
    if len(t_axis) > 1:
        logger.error("First (time) coordinate changes along several dimensions", exc_info=True)
    f_axis = transform.get_coordinate_object(coords[1]).dimension_list
    if len(f_axis) > 1:
        logger.error("Second (frequency) coordinate changes along several dimensions", exc_info=True)

    # Slicing the dataobject based on given fit boundaries
    # if a region parameter is None, the boundary should extend as much as it can
    if freq_start is None and freq_end is None and time_start is None and time_end is None:
        sliced = transform
        logger.debug('No slice, entire data will be used')
    elif freq_start is None and freq_end is None:
        sliced = transform.slice_data(slicing={coords[0]: flap.Intervals(time_start, time_end)})
        logger.debug('Only first (time) axis sliced')
    elif time_start is None and time_end is None:
        sliced = transform.slice_data(slicing={coords[1]: flap.Intervals(freq_start, freq_end)})
        logger.debug('Only second (frequency) axis sliced')
    else:
        sliced = transform.slice_data(slicing={coords[0]: flap.Intervals(time_start, time_end),
                                               coords[1]: flap.Intervals(freq_start, freq_end)})
        logger.debug('Both axes sliced')

    # putting the time and freq axes to the end (for the recursion)
    temp_data = np.swapaxes(sliced.data, t_axis[0], -1).swapaxes(f_axis[0], -2)
    logger.debug('Data array flattening, distribution fitting...')
    # This is where the actual fit happens
    fit_params = distribution_region_fit_recursive_helper(temp_data, fit_method, logger=logger)

    return fit_params


def distribution_region_fit_recursive_helper(data, fit_method, logger, params=[]):
    # this recursive helper does the fitting,
    # but for only the last two dimensions, they should be ordered at this point

    if len(data.shape) == 2:  # only the time and freq dimension remains
        tmp_params = fit_method(abs(data.flatten()))
        logger.debug('fitted one set of params')
        return tmp_params
    else:
        tmp_params = []
        for i in data:  # we reduce the dimensions w
            tmp_params.append(distribution_region_fit_recursive_helper(np.abs(i), fit_method=fit_method, logger=logger))
        return tmp_params


def get_ridge(stft, f_search_start=None, search_r=30, time_start=None, time_end=None, freq_start=None, freq_end=None,
              coords=["Time", "Frequency"], logger=default_logger):
    # returns a flap dataobject, with the maximum amplitudes
    # the non-equidistant frequency axis contains the frequency location of the peaks

    if len(stft.data.shape) != 2:
        logger.error("Get ridge currently only works with 2D data (with one channel, so use slicing)", exc_info=True)

    if freq_start is None and freq_end is None and time_start is None and time_end is None:
        stft = stft
        logger.debug('No slice, entire data will be used')
    elif freq_start is None and freq_end is None:
        stft = stft.slice_data(slicing={coords[0]: flap.Intervals(time_start, time_end)})
        logger.debug('Only first (time) axis sliced')
    elif time_start is None and time_end is None:
        stft = stft.slice_data(slicing={coords[1]: flap.Intervals(freq_start, freq_end)})
        logger.debug('Only second (frequency) axis sliced')
    else:
        stft = stft.slice_data(slicing={coords[0]: flap.Intervals(time_start, time_end),
                                        coords[1]: flap.Intervals(freq_start, freq_end)})
        logger.debug('Both axes sliced')

    if stft.get_coordinate_object(coords[0]).dimension_list[0] != 1:
        np.swapaxes(sliced.data, 1, 0)
        stft.get_coordinate_object(coords[0]).dimension_list[0] = 1
        stft.get_coordinate_object(coords[1]).dimension_list[0] = 0
        # the stft should only have 2 dimensions, Frequency and Time (in order)
    t_dim = 1

    if f_search_start == None:
        f_search_start = np.argmax(np.abs(stft.data[:, 0]))
    else:
        i_search_start = stft.index_from_coordinate(coords[1], f_search_start)

    ridgei = np.zeros(stft.data.shape[t_dim])
    ridgef = np.zeros(stft.data.shape[t_dim])
    ridge_amp = np.zeros(stft.data.shape[t_dim], dtype=complex)
    global_max = np.max(np.abs(stft.data))

    # search_area = np.abs(stft[f_search_start - include_r:f_search_start + include_r])
    ridgei[0] = np.argmax(np.abs(stft.data[:, 0]))
    ridge_amp[0] = stft.data[int(ridgei[0]), 0]
    ridgef[0] = stft.get_coordinate_object(coords[1]).start + stft.get_coordinate_object(coords[1]).step[0] * ridgei[0]
    for i in range(1, stft.data.shape[1]):
        i_min = max(ridgei[i - 1] - search_r, 0)
        i_max = min(ridgei[i - 1] + search_r, stft.data.shape[0])
        ridgei[i] = np.argmax(np.abs(stft.data[int(i_min):int(i_max), i])) + ridgei[i - 1] - search_r
        if ridgei[i] < global_max / 5:
            ridgei[i] = np.argmax(np.abs(stft.data[:, i]))
        ridgef[i] = stft.get_coordinate_object(coords[1]).start + stft.get_coordinate_object(coords[1]).step[0] * ridgei[i]
        ridge_amp[i] = stft.data[int(ridgei[i]), i]

    freq_ax = flap.Coordinate(name="Ridge Frequency",
                              unit="Hz",
                              mode=flap.CoordinateMode(equidistant=False),
                              values=ridgef,
                              dimension_list=[0],
                              shape=len(ridgef)
                              )
    ridge_obj = flap.DataObject(data_array=ridge_amp,
                                data_unit=flap.Unit(name='Ridge Amplitude', unit='a.u.'),
                                exp_id=stft.exp_id,
                                data_title="Ridge Amplitude",
                                coordinates=stft.coordinates,
                                data_shape=ridge_amp.shape)
    ridge_obj.del_coordinate(coords[1])
    ridge_obj.add_coordinate_object(freq_ax)
    ridge_obj.get_coordinate_object(coords[0]).dimension_list = [0]
    return ridge_obj


def rice_get_error_bars(shape, loc, scale):
    # scale is the sigma deviation of the 2D Gauss-distribution
    # returns the two ends of the error bar based on the appropriate percentile (+- 0.341)
    # so that when the distribution is approx. Gaussian, the error bars are +- sigma
    return scipy.stats.rice.ppf(0.5 + 0.341, shape, loc, scale), scipy.stats.rice.ppf(0.5 - 0.341, shape, loc, scale)


def rice_amp_to_mean(a, sigma, logger=default_logger):
    # a: amplitude parameter of Rice distribution (value or array-like)
    # sigma: sigma parameter of rice distribution
    # returns: the mean value(s) of Rice distribution(s) based on the given parameters
    if a.any() < 0:
        logger.error("Rice distribution amplitude is never negative.", exc_info=True)
    x_temp = -a * a / 2 / sigma ** 2
    return sigma * np.sqrt(np.pi / 2) * np.exp(x_temp / 2) * (
            (1 - x_temp) * scipy.special.iv(0, -x_temp / 2) - x_temp * scipy.special.iv(1, -x_temp / 2))


# helper variables for rice_mean_to_amp (the interpolation set) (sigma-independent)
amps = 2 ** np.linspace(start=-5, stop=5.7, num=200)
means_to_amp_interp = scipy.interpolate.interp1d(rice_amp_to_mean(amps, 1), amps * amps / 2, fill_value="extrapolate")


def rice_mean_to_amp(m, sigma):
    # m: mean of Rice distribution (value or array like)
    # returns: the amplitude value(s) of Rice distribution(s) based on the given parameters
    return np.sqrt(np.clip(means_to_amp_interp(m / sigma), 0, None) * 2 * sigma ** 2)  # sigma dependence added here
