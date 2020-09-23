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


def convert_raw_sav(input_dict, logger=default_logger, equidistant_time=False):
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
        logger.error('Time axis does not exist.', exc_info=True)

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
        logger.error('Channel axis does not exist.', exc_info=True)

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
        logger.warning('Theta axis does not exist.', exc_info=True)

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
        logger.warning('Phi axis does not exist.', exc_info=True)

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


def convert_processed_sav(input_dict, logger=default_logger):
    # input_dict: a NTI wavelet tools processed sav file loaded as a python dictionary,
    # preferably loaded with the io.readsav command

    logger.debug("Creating blank objects")
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
        logger.debug("Filling up transform parameters")
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
        logger.debug("Succesfully filled up transform parameters!")
    except:
        logger.warning('Filling up transport parameters interrupted', exc_info=True)
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
        logger.error('Time axis does not exist.', exc_info=True)
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
        logger.error('Channels axis created', exc_info=True)
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
        logger.warning('Theta axis does not exist!', exc_info=True)

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
        logger.warning('Phi axis does not exist!', exc_info=True)

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
        logger.warning('Transform time axis does not exist!', exc_info=True)

    try:
        transf_scaleax = flap.Coordinate(name="Transf_scaleax",
                                         unit="kHz",
                                         mode=flap.CoordinateMode(equidistant=False),
                                         values=input_dict['saved_datablock']["transf_scaleax"][0],
                                         dimension_list=[0],
                                         shape=len(input_dict['saved_datablock']["transf_scaleax"][0])
                                         )
        transform_axes.append(transf_scaleax)
        cross_transform_axes.append(transf_scaleax)
        modenumber_axes.append(transf_scaleax)
        logger.debug('Transform scale axis created')
    except:
        logger.warning('Transform scale axis does not exist!', exc_info=True)

    try:
        transf_freqax = flap.Coordinate(name="Transf_freqax",
                                        unit="kHz",
                                        mode=flap.CoordinateMode(equidistant=False),
                                        values=input_dict['saved_datablock']["transf_freqax"][0],
                                        dimension_list=[0],
                                        shape=len(input_dict['saved_datablock']["transf_freqax"][0])
                                        )
        transform_axes.append(transf_freqax)
        cross_transform_axes.append(transf_freqax)
        modenumber_axes.append(transf_freqax)
        logger.debug('Transform frequency axis created')
    except:
        logger.warning('Transform frequency axis does not exist!', exc_info=True)

    try:
        _temp = []
        for i in range(len(input_dict['saved_datablock']["channels"][0])):
            if input_dict['saved_datablock']['channels_ind'][0][i] == 1:
                _temp.append(input_dict['saved_datablock']["channels"][0][i].decode('utf-8'))
        selectedChannels = flap.Coordinate(name="Selected_channels",
                                           unit=None,
                                           mode=flap.CoordinateMode(equidistant=False),
                                           values=_temp,
                                           dimension_list=[2],
                                           shape=len(_temp)
                                           )
        transform_axes.append(selectedChannels)
        modenumber_axes.append(selectedChannels)
        logger.debug('Selected channels set.')
    except:
        logger.error('Something went wrong with the selected channels', exc_info=True)

    try:
        selected_channelpairs_data = list(compress(input_dict['saved_datablock']["channelpairs"][0],
                                                   input_dict['saved_datablock']["channelpairs_ind"][0]))
        selected_channelpairs = flap.Coordinate(name="Selected channel pairs",
                                                unit=None,
                                                mode=flap.CoordinateMode(equidistant=False),
                                                values=selected_channelpairs_data,
                                                dimension_list=[2],
                                                shape=len(selected_channelpairs_data)
                                                )
        cross_transform_axes.append(selected_channelpairs)
        logger.debug('selected channel pairs axis created')

    except:
        logger.warning('selected channel pairs axis does not exist!')

    # creating and filling transform dataobjects
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
        logger.warning('Data dataobject does not exist!', exc_info=True)
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
        logger.warning('Transforms dataobject does not exist!', exc_info=True)

    try:
        smoothed_apsds = flap.DataObject(
            data_array=input_dict['smoothed_apsds'],
            data_unit=flap.Unit(name='arbitrary unit', unit='a. u.'),
            exp_id=exp_id,
            coordinates=transform_axes,
            data_shape=input_dict['smoothed_apsds'].shape,
        )
        logger.debug('smoothed_apsds dataobject created')
    except:
        logger.warning('smoothed_apsds dataobject does not exist!', exc_info=True)
    try:
        crosstransforms = flap.DataObject(
            data_array=input_dict['saved_datablock']['crosstransforms'][0],
            data_unit=flap.Unit(name='arbitrary unit', unit='a. u.'),
            exp_id=exp_id,
            coordinates=cross_transform_axes,
            data_shape=input_dict['saved_datablock']['crosstransforms'][0].shape,
        )
        logger.debug('crosstransforms dataobject created')
    except:
        logger.warning('crosstransforms dataobject does not exist!', exc_info=True)

    try:
        smoothed_crosstransforms = flap.DataObject(
            data_array=input_dict['saved_datablock']['smoothed_crosstransforms'][0],
            data_unit=flap.Unit(name='arbitrary unit', unit='a. u.'),
            exp_id=exp_id,
            coordinates=cross_transform_axes,
            data_shape=input_dict['saved_datablock']['smoothed_crosstransforms'][0].shape,
        )
        logger.debug('smoothed_crosstransforms dataobject created')
    except:
        logger.warning('smoothed_crosstransforms dataobject does not exist!', exc_info=True)

    try:
        transfers = flap.DataObject(
            data_array=input_dict['saved_datablock']['transfers'][0],
            data_unit=flap.Unit(name='arbitrary unit', unit='a. u.'),
            exp_id=exp_id,
            coordinates=cross_transform_axes,
            data_shape=input_dict['saved_datablock']['transfers'][0].shape,
        )
        logger.debug('transfers dataobject created')
    except:
        logger.warning('transfers dataobject does not exist!', exc_info=True)

    try:
        coherences = flap.DataObject(
            data_array=input_dict['saved_datablock']['coherences'][0],
            data_unit=flap.Unit(name='coherence', unit=' '),
            exp_id=exp_id,
            coordinates=cross_transform_axes,
            data_shape=input_dict['saved_datablock']['coherences'][0].shape,
        )
        logger.debug('Transforms dataobject created')
    except:
        logger.warning('Transforms dataobject does not exist!', exc_info=True)

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
        logger.warning('qs dataobject does not exist!', exc_info=True)

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
        logger.warning('modenumber dataobject does not exist!', exc_info=True)
    ###### load transform parameters #####

    return raw_data, transforms, smoothed_apsds, crosstransforms, smoothed_crosstransforms, coherences, \
           transfers, modenumbers, qs, transform_parameters

