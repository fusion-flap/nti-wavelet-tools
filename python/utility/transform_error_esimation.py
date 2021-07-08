import numpy as np
import scipy
import logging

# This command does not overwrite loggers, only needed at initialization
logging.basicConfig(filename='log.log',
                    filemode='w',
                    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
                    datefmt='%y.%b.%d. %H:%M:%S',
                    level=logging.INFO)
default_logger = logging.getLogger('convert_dict_to_flap')
default_logger.setLevel(logging.DEBUG)

def distribution_region_fit(transform, time_start=None, time_end=None, freq_start=None, freq_end=None,
                            coords=["Time", "Frequency"], fit_method=scipy.stats.rice.fit):
    # fits a (Rician) noise to the abs of a region of a linear (2d) transform (for eg. stft).
    # returns fit parameters
    # user should select a region where only white noise or stationary signal is present

    """ INPUT:
            transform: flap.Dataobject, containing a Time and a Frequency coordinate object
            f1,f2,t1,t2: boundaries of the region where the Rice fit should be made
                         (in the final unit, (for eg s and Hz))
                         for getting back inexes, use flap's index_from_coordinate() function
            fit_method = The method used for fitting. The default is a Rice distribution
    """

    if transform.data is None:
        logger.error("Cannot do distribution fitting without data.", exc_info=True)


    # if a region parameter is None, the boundary should extend as much as it can
    if freq_start is None and freq_end is None and time_start is None and time_end is None:
        sliced = transform
        logger.debug('No slice, entire data will be used')
    elif freq_start is None and freq_end is None:
        sliced = transform.slice_data(slicing={coords[0]:flap.Intervals(time_start, time_end)})
        logger.debug('Only first (time) axis sliced')
    elif time_start is None and time_end is None:
        sliced = transform.slice_data(slicing={coords[1]:flap.Intervals(freq_start, freq_end)})
        logger.debug('Only second (frequency) axis sliced')
    else:
        sliced = transform.slice_data(slicing={coords[0]:flap.Intervals(time_start, time_end),
                                               coords[1]:flap.Intervals(freq_start, freq_end)})
        logger.debug('Both axes sliced')



    # This is where the actual fit happens
    fit_params=[]
    amplitude = np.abs(sliced.data).flatten() # currently flattens the entire (sliced) object
    logger.debug('Data array flattened, distribution fitting...')
    fit_params.append(fit_method(amplitude))

    return fit_params
