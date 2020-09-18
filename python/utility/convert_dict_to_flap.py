import flap
import logging
from itertools import compress
import numpy as np
import copy

# This command does not overwrite loggers, only needed at initialization
logging.basicConfig(filename='log.log',
                    filemode='w',
                    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
                    datefmt='%y.%b.%d. %H:%M:%S',
                    level=logging.INFO)
default_logger = logging.getLogger('convert_dict_to_flap')
default_logger.setLevel(logging.DEBUG)


def convert_raw_sav_og(input_dict, logger=default_logger, equidistant_time=False):
    # input_dict: a NTI wavelet tools sav file loaded as a python dictionary,
    # preferably loaded with the io.readsav command
    raw_data = None
    coordinates = []
    exp_id = input_dict['expname'].decode('utf-8') + "-" + str(input_dict['shotnumber'])

    try:
        if equidistant_time:
            time_ax = flap.Coordinate(name="Time",
                                      unit="s",
                                      mode=flap.CoordinateMode(equidistant=True),
                                      start=input_dict["timeax"][0],
                                      step=(input_dict["timeax"][-1] - input_dict["timeax"][0]) /
                                           len(input_dict["timeax"]),
                                      dimension_list=[1],
                                      shape=len(input_dict['timeax'])
                                      )
        else:
            time_ax = flap.Coordinate(name="Time",
                                      unit="s",
                                      mode=flap.CoordinateMode(equidistant=False),
                                      values=input_dict['timeax'],
                                      dimension_list=[1],
                                      shape=len(input_dict['timeax'])
                                      )
        coordinates.append(time_ax)
        logger.debug('Time axis created')
    except:
        logger.debug('Time axis does not exist.')

    try:
        temp = []
        for item in input_dict['channels']:
            temp.append(item.decode('utf-8'))
        channel_name = flap.Coordinate(name="Channels",
                                       unit=None,
                                       mode=flap.CoordinateMode(equidistant=False),
                                       values=temp,
                                       dimension_list=[0],
                                       shape=len(temp)
                                       )
        coordinates.append(channel_name)
        logger.debug('Channels axis created')
    except:
        logger.debug('Channel axis does not exist.')

    try:
        theta_ax = flap.Coordinate(name="Theta",
                                   unit="rad",
                                   mode=flap.CoordinateMode(equidistant=False),
                                   values=input_dict["theta"],
                                   dimension_list=[0],
                                   shape=len(input_dict["theta"])
                                   )
        coordinates.append(theta_ax)
        logger.debug('Theta axis created')
    except:
        logger.debug('Theta axis does not exist.')

    try:
        phi_ax = flap.Coordinate(name="Phi",
                                 unit="rad",
                                 mode=flap.CoordinateMode(equidistant=False),
                                 values=input_dict["phi"],
                                 dimension_list=[0],
                                 shape=len(input_dict["phi"])
                                 )
        coordinates.append(phi_ax)
        logger.debug('Phi axis created')
    except:
        logger.debug('Phi axis does not exist.')

    if coordinates != []:
        raw_data = flap.DataObject(
            data_array=input_dict['data'],
            data_unit=flap.Unit(name='unit', unit='a.u.'),
            exp_id=exp_id,
            coordinates=coordinates,
            data_shape=input_dict['data'].shape,
        )
        logger.info('Flap object created and filled')
        raw_data.history = [input_dict["data_history"].decode('utf-8'), input_dict["coord_history"].decode('utf-8')]
    return raw_data


def transform_parameters_empty():
    dy = {}
    dy['transf_selection'] = None
    dy['transf_cwt_selection'] = None
    dy['transf_cwt_family'] = None
    dy['transf_cwt_order'] = None
    dy['transf_cwt_dscale'] = None
    dy['transf_stft_selection'] = None
    dy['transf_stft_window'] = None
    dy['transf_stft_length'] = None
    dy['transf_stft_fres'] = None
    dy['transf_stft_step'] = None
    dy['transf_freq_min'] = None
    dy['transf_freq_max'] = None
    dy['transf_freq_resdatapoints'] = None
    dy['crosstr_selection'] = None
    dy['crosstr_correction_selection'] = None
    dy['coh_selection'] = None
    dy['coh_avg'] = None
    dy['transfer_selection'] = None
    dy['mode_selection'] = None
    dy['mode_type'] = None
    dy['mode_filter'] = None
    dy['mode_optimized'] = None
    dy['mode_steps'] = None
    dy['mode_min'] = None
    dy['mode_max'] = None
    return dy


def convert_processed_sav_og(input_dict, logger=default_logger):
    raw_data = None
    transforms = None
    smoothed_apsds = None  # not used yet, not implemented
    crosstransforms = None  # not used yet, not implemented
    smoothed_crosstransforms = None  # not used yet, not implemented
    transfers = None  # not used yet, not implemented
    coherences = None
    modenumbers = None
    qs = None
    transform_parameters = transform_parameters_empty()
    try:  # presumably this will need some renaming, and making it consistent with the GUI layout naming
        transform_parameters['transf_selection'] = input_dict['saved_datablock']['proc_transf_selection'][0]
        transform_parameters['transf_cwt_selection'] = input_dict['saved_datablock']['proc_transf_cwt_selection'][0]
        transform_parameters['transf_cwt_family'] = input_dict['saved_datablock']['proc_transf_cwt_family'][0].decode(
            'utf-8')
        transform_parameters['transf_cwt_order'] = input_dict['saved_datablock']['proc_transf_cwt_order'][0]
        transform_parameters['transf_cwt_dscale'] = input_dict['saved_datablock']['proc_transf_cwt_dscale'][0]
        transform_parameters['transf_stft_selection'] = input_dict['saved_datablock']['proc_transf_cwt_dscale'][0]

        transform_parameters['transf_stft_window'] = input_dict['saved_datablock']['proc_transf_stft_window'][0].decode(
            'utf-8')
        transform_parameters['transf_stft_length'] = input_dict['saved_datablock']['proc_transf_stft_length'][0]
        transform_parameters['transf_stft_fres'] = input_dict['saved_datablock']['proc_transf_stft_fres'][0]
        transform_parameters['transf_stft_step'] = input_dict['saved_datablock']['proc_transf_stft_step'][0]
        transform_parameters['transf_freq_min'] = input_dict['saved_datablock']['proc_transf_freq_min'][0]
        transform_parameters['transf_freq_max'] = input_dict['saved_datablock']['proc_transf_freq_max'][0]
        transform_parameters['transf_freq_resdatapoints'] = \
            input_dict['saved_datablock']['proc_transf_freq_resdatapoints'][0]

        transform_parameters['crosstr_selection'] = input_dict['saved_datablock']['proc_crosstr_selection'][0]
        transform_parameters['crosstr_correction_selection'] = \
            input_dict['saved_datablock']['proc_crosstr_correction_selection'][0]

        transform_parameters['coh_selection'] = input_dict['saved_datablock']['proc_coh_selection'][0]
        transform_parameters['coh_avg'] = input_dict['saved_datablock']['proc_coh_avg'][0]

        transform_parameters['transfer_selection'] = input_dict['saved_datablock']['proc_transfer_selection'][0]

        transform_parameters['mode_selection'] = input_dict['saved_datablock']['proc_mode_selection'][0]
        transform_parameters['mode_type'] = input_dict['saved_datablock']['proc_mode_type'][0].decode('utf-8')
        transform_parameters['mode_filter'] = input_dict['saved_datablock']['proc_transf_cwt_dscale'][0]
        transform_parameters['mode_optimized'] = input_dict['saved_datablock']['proc_mode_optimized'][0]
        transform_parameters['mode_steps'] = input_dict['saved_datablock']['proc_mode_steps'][0]
        transform_parameters['mode_min'] = input_dict['saved_datablock']['proc_mode_min'][0]
        transform_parameters['mode_max'] = input_dict['saved_datablock']['proc_mode_max'][0]
    except:
        pass

    raw_data_axes = []
    transform_axes = []
    cross_transform_axes = []
    modenumber_axes = []
    exp_id = input_dict['saved_datablock']['expname'][0].decode('utf-8') + "-" + str(
        input_dict['saved_datablock']['shotnumber'][0])
    ####### raw data load #######
    try:
        time_ax = flap.Coordinate(name="Time",
                                  unit="s",
                                  mode=flap.CoordinateMode(equidistant=False),
                                  values=input_dict['saved_datablock']['time'][0],
                                  dimension_list=[1],
                                  shape=len(input_dict['saved_datablock']['time'][0])
                                  )
        raw_data_axes.append(time_ax)
        logger.debug('Time axis created')
    except:
        logger.debug('Time axis does not exist.')
    try:
        channel_ax = flap.Coordinate(name="Channels",
                                     unit=None,
                                     mode=flap.CoordinateMode(equidistant=False),
                                     values=input_dict['saved_datablock']["channels"][0].astype('U20'),
                                     # max 20 long string!
                                     dimension_list=[0],
                                     shape=len(input_dict['saved_datablock']["channels"][0])
                                     )
        raw_data_axes.append(channel_ax)
        logger.debug('Channels axis created')
    except:
        logger.debug('Channels do not exist.')
    try:
        theta_ax = flap.Coordinate(name="Theta",
                                   unit="rad",
                                   mode=flap.CoordinateMode(equidistant=False),
                                   values=input_dict['saved_datablock']["theta"][0],
                                   dimension_list=[0],
                                   shape=len(input_dict['saved_datablock']["theta"][0])
                                   )
        raw_data_axes.append(theta_ax)
        logger.debug('Theta axis created')
    except:
        logger.warning('Theta axis does not exist!')

    try:
        phi_ax = flap.Coordinate(name="Phi",
                                 unit="rad",
                                 mode=flap.CoordinateMode(equidistant=False),
                                 values=input_dict['saved_datablock']["phi"][0],
                                 dimension_list=[0],
                                 shape=len(input_dict['saved_datablock']["phi"][0])
                                 )
        raw_data_axes.append(phi_ax)
        logger.debug('Phi axis created')
    except:
        logger.warning('Phi axis does not exist!')

    try:
        raw_data = flap.DataObject(
            data_array=input_dict['saved_datablock']["data"][0],
            data_unit=flap.Unit(name='unit', unit='a.u.'),
            exp_id=exp_id,
            coordinates=raw_data_axes,
            data_shape=input_dict['saved_datablock']['data'][0].shape,
        )
        logger.debug('Data dataobject created')
    except:
        logger.warning('Data dataobject does not exist!')
    ########################   

    try:
        transf_timeax = flap.Coordinate(name="Transf_timeax",
                                        unit="s",
                                        mode=flap.CoordinateMode(equidistant=False),
                                        values=input_dict['saved_datablock']["transf_timeax"][0],
                                        dimension_list=[1],
                                        shape=len(input_dict['saved_datablock']["transf_timeax"][0])
                                        )
        transform_axes.append(transf_timeax)
        cross_transform_axes.append(transf_timeax)
        modenumber_axes.append(transf_timeax)
        logger.debug('Transform time axis created')
    except:
        logger.warning('Transform time axis does not exist!')

    try:
        transf_freqax = flap.Coordinate(name="Transf_freqax",
                                        unit="kHz",
                                        mode=flap.CoordinateMode(equidistant=True),
                                        values=input_dict['saved_datablock']["transf_freqax"][0],
                                        dimension_list=[1],
                                        shape=len(input_dict['saved_datablock']["transf_freqax"][0])
                                        )
        transform_axes.append(transf_freqax)
        cross_transform_axes.append(transf_freqax)
        modenumber_axes.append(transf_freqax)
        logger.debug('Transform time axis created')
    except:
        logger.warning('Transform time axis does not exist!')

    try:
        _temp = []
        for i in range(len(input_dict['saved_datablock']["channels"][0])):
            if input_dict['saved_datablock']['channels_ind'][0][i] == 1:
                _temp.append(input_dict['saved_datablock']["channels"][0][i].decode('utf-8'))
        selectedChannels = flap.Coordinate(name="Selected_channels",
                                           unit=None,
                                           mode=flap.CoordinateMode(equidistant=False),
                                           values=_temp,
                                           dimension_list=[1],
                                           shape=len(_temp)
                                           )
        transform_axes.append(selectedChannels)
        cross_transform_axes.append(selectedChannels)
        modenumber_axes.append(selectedChannels)
        logger.debug('Selected channels set.')
    except:
        logger.warning('Something went wrong with the selected channels')

    try:
        transforms = flap.DataObject(
            data_array=input_dict['saved_datablock']['transforms'][0],
            data_unit=flap.Unit(name='unit', unit='a. u.'),
            exp_id=exp_id,
            coordinates=transform_axes,
            data_shape=input_dict['saved_datablock']['transforms'][0].shape,
        )
        logger.debug('Transforms dataobject created')
    except:
        logger.warning('Transforms dataobject does not exist!')

    try:
        coherences = flap.DataObject(
            data_array=input_dict['saved_datablock']['coherences'][0],
            data_unit=flap.Unit(name='coherence', unit=' '),
            exp_id=exp_id,
            coordinates=transform_axes,
            data_shape=input_dict['saved_datablock']['coherences'][0].shape,
        )
        logger.debug('Transforms dataobject created')
    except:
        logger.warning('Transforms dataobject does not exist!')

    try:
        qs = flap.DataObject(
            data_array=input_dict['saved_datablock']['qs'][0],
            data_unit=flap.Unit(name='unit', unit='a. u.'),
            exp_id=exp_id,
            coordinates=transform_axes,
            data_shape=input_dict['saved_datablock']['qs'][0].shape,
        )
        logger.debug('qs dataobject created')
    except:
        logger.warning('qs dataobject does not exist!')

    try:
        modenumbers = flap.DataObject(
            data_array=input_dict['saved_datablock']['modenumbers'][0],
            data_unit=flap.Unit(name='modenumber', unit='a. u.'),
            exp_id=exp_id,
            coordinates=transform_axes,
            data_shape=input_dict['saved_datablock']['modenumbers'][0].shape,
        )
        logger.debug('modenumber dataobject created')
    except:
        logger.warning('modenumber dataobject does not exist!')
    ###### load transform parameters #####

    return raw_data, transforms, smoothed_apsds, crosstransforms, smoothed_crosstransforms, coherences, \
           transfers, modenumbers, qs, transform_parameters


def convert_processed_sav(input_dict, skip_keys=[], logger=default_logger):
    # input_dict: a NTI wavelet tools processed sav file loaded as a python dictionary,
    # preferably loaded with the io.readsav command

    # skip_keys: list of strings, which keys to skip when creating coordinate axes
    # print(input_dict)

    raw_data_axes = []
    transform_axes = []
    cross_transform_axes = []
    modenumber_axes = []

    if "time" in input_dict and "time" not in skip_keys:
        time_ax = flap.Coordinate(name="Time",
                                  unit="s",
                                  mode=flap.CoordinateMode(equidistant=False),
                                  values=input_dict["time"],
                                  dimension_list=[1],
                                  shape=len(input_dict["time"])
                                  )
        raw_data_axes.append(time_ax)
        logger.debug('Time axis created')
    else:
        logger.warning('Time axis does not exist!')

    if "channels" in input_dict and "channels" not in skip_keys:
        channel_ax = flap.Coordinate(name="Channels",
                                     unit=None,
                                     mode=flap.CoordinateMode(equidistant=False),
                                     values=input_dict["channels"],
                                     dimension_list=[0],
                                     shape=len(input_dict["channels"])
                                     )
        raw_data_axes.append(channel_ax)
        logger.debug('Channels axis created')
    else:
        logger.warning('Channels axis does not exist!')

    if "theta" in input_dict and "theta" not in skip_keys:
        theta_ax = flap.Coordinate(name="Theta",
                                   unit="rad",
                                   mode=flap.CoordinateMode(equidistant=False),
                                   values=input_dict["theta"],
                                   dimension_list=[0],
                                   shape=len(input_dict["theta"])
                                   )
        raw_data_axes.append(theta_ax)
        logger.debug('Theta axis created')
    else:
        logger.warning('Theta axis does not exist!')

    if "phi" in input_dict and "phi" not in skip_keys:
        phi_ax = flap.Coordinate(name="Phi",
                                 unit="rad",
                                 mode=flap.CoordinateMode(equidistant=False),
                                 values=input_dict["phi"],
                                 dimension_list=[0],
                                 shape=len(input_dict["phi"])
                                 )
        raw_data_axes.append(phi_ax)
        logger.debug('Phi axis created')
    else:
        logger.warning('Phi axis does not exist!')

    # Creating transformed axes
    if "transf_timeax" in input_dict and "transf_timeax" not in skip_keys and np.any(input_dict["transf_timeax"] != 0):
        transf_timeax = flap.Coordinate(name="time",
                                        unit="s",
                                        mode=flap.CoordinateMode(equidistant=False),
                                        values=input_dict["transf_timeax"],
                                        dimension_list=[1],
                                        shape=len(input_dict["transf_timeax"])
                                        )
        transform_axes.append(transf_timeax)
        cross_transform_axes.append(transf_timeax)
        modenumber_axes.append(transf_timeax)
        logger.debug('Transform time axis created')
    else:
        logger.warning('Transform time axis does not exist!')

    if "transf_freqax" in input_dict and "transf_freqax" not in skip_keys and np.any(input_dict["transf_freqax"] != 0):
        transf_freqax = flap.Coordinate(name="frequency",
                                        unit="kHz",
                                        mode=flap.CoordinateMode(equidistant=False),
                                        values=input_dict["transf_freqax"],
                                        dimension_list=[0],
                                        shape=len(input_dict["transf_freqax"])
                                        )
        transform_axes.append(transf_freqax)
        cross_transform_axes.append(transf_freqax)
        modenumber_axes.append(transf_freqax)
        logger.debug('Transform frequency axis created')
    else:
        logger.warning('Transform frequency axis does not exist!')

    if "transf_scaleax" in input_dict and "transf_scaleax" not in skip_keys and np.any(
            input_dict["transf_scaleax"] != 0):
        transf_scaleax = flap.Coordinate(name="scale",
                                         unit=None,
                                         mode=flap.CoordinateMode(equidistant=False),
                                         values=input_dict["transf_scaleax"],
                                         dimension_list=[0],
                                         shape=len(input_dict["transf_scaleax"])
                                         )
        transform_axes.append(transf_scaleax)
        cross_transform_axes.append(transf_scaleax)
        modenumber_axes.append(transf_scaleax)
        logger.debug('Transform scale axis created')
    else:
        logger.warning('Transform scale axis does not exist!')

    # Creating channel axis for transforms
    if "channels" in input_dict and "channels" not in skip_keys and np.any(input_dict["channels"] != 0) \
            and "channels_ind" in input_dict and "channels_ind" not in skip_keys \
            and np.any(input_dict["channels_ind"] != 0):
        selected_channels_data = list(compress(input_dict["channels"], input_dict["channels_ind"]))

        selected_channels = flap.Coordinate(name="Selected channels",
                                            unit=None,
                                            mode=flap.CoordinateMode(equidistant=False),
                                            values=selected_channels_data,
                                            dimension_list=[2],
                                            shape=len(selected_channels_data)
                                            )
        transform_axes.append(selected_channels)
        logger.debug('Selected_channels axis created')
    else:
        logger.warning('Selected_channels axis does not exist!')

    # Creating channel pair axis for cross-transforms
    if type(input_dict["channelpairs"][0]) == np.ndarray:
        tmp_list = []
        for i in input_dict["channelpairs"]:
            tmp_list.append("(" + str(i[0])[2:-1] + ", " + str(i[1])[2:-1] + ")")
        input_dict["channelpairs"] = tmp_list
        logger.debug("channelpairs converted to str list")

    if "channelpairs" in input_dict and "channelpairs" not in skip_keys and np.any(input_dict["channelpairs"] != 0) \
            and "channelpairs_ind" in input_dict and "channelpairs_ind" not in skip_keys \
            and np.any(input_dict["channelpairs_ind"] != 0):
        selected_channelpairs_data = list(compress(input_dict["channelpairs"], input_dict["channelpairs_ind"]))
        selected_channelpairs = flap.Coordinate(name="Selected channel pairs",
                                                unit=None,
                                                mode=flap.CoordinateMode(equidistant=False),
                                                values=selected_channelpairs_data,
                                                dimension_list=[2],
                                                shape=len(selected_channelpairs_data)
                                                )
        cross_transform_axes.append(selected_channelpairs)
        logger.debug('selected channel pairs axis created')
    else:
        logger.warning('selected channel pairs axis does not exist!')

    logger.info('All axes created')
    # Creating dataobjects

    if "data" in input_dict and "data" not in skip_keys and np.any(input_dict['data'] != 0):
        raw_data = flap.DataObject(
            data_array=input_dict['data'],
            data_unit=flap.Unit(name='arbitrary unit', unit='a. u.'),
            exp_id=str(input_dict['expname']) + " " + str(input_dict['shotnumber']),
            coordinates=raw_data_axes,
            data_shape=input_dict['data'].shape,
        )
        logger.debug('Data dataobject created')
    else:
        raw_data = None
        logger.warning('Data dataobject does not exist!')

    if "transforms" in input_dict and "transforms" not in skip_keys and np.any(input_dict['transforms'] != 0):
        transforms = flap.DataObject(
            data_array=input_dict['transforms'],
            data_unit=flap.Unit(name='arbitrary unit', unit='a. u.'),
            exp_id=str(input_dict['expname']) + " " + str(input_dict['shotnumber']),
            coordinates=transform_axes,
            data_shape=input_dict['transforms'].shape,
        )
        logger.debug('Transforms dataobject created')
    else:
        transforms = None
        logger.warning('Transforms dataobject does not exist!')

    if "smoothed_apsds" in input_dict and "smoothed_apsds" not in skip_keys \
            and np.any(input_dict['smoothed_apsds'] != 0):
        smoothed_apsds = flap.DataObject(
            data_array=input_dict['smoothed_apsds'],
            data_unit=flap.Unit(name='arbitrary unit', unit='a. u.'),
            exp_id=str(input_dict['expname']) + " " + str(input_dict['shotnumber']),
            coordinates=transform_axes,
            data_shape=input_dict['smoothed_apsds'].shape,
        )
        logger.debug('smoothed_apsds dataobject created')
    else:
        smoothed_apsds = None
        logger.warning('smoothed_apsds dataobject does not exist!')

    if "crosstransforms" in input_dict and "crosstransforms" not in skip_keys \
            and np.any(input_dict['crosstransforms'] != 0):
        crosstransforms = flap.DataObject(
            data_array=input_dict['crosstransforms'],
            data_unit=flap.Unit(name='arbitrary unit', unit='a. u.'),
            exp_id=str(input_dict['expname']) + " " + str(input_dict['shotnumber']),
            coordinates=cross_transform_axes,
            data_shape=input_dict['crosstransforms'].shape,
        )
        logger.debug('crosstransforms dataobject created')
    else:
        crosstransforms = None
        logger.warning('crosstransforms dataobject does not exist!')

    if "smoothed_crosstransforms" in input_dict and "smoothed_crosstransforms" not in skip_keys \
            and np.any(input_dict['smoothed_crosstransforms'] != 0):
        smoothed_crosstransforms = flap.DataObject(
            data_array=input_dict['smoothed_crosstransforms'],
            data_unit=flap.Unit(name='arbitrary unit', unit='a. u.'),
            exp_id=str(input_dict['expname']) + " " + str(input_dict['shotnumber']),
            coordinates=cross_transform_axes,
            data_shape=input_dict['smoothed_crosstransforms'].shape,
        )
        logger.debug('smoothed_crosstransforms dataobject created')
    else:
        smoothed_crosstransforms = None
        logger.warning('smoothed_crosstransforms dataobject does not exist!')

    if "coherences" in input_dict and "coherences" not in skip_keys and np.any(input_dict['coherences'] != 0):
        coherences = flap.DataObject(
            data_array=input_dict['coherences'],
            data_unit=flap.Unit(name='arbitrary unit', unit='a. u.'),
            exp_id=str(input_dict['expname']) + " " + str(input_dict['shotnumber']),
            coordinates=cross_transform_axes,
            data_shape=input_dict['coherences'].shape,
        )
        logger.debug('coherences dataobject created')
    else:
        coherences = None
        logger.warning('coherences dataobject does not exist!')

    if "transfers" in input_dict and "transfers" not in skip_keys and np.any(input_dict['transfers'] != 0):
        transfers = flap.DataObject(
            data_array=input_dict['transfers'],
            data_unit=flap.Unit(name='arbitrary unit', unit='a. u.'),
            exp_id=str(input_dict['expname']) + " " + str(input_dict['shotnumber']),
            coordinates=cross_transform_axes,
            data_shape=input_dict['transfers'].shape,
        )
        logger.debug('transfers dataobject created')
    else:
        transfers = None
        logger.warning('transfers dataobject does not exist!')

    if "modenumbers" in input_dict and "modenumbers" not in skip_keys and np.any(input_dict['modenumbers'] != 0):
        modenumbers = flap.DataObject(
            data_array=input_dict['modenumbers'],
            data_unit=flap.Unit(name='arbitrary unit', unit='a. u.'),
            exp_id=str(input_dict['expname']) + " " + str(input_dict['shotnumber']),
            coordinates=modenumber_axes,
            data_shape=input_dict['modenumbers'].shape,
        )
        logger.debug('modenumbers dataobject created')
    else:
        modenumbers = None
        logger.warning('modenumbers dataobject does not exist!')

    if "qs" in input_dict and "qs" not in skip_keys and np.any(input_dict['qs'] != 0):
        qs = flap.DataObject(
            data_array=input_dict['qs'],
            data_unit=flap.Unit(name='arbitrary unit', unit='a. u.'),
            exp_id=str(input_dict['expname']) + " " + str(input_dict['shotnumber']),
            coordinates=modenumber_axes,
            data_shape=input_dict['qs'].shape,
        )
        logger.debug('qs dataobject created')
    else:
        qs = None
        logger.warning('qs dataobject does not exist!')

    return raw_data, transforms, smoothed_apsds, crosstransforms, smoothed_crosstransforms, coherences, \
           transfers, modenumbers, qs
