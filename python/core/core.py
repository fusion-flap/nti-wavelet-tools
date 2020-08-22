# NWT dataobject to be implemented here


import sys

from scipy import io
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

        return

    def save(self, path):
        self.logger.debug('Saving processed signal started')
        try:
            filename = (path.split('/'))[-1] + '.pynwt'
            try:
                f = io.open(filename, "wb")
                d = self
                pickle.dump(d, f, protocol=3)
                f.close()
            except Exception:
                raise ValueError("Cannot close file " + filename)
            flap.save(self, filename=filename)
            self.logger.info('Saved signals to: ' + filename)
        except Exception as e:
            self.logger.error('Error during saving', exc_info=True)
        return

    def load_proc_sav(self, path):
        self.logger.info("Loading sav file: " + path)
        loaded_sav = io.readsav(path, python_dict=True)
        self.raw_data, self.transforms, self.smoothed_apsds, self.crosstransforms, self.smoothed_crosstransforms, \
        self.coherences, self.transfers, self.modenumbers, self.qs = convert_dict_to_flap.convert_processed_sav(
            loaded_sav)
        return

    def load_raw_sav(self, path):
        self.logger.info("Loading sav file: " + path)
        loaded_sav = io.readsav(path, python_dict=True)
        if "transf_timeax" in loaded_sav or "transf_freqax" in loaded_sav:
            self.logger.warning("Probably trying to load processed sav, please use 'Load processed' button")
        try:
            flap_object = convert_dict_to_flap.convert_raw_sav(loaded_sav, skip_keys=[])
            self.raw_data = flap_object
        except TypeError('loaded_sav is not a dictionary of a raw sav file'):
            self.logger.error('loaded_sav is not a dictionary of a raw sav file', exc_info=True)
        except Exception as e:
            self.logger.error("Exception occurred during dict to flap conversion:", exc_info=True)
        return

    def load_flap_raw_dump(self, path):
        self.logger.info('Loading flap object: ' + path)
        self.raw_data = flap.load(path)
        return


def load_pynwt(path):
    # use HDF5 eventually
    loaded = None
    if path[-6:] == ".pynwt":
        try:
            f = io.open(filename, "rb")
            loaded = pickle.load(f)
            f.close()
        except Exception as e:
            core_logger.error('Error during loading', exc_info=True)
    return loaded
