import nti_wavelet_preprocessing_gui
import nti_wavelet_preprocessing_readtext_logic
import nti_wavelet_preprocessing_data_class
import nti_wavelet_preprocessing_data_logic
import nti_wavelet_preprocessing_readtext_dialog
import nti_wavelet_preprocessing_metadata_logic

from PyQt4 import QtCore, QtGui, uic
from PyQt4.QtGui import QMainWindow
import pyqtgraph
import scipy.io
import numpy
import easygui


class DialogWithLogic(QMainWindow):
    def __init__(self):
        super(DialogWithLogic, self).__init__()
        self.gui_ui = uic.loadUi('/home/nyary/NTI_Wavelet_Tools/trunk/python/nti_wavelet_preprocessing_gui.ui', self)

        self.menuRead_Binary.triggered.connect(self.read_binary)
        self.buttonRead_Binary.clicked.connect(self.read_binary)
        self.menuRead_Text.triggered.connect(self.read_text_dialog)
        self.buttonRead_Text.clicked.connect(self.read_text_dialog)
        self.menuRead_NWT.triggered.connect(self.read_with_nwt)
        self.buttonRead_NWT.clicked.connect(self.read_with_nwt)

        # self.actionASDEX.triggered.connect\
        #     (lambda: nti_wavelet_preprocessing_data_logic.DataLogic.get_rawsignal(self, 'ASDEX'))
        # self.actionJET.triggered.connect\
        #     (lambda: nti_wavelet_preprocessing_data_logic.DataLogic.get_rawsignal(self, 'JET'))
        # self.buttonGet_Rawsignal.clicked.connect(self.get_rawsignal_from)
        #
        # self.list_of_tokamaks = ['ASDEX','JET']
        # self.rawsignal_from.addItems(self.list_of_tokamaks)

        self.label.setAlignment(QtCore.Qt.AlignTop | QtCore.Qt.AlignLeft)
        self.plotButton.clicked.connect(self.plotoptions)
        self.plotOptions.addItem('Plot together')
        self.retrigger_resampleButton.clicked.connect(self.retrigger_resample)
#        self.resetButton(self.reset)
        self.nwt_saveButton.clicked.connect(self.save_for_nwt)
        self.gui_ui.show()
        self.data_list = nti_wavelet_preprocessing_data_logic.DataLogic.data_list
        self.checked = []

    def show_data(self, new = 1):
        for i in range(0,new):
            index = len(self.data_list) - new + 1 + i

            self.newgroupBox = QtGui.QGroupBox()
            self.newgroupBox.setObjectName('newgroupbox%d' % index)

            self.newhorizontalLayout = QtGui.QHBoxLayout(self.newgroupBox)

            self.del_button = QtGui.QPushButton(self.newgroupBox)
            self.del_button.setObjectName('%d' % index)

            self.del_button.setText('x')
            self.del_button.setMaximumSize(16,16)

            #def delete_box():
            #    box = 'newgroupbox' + self.sender().objectName()

            #.setParent(None)
            #newgroupBox.hide()
            #newgroupBox.deleteLater()


            self.del_button.clicked.connect(self.delete_data)
            self.newhorizontalLayout.addWidget(self.del_button)

            self.meta_button = QtGui.QPushButton(self.newgroupBox)
            self.meta_button.setObjectName('meta_button%d' % index)

            channel_name = self.data_list[index-1].channel_name #egyesével való beolvasáskor nem tökéletes
            if channel_name == None:
                self.meta_button.setText('data%d' % index)
            else:
                self.meta_button.setText(channel_name)

            self.meta_button.setMinimumWidth(120)
            self.meta_button.clicked.connect(self.metadata_dialog)
            self.newhorizontalLayout.addWidget(self.meta_button)

            self.newcheckBox = QtGui.QCheckBox(self.newgroupBox)
            self.newcheckBox.setObjectName('checkbox%d' % index)
            self.newcheckBox.setChecked(True)
            self.newcheckBox.setLayoutDirection(QtCore.Qt.RightToLeft)

            self.newcheckBox.stateChanged.connect(self.plot)
            self.newhorizontalLayout.addWidget(self.newcheckBox)

            self.verticalLayout.setAlignment(self.newhorizontalLayout, QtCore.Qt.AlignBottom)
            self.verticalLayout.addWidget(self.newgroupBox)
            self.verticalLayout.addStretch()
            self.verticalLayout.setAlignment(QtCore.Qt.AlignTop)

            self.defaultTime.addItem(self.data_list[index-1].channel_name)


    def delete_data(self): #nem működik
        data_number = int(self.sender().objectName()[-1:])-1
        nti_wavelet_preprocessing_data_logic.DataLogic.delete_data(self, self.data_list, data_number)


        #self.sender().objectName().deleteLater()


    def metadata_dialog(self):
        data_number = int(self.sender().objectName()[-1:])-1

        metadata_ui = nti_wavelet_preprocessing_metadata_logic.MetadataDialog\
            (self.gui_ui, self.data_list, data_number, parent=self)


    def plotoptions(self):
        if str(self.plotOptions.currentText()) == '-- Plot Options --':
            self.error = QtGui.QLabel("\n Choose an option!\n")
            self.error.show()
        elif str(self.plotOptions.currentText()) == 'Plot together':
            self.plot_together()


    def read_text_dialog(self):
        file_path = easygui.fileopenbox()

        read_text_ui = nti_wavelet_preprocessing_readtext_logic.ReadTextDialog\
            (self.gui_ui, self.data_list, file_path, parent=self)


    def read_binary(self):
        file_path = easygui.fileopenbox()
        if file_path.endswith('.mat'):
            nti_wavelet_preprocessing_data_logic.DataLogic.read_matlab\
                (self, self.data_list, file_path, time_name = 'time', data_name ='data')

            self.show_data()
        elif file_path.endswith('.wav'):
            self.error = QtGui.QLabel("\n The chosen file cannot be opened.\n")
            self.error.show()

    def read_with_nwt(self):
        size_of_data_list = len(self.data_list)

        file_path = easygui.fileopenbox()
        nti_wavelet_preprocessing_data_logic.DataLogic.read_nwt(self, file_path)

        new_size_of_data_list = len(self.data_list)
        new = new_size_of_data_list - size_of_data_list
        self.show_data(new)

    # def get_rawsignal_from(self):
    #     tokamak = self.rawsignal_from.currentText()
    #     nti_wavelet_preprocessing_data_logic.DataLogic.get_rawsignal(self, tokamak)

    def plot(self):
        data_number = int(self.sender().objectName()[-1:])-1

        self.checked.append(self.data_list[data_number])
        self.checked.remove(self.data_list[data_number])


    def plot_together(self):
        self.graph.clear()
        self.zoomed_graph.clear()

        for i in range(0,int(len(self.data_list))):
            #if be van pipálva a megfelelő checkbox
            self.graph.plot(self.data_list[i]._Data__time, self.data_list[i]._Data__data)
            self.zoomed_graph.plot(self.data_list[i]._Data__time, self.data_list[i]._Data__data)

        regionItem = pyqtgraph.LinearRegionItem([0,1])

        self.graph.addItem(regionItem)

        def update_plot():
                self.zoomed_graph.setXRange(*regionItem.getRegion(), padding = 0)
        def update_region():
                regionItem.setRegion(self.zoomed_graph.getViewBox().viewRange()[0])

                # found = False
                # while found == False:
                #     for i in range(0,len(self.data_list)-1):
                #         if self.data_list[i].channel_name == self.defaultTime.currentText():
                #             self.y_first.setText(self.data_list[i].channel_name)
                #             found = True
                #
                self.x_first.setText("%.5f" % regionItem.getRegion()[0])
                self.x_last.setText("%.5f" % regionItem.getRegion()[1])

        regionItem.sigRegionChanged.connect(update_plot)
        self.zoomed_graph.sigXRangeChanged.connect(update_region)
        update_plot()

    def retrigger_resample(self):

        channel_name = self.defaultTime.currentText()

        nti_wavelet_preprocessing_data_logic.DataLogic.retrigger(self, channel_name)
        #plot changes

   # def reset(self):
   #     pass
    #plot unchanged range
    #delete new_data, new_time

    def save_for_nwt(self):
        file_path = easygui.fileopenbox()
        nti_wavelet_preprocessing_data_logic.DataLogic.save_file(self, self.data_list, file_path)


if __name__ == "__main__":
    import sys

    app = QtGui.QApplication(sys.argv)
    gui_ui = DialogWithLogic()
    sys.exit(app.exec_())
