# -*- coding: utf-8 -*-
"""
Created on Sat Jul 27 12:22:10 2019

@author: poloskei
"""
import matplotlib.pyplot as plt
# import numpy as np
import sys
from scipy import io

sys.path.append('./LIB')
# import datetime as dttm
# import calendar as clndr

from PyQt5 import QtCore, QtGui, QtWidgets, uic
from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg as FigureCanvas
from matplotlib.backends.backend_qt5agg import NavigationToolbar2QT as NavigationToolbar
import flap
import logging

sys.path.append(r"..\utility")
import convert_dict_to_flap

# load UI
qtCreatorFile = "gui_layout.ui"
qtChannelsFile = "channel_selection.ui"
Ui_MainWindow, QtBaseClass = uic.loadUiType(qtCreatorFile)
Ui_ChannelsWindow, _ = uic.loadUiType(qtChannelsFile)


logging.basicConfig(filename='log.log',
                    filemode='w',
                    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
                    datefmt='%y.%b.%d. %H:%M:%S',
                    level=logging.INFO)
ui_logger = logging.getLogger('ui_logger')

class MyApp(QtWidgets.QMainWindow, Ui_MainWindow):
    def __init__(self):
        QtWidgets.QMainWindow.__init__(self)
        Ui_MainWindow.__init__(self)
        self.setupUi(self)
        self.progresslogTextEdit.append('Welcome!')
        # checkbox list for select channel
        self.CB = []
        self.channelSelected = []
        # data storage structures
        self.data = []
        # settings
        self.loadSuccessful = False
        # signal processing parameters
        self.defaultTransformParameters()
        # connect buttons
        self.loadsignalButton.clicked.connect(self.loadsignal)
        self.savesignalButton.clicked.connect(self.savesignal)
        self.selectchannelsButton.clicked.connect(self.selectchannels)
        self.stftRadioButton.toggled.connect(self.setOtherGrey)
        self.quickanddirtyButton.clicked.connect(self.quickanddirtysetting)
        self.domodenumbersCheckBox.clicked.connect(self.setGrey)
    def defaultTransformParameters(self):
        self.transformParameters = {}
        self.transformParameters['type'] = 'STFT'
        self.transformParameters['step'] = 5
        self.transformParameters['fd'] = 300 # kHz
        self.transformParameters['window'] = 'gaussian'
        self.transformParameters['windowlength'] = 200 # data point
        self.transformParameters['order'] = 5
        self.transformParameters['scale'] = 0.1
        
    def loadsignal(self):
        self.loadSuccessful = False
        try:
            path = QtWidgets.QFileDialog.getOpenFileName()[0]
            if path[-9:] == ".flapdata":
                self.progresslogTextEdit.append('Loading flap object...')
                ui_logger.info('Loading flap object: '+path)
                flap_object = flap.load(path)
                self.data = flap_object
                self.loadSuccessful = True
            elif path[-4:] == ".sav":
                self.progresslogTextEdit.append("Loading sav file...")
                ui_logger.info("Loading sav file: "+path)
                loaded_sav = io.readsav(path, python_dict=True)
                # print(loaded_sav)
                try:
                    flap_object = convert_dict_to_flap.convert_raw(loaded_sav, skip_keys=[])
                    self.data = flap_object
                    self.loadSuccessful = True
                except TypeError('loaded_sav is not a dictionary of a raw sav file'):
                    self.progresslogTextEdit.append('loaded_sav is not a dictionary of a raw sav file')
                    ui_logger.error('loaded_sav is not a dictionary of a raw sav file', exc_info=True)
                except Exception as e:
                    ui_logger.error("Exception occurred during dict to flap conversion:", exc_info=True)
            else:
                self.progresslogTextEdit.append("Unknown data format, no data loaded")
                ui_logger.warning("Unknown data format, no data loaded")

        except Exception as e:
            self.progresslogTextEdit.append('Loading ERROR')
            ui_logger.error('Error during loading', exc_info=True)

        if self.loadSuccessful is True:
            self.progresslogTextEdit.append("File loaded")
            ui_logger.info("File loaded")
            self.updateSignalParameters()
            # reset selected channels to empty
            self.channelSelected = []
            self.channelnumberLabel.setText(str(0))
        self.savesignalButton.setEnabled(self.loadSuccessful)
        self.selectchannelsButton.setEnabled(self.loadSuccessful)
    def savesignal(self):
        try:
            path = QtWidgets.QFileDialog.getSaveFileName()[0]
            filename = (path.split('/'))[-1]+'.flapdata'
            flap.save(self.data, filename=filename)
            self.progresslogTextEdit.append('Saved signals')
            ui_logger.info('Saved signals to: ' + filename)
        except Exception as e:
            self.progresslogTextEdit.append('Saving ERROR')
            ui_logger.error('Error during saving', exc_info=True)

    def selectchannels(self):
        # init window
        self.window = QtWidgets.QDialog()
        self.window.setModal(True) #disable main window until channels being selected

        self.ui = Ui_ChannelsWindow()
        self.ui.setupUi(self.window)
        # define buttons
        def selectAll():
            for cb in self.CB:
                cb.setChecked(True)
        def deselectAll():
            for cb in self.CB:
                cb.setChecked(False)
        def returnSelected():
            self.progresslogTextEdit.append('Selected channels:')
            ui_logger.info('Selected channels')
            j = 0
            self.channelSelected = []
            for i, cb in enumerate(self.CB):
                self.channelSelected.append(cb.isChecked())
                if cb.isChecked():
                    self.progresslogTextEdit.append(self.channelID[i])
                    j += 1
            self.progresslogTextEdit.append('----====----')
            self.channelnumberLabel.setText(str(j))
            if j > 0:
                self.calcgroupBox.setEnabled(self.loadSuccessful)
            else:
                self.calcgroupBox.setEnabled(False)
            self.window.close()    
        # set up checkBox with channel IDs
        channelCB = []
        for i in range(len(self.channelID)):
            w = QtWidgets.QCheckBox(self.channelID[i], self.window)
            w.setObjectName(self.channelID[i]+'CheckBox')
            w.move(120, i * 20)
            if (self.channelSelected != []) and (self.channelSelected[i] is True):
                w.setChecked(True)
            channelCB.append(w)
        self.CB = channelCB
        # connect buttons
        self.ui.selectallButton.clicked.connect(selectAll)
        self.ui.deselectallButton.clicked.connect(deselectAll)
        self.ui.doneButton.clicked.connect(returnSelected)
        self.window.show()

    def quickanddirtysetting(self):
        self.progresslogTextEdit.append('Quick and dirty button pressed')
        ui_logger.info('Quick and dirty button pressed')
        ### update stft settings

    def updateSignalParameters(self):
        self.channelID = []
        n = self.data.data.shape[-1]
        self.datapointsLabel.setText(str(n))
        _time = self.data.get_coordinate_object('Time') #presumably in [s] 2b checked
        fs = 1./_time.step[0]/1000 # kHz
        self.samplingfrequencyLabel.setText('{:.0f}'.format(fs)+' kHz')
        dt = n/fs #ms
        self.timerangeLabel.setText('{:.0f}'.format(dt)+' ms')
        _id = self.data.get_coordinate_object('Channels').values
        for ch in _id:
            self.channelID.append(str(ch).replace("'","").replace("b",""))
    
    def setOtherGrey(self):
        self.stftwindowtypeComboBox.setEnabled(self.stftRadioButton.isChecked())
        self.stftlengthLineEdit.setEnabled(self.stftRadioButton.isChecked())
        self.cwtwindowtypeComboBox.setEnabled(self.cwtRadioButton.isChecked())
        self.cwtorderLineEdit.setEnabled(self.cwtRadioButton.isChecked())
        self.cwtscaleLineEdit.setEnabled(self.cwtRadioButton.isChecked())
        
    def setGrey(self):
        self.toroidalCheckBox.setEnabled(self.domodenumbersCheckBox.isChecked())
        self.poloidalCheckBox.setEnabled(self.domodenumbersCheckBox.isChecked())
        self.averageLineEdit.setEnabled(self.domodenumbersCheckBox.isChecked())
        self.modelowLineEdit.setEnabled(self.domodenumbersCheckBox.isChecked())
        self.modehighLineEdit.setEnabled(self.domodenumbersCheckBox.isChecked())
        self.modestepLineEdit.setEnabled(self.domodenumbersCheckBox.isChecked())

class graph():
    '''
    Plot class that creates a plot on the specified verticalLayout widget.
    '''

    def __init__(self, verticalLayout, x_label=None, y_label=None,
                 scale='log', showHint=False, figure=None,
                 canvas=None, toolBar=True, sharex=None):
        plt.rcParams.update({'font.size': 12})
        if figure is None:
            self.figure = plt.Figure(dpi=100)
        else:
            self.figure = figure

        if canvas == None:
            self.canvas = FigureCanvas(self.figure)
        else:
            self.canvas = canvas

        self.canvas.setParent(None)
        self.canvas.setSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Expanding)
        self.canvas.updateGeometry()
        verticalLayout.addWidget(self.canvas)
        if toolBar:
            self.plt_toolbar = NavigationToolbar(self.canvas, None)
            verticalLayout.addWidget(self.plt_toolbar)
        self.plot_ax = self.figure.add_subplot(111, sharex=sharex)
        self.figure.subplots_adjust(left=0.15, right=0.95,
                                    bottom=0.15, top=0.95,
                                    hspace=0.2, wspace=0.2)
        if showHint:
            self.canvas.mpl_connect('motion_notify_event', self.on_plot_hover)
            self.txt = self.plot_ax.text(0, 0, '', fontsize='x-small')
        #        self.plot_ax.set_yscale(scale, nonpsy='clip')
        self.plot_ax.set_yscale(scale)
        # self.canvas.mpl_connect('button_press_event', self.on_middle_autoScale)

        self.canvas.setSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Ignored)
        self.background1 = None
        self.draw_cid = self.canvas.mpl_connect('draw_event', self.grab_background)
        self.timeSpan = None

        if x_label is not None:
            self.plot_ax.set_xlabel(x_label)
        if y_label is not None:
            self.plot_ax.set_ylabel(y_label)

    def grab_background(self, line=None):
        '''
        Grab background for blitting
        '''
        canvas = self.figure.canvas
        if not self.timeSpan == None:
            self.timeSpan.set_visible(False)
        canvas.mpl_disconnect(self.draw_cid)
        canvas.draw_idle()
        self.background1 = self.canvas.copy_from_bbox(self.plot_ax.bbox)
        self.draw_cid = canvas.mpl_connect('draw_event', self.grab_background)

    def blit(self, line):
        '''
        Method for dafe blitting
        '''
        line.set_visible(True)
        self.canvas.restore_region(self.background1)
        self.canvas.mpl_disconnect(self.draw_cid)
        self.plot_ax.draw_artist(line)
        self.draw_cid = self.canvas.mpl_connect('draw_event', self.grab_background)
        self.canvas.update()

    def on_plot_hover(self, event):
        for curve in self.plot_ax.get_lines():
            if curve.contains(event)[0]:
                try:
                    float(event.xdata)
                    float(event.ydata)
                except:
                    continue

                self.txt.set_x(event.xdata)
                self.txt.set_y(event.ydata)
                self.txt.set_text(curve.get_label())
                self.blit(self.txt)

    def setConnectID(self, id):
        self.id = id

    def getConnectID(self):
        return self.id

    def showToolbar(self):
        self.plt_toolbar.show()

    def on_middle_autoScale(self, event):
        if event.button == 2:
            self.plot_ax.relim()
            self.plot_ax.autoscale()
            self.figure.tight_layout()
            self.canvas.draw_idle()


if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    window = MyApp()
    window.show()
    sys.exit(app.exec_())
    