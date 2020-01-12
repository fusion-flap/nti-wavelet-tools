import nti_wavelet_preprocessing_gui_logic
import nti_wavelet_preprocessing_data_logic
from PyQt4 import QtCore, QtGui, uic
from PyQt4.QtGui import QDialog

import easygui

class ReadTextDialog(QDialog):
    def __init__(self, gui_ui, data_list, file_path, parent = None ):
        super(ReadTextDialog, self).__init__(parent=parent)  ##Ui_Dialog.__init__()

        self.read_text_ui = uic.loadUi('/home/nyary/NTI_Wavelet_Tools/trunk/python/nti_wavelet_preprocessing_readtext_dialog.ui', self)
        self.file_path = file_path
        self.data_list = data_list
        self.gui_ui = gui_ui

        self.okButton.clicked.connect(self.append_data)
        self.cancelButton.clicked.connect(self.cancel)

        self.file = open(file_path, "r")
        self.data = self.file.read()
        self.textEdit.setText(self.data)

        self.read_text_ui.show()

    def append_data(self):
        delimiter = self.delimiterText.text()
        headersize = self.headerText.text()
        time_col = int(self.timeColumn.text())-1
        data_col = int(self.dataColumn.text())-1
        experiment_name = self.experimentText.text()
        shot_number = self.shotText.text()
        channel_name = self.channelText.text()
        coordinates_history = self.coordinatesText.text()
        data_history = self.dataText.text()

        if channel_name =='':
            channel_name = None

        nti_wavelet_preprocessing_data_logic.DataLogic.read_text\
            (self,self.data_list, self.file_path, delimiter, headersize, time_col, data_col,
             experiment_name, shot_number, channel_name, coordinates_history, data_history)

        nti_wavelet_preprocessing_gui_logic.DialogWithLogic.show_data(self.gui_ui)

        self.read_text_ui.close()


    def cancel(self):
        self.read_text_ui.close()

