import nti_wavelet_preprocessing_gui_logic
import nti_wavelet_preprocessing_data_logic
from PyQt4 import QtCore, QtGui, uic
from PyQt4.QtGui import QDialog

import easygui

class MetadataDialog(QDialog):
    def __init__(self, gui_ui, data_list, data_number, parent = None ):
        super(MetadataDialog, self).__init__(parent = parent)

        self.metadata_ui = uic.loadUi('/home/nyary/NTI_Wavelet_Tools/trunk/python/nti_wavelet_preprocessing_metadata_dialog.ui', self)
        self.data_list = data_list
        self.gui_ui = gui_ui
        self.data_number = data_number
        self.okButton.clicked.connect(self.values)
        self.cancelButton.clicked.connect(self.cancel)

        self.experiment_nameText.setText(self.data_list[self.data_number].experiment_name)
        self.shot_numberText.setText(str(self.data_list[self.data_number].shot_number))
        self.channel_nameText.setText(self.data_list[self.data_number].channel_name)
        self.coordinates_historyText.setText(self.data_list[self.data_number].coordinates_history)
        self.data_historyText.setText(self.data_list[self.data_number].data_history)
        self.sampling_frequencyText.setText("%.5f" % self.data_list[self.data_number].sampling_frequency)
        self.n_data_pointsText.setText(str(self.data_list[self.data_number].n_data_points))
        self.thetaText.setText("%.5f" % self.data_list[self.data_number].theta)
        self.phiText.setText("%.5f" % self.data_list[self.data_number].phi)

        self.metadata_ui.show()


    def values(self):
        experiment_name = self.experiment_nameText.text()
        shot_number = self.shot_numberText.text()
        channel_name = self.channel_nameText.text()
        coordinates_history = self.coordinates_historyText.text()
        data_history = self.data_historyText.text()
        phi = self.phiText.text()
        theta = self.phiText.text()

        nti_wavelet_preprocessing_data_logic.DataLogic.set_metadata(self, self.data_number,
                                                                    experiment_name, shot_number, channel_name,
                                                                    coordinates_history, data_history, phi, theta)
        self.metadata_ui.close()


    def cancel(self):
        self.metadata_ui.close()
