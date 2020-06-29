import flap
import logging

# This command does not overwrite loggers, only needed at initialization
logging.basicConfig(filename='log.log',
                    filemode='w',
                    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
                    datefmt='%y.%b.%d. %H:%M:%S',
                    level=logging.INFO)
default_logger = logging.getLogger('convert_dict_to_flap')
default_logger.setLevel(logging.DEBUG)

def convert_raw(input_dict, skip_keys=[], create_channel_no=False, logger = default_logger):
    # input_dict: a NTI wavelet tools sav file loaded as a python dictionary,
    # preferably loaded with the io.readsav command

    # skip_keys: list of strings, which keys to skip when creating coordinate axes in addition to:
    # "data", "expname", "shotnumber", "data_history", "coord_history",

    # and returns a flap.DataObject
    if type(input_dict) is not dict:
        raise TypeError('loaded_sav is not a dictionary')

    coordinates = []

    # planned? feature: non-equidistant time axis
    if "timeax" in input_dict and "timeax" not in skip_keys:
        time_ax = flap.Coordinate(name="Time",
                                  unit="s",
                                  mode=flap.CoordinateMode(equidistant=True),
                                  start=input_dict["timeax"][0],
                                  step=(input_dict["timeax"][-1] - input_dict["timeax"][0]) / len(input_dict["timeax"]),
                                  # values=loaded_sav["timeax"]
                                  dimension_list=[1]
                                  )
        coordinates.append(time_ax)
        logger.debug('Time axis created')

    if "channels" in input_dict and "channels" not in skip_keys:
        channel_name = flap.Coordinate(name="Channels",
                                       unit=None,
                                       mode=flap.CoordinateMode(equidistant=False),
                                       values=input_dict["channels"],
                                       dimension_list=[0],
                                       shape=len(input_dict["channels"])
                                       )
        coordinates.append(channel_name)
        logger.debug('Channels axis created')

        if create_channel_no:
            channel_no = flap.Coordinate(name="Channel_no",
                                         unit="no",
                                         mode=flap.CoordinateMode(equidistant=True),
                                         start=0,
                                         step=1,
                                         dimension_list=[0]
                                         )
            coordinates.append(channel_no)
            logger.debug('Channel number axis created')

    if "theta" in input_dict and "theta" not in skip_keys:
        theta_ax = flap.Coordinate(name="Theta",
                                   unit="rad",
                                   mode=flap.CoordinateMode(equidistant=False),
                                   values=input_dict["theta"],
                                   dimension_list=[0],
                                   shape=len(input_dict["theta"])
                                   )
        coordinates.append(theta_ax)
        logger.debug('Theta axis created')

    if "phi" in input_dict and "phi" not in skip_keys:
        phi_ax = flap.Coordinate(name="Phi",
                                 unit="rad",
                                 mode=flap.CoordinateMode(equidistant=False),
                                 values=input_dict["phi"],
                                 dimension_list=[0],
                                 shape=len(input_dict["phi"])
                                 )
        coordinates.append(phi_ax)
        logger.debug('Phi axis created')

    logger.info('All axes created')
    flap_object = flap.DataObject(
        data_array=input_dict['data'],
        data_unit=flap.Unit(name='voltage', unit='volt'),
        exp_id=str(input_dict['expname'])[2:-1] + " " + str(input_dict['shotnumber']),
        coordinates=coordinates,
        data_shape=input_dict['data'].shape,
    )
    logger.info('Flap object created and filled')

    flap_object.history = [input_dict["data_history"], input_dict["coord_history"]]

    return flap_object
