# NWT dataobject to be implemented here


import sys

import scipy.io
import io
import flap
import logging
import pickle

sys.path.append(r"..\utility")
import convert_dict_to_flap

logging.basicConfig(filename='log.log',
                    filemode='w',
                    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
                    datefmt='%y.%b.%d. %H:%M:%S',
                    level=logging.INFO)
core_logger = logging.getLogger('core_logger')
core_logger.setLevel(logging.DEBUG)


class NWTDataObject:

    def __init__(self, logger=core_logger):
        # FLAP dataobjects to be filled:
        self.raw_data = None
        self.transforms = None
        self.smoothed_apsds = None
        self.crosstransforms = None
        self.smoothed_crosstransforms = None
        self.coherences = None
        self.transfers = None
        self.modenumbers = None
        self.qs = None

        self.logger = logger

        # properies if signals
        self.raw_datapoints = None

        self.logger.debug("NWT DataObject created")
        return

    def update_properties(self):
        self.raw_datapoints = self.raw_data.data.shape[-1]

    def load_proc_sav(self, path):
        self.logger.info("Loading sav file: " + path)
        loaded_sav = io.readsav(path, python_dict=True)
        self.raw_data, self.transforms, self.smoothed_apsds, self.crosstransforms, self.smoothed_crosstransforms, \
        self.coherences, self.transfers, self.modenumbers, self.qs = convert_dict_to_flap.convert_processed_sav(
            loaded_sav)
        self.update_properties()
        return

    def load_raw_sav(self, path):
        self.logger.info("Loading sav file: " + path)
        loaded_sav = scipy.io.readsav(path, python_dict=True)
        if "transf_timeax" in loaded_sav or "transf_freqax" in loaded_sav:
            self.logger.warning("Probably trying to load processed sav, please use 'Load processed' button")
        try:
            flap_object = convert_dict_to_flap.convert_raw_sav(loaded_sav, skip_keys=[])
            self.raw_data = flap_object
            self.logger.debug("Loaded sav file")
        except TypeError('loaded_sav is not a dictionary of a raw sav file'):
            self.logger.error('loaded_sav is not a dictionary of a raw sav file', exc_info=True)
        except Exception as e:
            self.logger.error("Exception occurred during dict to flap conversion:", exc_info=True)
        self.update_properties()
        return

    def load_flap_raw_dump(self, path):
        self.logger.info('Loading flap object: ' + path)
        self.raw_data = flap.load(path)
        self.update_properties()
        return

    def save_raw_flap(self, path):
        filename = (path.split('/'))[-1] + '.flapdata'
        flap.save(self.raw_data, filename=filename)

    def load(self, path):
        if path[-6:] == ".pynwt":
            try:
                f = io.open(filename, "rb")
                loaded = pickle.load(f)
                f.close()

                self.raw_data = loaded.raw_data
                self.transforms = loaded.transforms
                self.smoothed_apsds = loaded.smoothed_apsds
                self.crosstransforms = loaded.crosstransforms
                self.smoothed_crosstransforms = loaded.smoothed_crosstransforms
                self.coherences = loaded.coherences
                self.transfers = loaded.transfers
                self.modenumbers = loaded.modenumbers
                self.qs = loaded.qs
                self.update_properties()
                return
            except Exception as e:
                core_logger.error('Error during loading', exc_info=True)

        else:
            return

    def save(self, path):
        if path[-6:] == ".pynwt":
            try:
                f = io.open(filename, "rb")
                loaded = pickle.dump(f)
                f.close()

                self.raw_data = loaded.raw_data
                self.transforms = loaded.transforms
                self.smoothed_apsds = loaded.smoothed_apsds
                self.crosstransforms = loaded.crosstransforms
                self.smoothed_crosstransforms = loaded.smoothed_crosstransforms
                self.coherences = loaded.coherences
                self.transfers = loaded.transfers
                self.modenumbers = loaded.modenumbers
                self.qs = loaded.qs
                self.update_properties()
                return
            except Exception as e:
                core_logger.error('Error during loading', exc_info=True)

        else:
            return


def load_pynwt(path):
    # use HDF5 eventually
    loaded = NWTDataObject()
    if path[-6:] == ".pynwt":
        try:
            f = io.open(filename, "rb")
            loaded = pickle.load(f)
            f.close()
        except Exception as e:
            core_logger.error('Error during loading', exc_info=True)
    return loaded


def save_pynwt(dataobject, path):
    core_logger.debug('Saving processed signal started')
    try:
        filename = (path.split('/'))[-1] + '.pynwt'
        try:
            f = io.open(filename, "wb")
            pickle.dump(dataobject, f)
            f.close()
        except Exception:
            raise ValueError("Cannot close file " + filename)
        flap.save(self, filename=filename)
        core_logger.info('Saved signals to: ' + filename)
    except Exception as e:
        core_logger.error('Error during saving', exc_info=True)
    return
