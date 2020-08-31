# -*- coding: utf-8 -*-
"""
Created on Sat Jul 27 12:22:10 2019

@author: poloskei
"""
import matplotlib.pyplot as plt
from matplotlib.colors import ListedColormap
import sys
import scipy
import numpy as np
import copy

from PyQt5 import QtWidgets, uic
from PyQt5.QtCore import QRegExp
from PyQt5.QtGui import QRegExpValidator
from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg as FigureCanvas
from matplotlib.backends.backend_qt5agg import NavigationToolbar2QT as NavigationToolbar
# redefine NavigationToolbar with custom available buttons
# class NavigationToolbar(NavigationToolbar):
#     toolitems = [t for t in NavigationToolbar.toolitems if
#                   t[0] in ('Home', 'Zoom', 'Save')]
import flap
import logging

sys.path.append(r"..\utility")
import convert_dict_to_flap
sys.path.append(r"..\core")
import core

# load UI
qtCreatorFile = "gui_layout.ui"
qtChannelsFile = "channel_selection.ui"
qtPlotOptionsFile = "plot_options.ui"
Ui_MainWindow, QtBaseClass = uic.loadUiType(qtCreatorFile)
Ui_ChannelsWindow, _ = uic.loadUiType(qtChannelsFile)
Ui_PlotOptionsWindow, _ = uic.loadUiType(qtPlotOptionsFile)

# This command does not overwrite loggers, only needed at initialization
logging.basicConfig(filename='log.log',
                    filemode='w',
                    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
                    datefmt='%y.%b.%d. %H:%M:%S',
                    level=logging.INFO)
ui_logger = logging.getLogger('ui_logger')
ui_logger.setLevel(logging.DEBUG)


class MyApp(QtWidgets.QMainWindow, Ui_MainWindow):
    def __init__(self):
        reg_ex_number = QRegExp('[0-9]+\.?[0-9]*(?:[Ee]\ *-?\ *[0-9]+)?')
        reg_ex_n = QRegExp('[1-9]+[0-9]*')
        reg_ex_int = QRegExp('-?\ *[0-9]*')

        QtWidgets.QMainWindow.__init__(self)
        Ui_MainWindow.__init__(self)
        self.setupUi(self)
        self.progresslogTextEdit.append('Welcome!')
        # checkbox list for select channel
        self.CB = []
        self.channelSelected = []
        # data storage structures
        self.data = core.NWTDataObject()
        self.plottedData = None
        # settings
        self.loadSuccessful = False
        # signal processing parameters
        self.defaultTransformParameters()
        # connect buttons - part 1 - transform
        self.loadsignalButton.clicked.connect(self.loadsignal)
        self.savesignalButton.clicked.connect(self.savesignal)
        self.selectchannelsButton.clicked.connect(self.selectchannels)
        self.stftRadioButton.toggled.connect(self.setOtherGrey)
        self.quickanddirtyButton.clicked.connect(self.quickanddirtysetting)
        self.domodenumbersCheckBox.clicked.connect(self.setGrey)
        self.startcalculationButton.clicked.connect(self.startCalculation)
        # connect buttons - part 2 - processed data
        # self.loadprocessedsignalButton.clicked.connect(self.loadProcessedSignal)
        self.loadprocessedsignalButton.clicked.connect(self.loadProcessedTemp)
        self.saveprocessedsignalButton.clicked.connect(self.saveProcessedSignal)
        # connect buttons - part 3 - detailed plotting
        # self.openplottinginterfaceButton.clicked.connect()
        # connect buttons - part 4 - quick plotting
        self.quickplotButton.clicked.connect(self.doQuickPlot)
        self.hintCheckBox.clicked.connect(self.tryRemoveText)
        self.quickplottypeComboBox.currentIndexChanged.connect(self.updateQuickPlot)

        # set regexp for line edit inputs
        self.samplingfreqLineEdit.setValidator(QRegExpValidator(reg_ex_number, self.samplingfreqLineEdit))
        self.stepLineEdit.setValidator(QRegExpValidator(reg_ex_n, self.stepLineEdit))
        self.stftlengthLineEdit.setValidator(QRegExpValidator(reg_ex_number, self.stftlengthLineEdit))
        self.stftresolutionLineEdit.setValidator(QRegExpValidator(reg_ex_n, self.stftresolutionLineEdit))
        self.cwtorderLineEdit.setValidator(QRegExpValidator(reg_ex_number, self.cwtorderLineEdit))
        self.cwtscaleresLineEdit.setValidator(QRegExpValidator(reg_ex_number, self.cwtscaleresLineEdit))
        self.averageLineEdit.setValidator(QRegExpValidator(reg_ex_n, self.averageLineEdit))
        self.modelowLineEdit.setValidator(QRegExpValidator(reg_ex_number, self.modelowLineEdit))
        self.modehighLineEdit.setValidator(QRegExpValidator(reg_ex_number, self.modehighLineEdit))
        self.modestepLineEdit.setValidator(QRegExpValidator(reg_ex_number, self.modestepLineEdit))

        # setup canvas and toolbar
        self.figure = plt.Figure(dpi=100)
        self.canvas = FigureCanvas(self.figure)
        image = plt.imread('logo.png')
        self.ax = self.figure.add_subplot(111)
        self.ax.imshow(image)
        self.ax.axis('off')
        self.toolbar = NavigationToolbar(self.canvas, self)
        self.quickPlotLayout.addWidget(self.canvas)
        self.quickPlotLayout.addWidget(self.toolbar)
        self.id1 = self.canvas.mpl_connect('button_press_event', self.MouseClickInteraction)
        # if self.hintCB
        self.id2 = self.canvas.mpl_connect('motion_notify_event', self.MouseHoverInteraction)

    def tryRemoveText(self):
        try:
            self.txt.remove()
            self.canvas.draw()
        except:
            pass
    def loadProcessedTemp(self):
        from scipy.io import readsav
        path = 'C:/Users/poloskei/Desktop/work/nti-wavelet-tools/python/gui/testdata/AUGD_35628_tor_bal_processed.sav'
        x = readsav(path, python_dict=True)
        self.data.transforms = x['saved_datablock']['transforms'][0]
        self.data.modenumbers = x['saved_datablock']['modenumbers'][0]
        print(np.shape(x['saved_datablock']['modenumbers'][0]))
        self.data.qs = x['saved_datablock']['qs'][0]
        self.data.freqax = x['saved_datablock']['transf_freqax'][0]
        self.data.timeax = x['saved_datablock']['transf_timeax'][0]
        self.progresslogTextEdit.append('finished loading processed signal')
        self.quickplotButton.setEnabled(True)
        self.hintCheckBox.setEnabled(True)
    
    def doQuickPlot(self):
        ''' plot some random stuff '''
        try:
            self.figure.clf()
        except:
            pass
        # # dummy data to be plotted
        selectedPlotOption = self.quickplottypeComboBox.currentText()
        # print(type(selectedPlotOption), selectedPlotOption)
        if selectedPlotOption == 'Spectrogram':  
            self.colormap = plt.get_cmap('inferno')
            self.plottedData = np.abs(self.data.transforms[:,:,3])**0.1
            levels = 10
        elif selectedPlotOption == 'Modenumber':
            self.colormap = plt.get_cmap('rainbow')
            self.plottedData = np.array(self.data.modenumbers)
            levels = len(np.unique(self.data.modenumbers))
            print(np.unique(self.data.modenumbers))
        #     print(np.shape(self.data.modenumbers))
        # self.data = 10 * np.random.randn(100, 100)
        # self.data[10:12, :] += 50
        # self.data[30:32, :] += 20
        # self.timeax = np.linspace(0, 1, 100)
        # self.freqax = np.linspace(0, 1000, 100)

        self.ax = self.figure.add_subplot(111)
        self.figure.subplots_adjust(right=0.8)
        self.cax = self.figure.add_axes([0.82, 0.11, 0.02, 0.77])

        # discards the old graph
        self.ax.clear()
        cm = self.ax.contourf(self.data.timeax, self.data.freqax, self.plottedData, cmap=self.colormap, levels = levels)
        self.ax.set_xlabel('Time / s')
        self.ax.set_ylabel('Frequency / kHz')
        self.colorbar = self.figure.colorbar(cm, cax=self.cax)
        self.colorbar.set_label('Power / a.u.')
        # refresh canvas
        self.canvas.draw()

    def updateQuickPlot(self):
        selectedPlotOption = self.quickplottypeComboBox.currentText()
        print('something else is selected for plotting, displayed stuff needs to be updated')
        print(selectedPlotOption)

    def MouseClickInteraction(self, event):
        try:  # check if figure is defined or not
            self.cax == event.inaxes
        except:
            return

        if not (self.toolbar._active):  # if no button is activated
            if self.cax == event.inaxes:  # clicking on the colorbar axis
                if event.button == 1:  # left click
                    # get current clicked colorbar value
                    ypos = event.ydata
                    lo, hi = self.colorbar.vmin, self.colorbar.vmax
                    diff = hi - lo
                    act = lo + (hi - lo) * ypos
                    step = self.colorbar.boundaries[1] - self.colorbar.boundaries[0]
                    low = self.colorbar.boundaries[int((act - lo) / step)]
                    high = self.colorbar.boundaries[int((act - lo) / step) + 1]
                    # create new colormap where not selected values' alpha reduced to 0.1
                    ind0 = int(round(((low - lo) / diff) * self.colormap.N))
                    ind1 = int(round(((high - lo) / diff) * self.colormap.N))
                    selectedCmap = (self.colormap)(np.arange(self.colormap.N))
                    selectedPlotOption = self.quickplottypeComboBox.currentText()
                    if selectedPlotOption == 'Spectrogram':
                        p = 0.25  # decay length of opacity
                        if ind0 != 0:
                            m = 1. / (self.colormap.N * p)
                            b = 1. - m * ind0
                            alpha = m * np.arange(ind0) + b
                            alpha[alpha <= 0] = 0.
                            selectedCmap[0:ind0, -1] = alpha
                        if ind1 != self.colormap.N:
                            m = -1. / (self.colormap.N * p)
                            b = 1. - m * (ind1 + self.colormap.N * p)
                            alpha = m * np.arange(ind1, self.colormap.N) + b
                            alpha[alpha <= 0] = 0.
                            alpha[alpha > 1] = 1.
                            selectedCmap[ind1:self.colormap.N, -1] = alpha
                    elif selectedPlotOption == 'Modenumber':
                        selectedCmap[:, -1] = 0
                    else:
                        selectedCmap[:, -1] = 0
                    selectedCmap[ind0:ind1, -1] = 1.
                    selectedCmap = ListedColormap(selectedCmap)
                    # redraw contour with custom colormap with current zoom settings
                    xran = self.ax.get_xlim()
                    yran = self.ax.get_ylim()
                    self.ax.clear()
                    self.ax.contourf(self.data.timeax, self.data.freqax, self.plottedData, cmap=selectedCmap)
                    self.ax.set_xlim(xran)
                    self.ax.set_ylim(yran)
                    self.ax.set_xlabel('Time / s')
                    self.ax.set_ylabel('Frequency / kHz')
                if event.button == 2:  # middle click -reset plot
                    self.doQuickPlot()
                if event.button == 3:  # right click - reset colormap
                    self.ax.contourf(self.data.timeax, self.data.freqax, self.plottedData, cmap=self.colormap)
                self.canvas.draw()

            elif self.ax == event.inaxes:
                # self.progresslogTextEdit.append('contour click')
                t = event.xdata
                f = event.ydata
                indt = np.argmin(np.abs(t - self.data.timeax))
                indf = np.argmin(np.abs(f - self.data.freqax))
                p = (self.plottedData)[indf, indt]
                self.progresslogTextEdit.append('t={:.01f}, f={:.01f}, p={:.01f}'.format(t, f, p))
            else:
                return

    def MouseHoverInteraction(self, event):
        if not self.hintCheckBox.isChecked():
            return
        try:  # check if figure is defined or not
            self.cax == event.inaxes
        except:
            return
        bbox = dict(boxstyle='square',
                    ec=(1., 0.5, 0.5),
                    fc=(1., 1., 1.))
        if event.inaxes == self.ax:
            t = event.xdata
            f = event.ydata
            indt = np.argmin(np.abs(t - self.data.timeax))
            indf = np.argmin(np.abs(f - self.data.freqax))
            p = (self.plottedData)[indf, indt]
            try:
                self.txt.remove()
            except:
                pass
            text = 't={:.4f}, f={:.2f}, p={:.2f}'.format(t, f, p)
            halignment = 'left'
            xran = self.ax.get_xlim()
            if t > ((np.max(xran) - np.min(xran)) * 0.5 + np.min(xran)):
                halignment = 'right'
            self.txt = self.ax.text(t, f, text,
                                    horizontalalignment=halignment,
                                    bbox=bbox)
        else:
            try:
                self.txt.remove()
            except:
                pass
        self.canvas.draw()

    def defaultTransformParameters(self):
        self.transformParameters = {}
        self.transformParameters['type'] = 'STFT'
        self.transformParameters['step'] = 5
        self.transformParameters['fd'] = 300  # kHz
        self.transformParameters['window'] = 'gaussian'
        self.transformParameters['windowlength'] = 200  # data point
        self.transformParameters['order'] = 5
        self.transformParameters['scale'] = 0.1

    def loadsignal(self):
        ui_logger.debug('Loading signal started')
        self.loadSuccessful = False
        try:
            path = QtWidgets.QFileDialog.getOpenFileName()[0]
            if path[-9:] == ".flapdata":
                self.progresslogTextEdit.append('Loading flap object...')
                ui_logger.info('Loading flap object: ' + path)
                self.data.load_flap_raw_dump(path)
                self.loadSuccessful = True
            elif path[-4:] == ".sav":
                self.progresslogTextEdit.append("Loading sav file...")
                ui_logger.info("Loading sav file: " + path)
                self.data.load_raw_sav(path)
                ui_logger.debug("Finished loading raw sav")
                self.loadSuccessful = True
            elif path[-13:] == ".procflapdata":
                self.progresslogTextEdit.append("Trying to load processed sav, please use 'Load processed' button")
                ui_logger.warning("Trying to load processed sav, please use 'Load processed' button")
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
        ui_logger.debug('Saving signal started')
        try:
            path = QtWidgets.QFileDialog.getSaveFileName()[0]
            d = copy.deepcopy(self.data)
            core.save_pynwt(d, path)
            self.progresslogTextEdit.append('Saved signals')
            ui_logger.info('Saved signals to: ' + path)
        except Exception as e:
            self.progresslogTextEdit.append('Saving ERROR')
            ui_logger.error('Error during saving', exc_info=True)

    def selectchannels(self):
        ui_logger.debug('Selecting channels started')
        # init window
        self.window = QtWidgets.QDialog()
        self.window.setModal(True)  # disable main window until channels being selected

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
            w.setObjectName(self.channelID[i] + 'CheckBox')
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
        # update stft settings

    def updateSignalParameters(self):
        ui_logger.debug('Updating signal parameters started')
        self.channelID = []
        n = self.data.raw_datapoints
        self.datapointsLabel.setText(str(n))
        _time = self.data.raw_data.get_coordinate_object('Time')  # presumably in [s] 2b checked
        fs = 1. / _time.step[0] / 1000  # kHz
        self.samplingfrequencyLabel.setText('{:.0f}'.format(fs) + ' kHz')
        ui_logger.debug("Sample frequency extracted")
        dt = n / fs  # ms
        self.timerangeLabel.setText('{:.0f}'.format(dt) + ' ms')
        _id = self.data.raw_data.get_coordinate_object('Channels').values
        for ch in _id:
            self.channelID.append(str(ch).replace("'", "").replace("b", ""))
        ui_logger.debug("Channel labels extracted")

    def setOtherGrey(self):
        self.stftwindowtypeComboBox.setEnabled(self.stftRadioButton.isChecked())
        self.stftlengthLineEdit.setEnabled(self.stftRadioButton.isChecked())
        self.cwtwindowtypeComboBox.setEnabled(self.cwtRadioButton.isChecked())
        self.cwtorderLineEdit.setEnabled(self.cwtRadioButton.isChecked())
        self.cwtscaleresLineEdit.setEnabled(self.cwtRadioButton.isChecked())

    def setGrey(self):
        self.toroidalCheckBox.setEnabled(self.domodenumbersCheckBox.isChecked())
        self.poloidalCheckBox.setEnabled(self.domodenumbersCheckBox.isChecked())
        self.doaverageCheckBox.setEnabled(self.domodenumbersCheckBox.isChecked())
        self.moderangeText.setEnabled(self.domodenumbersCheckBox.isChecked())
        self.modestepText.setEnabled(self.domodenumbersCheckBox.isChecked())
        self.averageLineEdit.setEnabled(self.domodenumbersCheckBox.isChecked())
        self.modelowLineEdit.setEnabled(self.domodenumbersCheckBox.isChecked())
        self.modehighLineEdit.setEnabled(self.domodenumbersCheckBox.isChecked())
        self.modestepLineEdit.setEnabled(self.domodenumbersCheckBox.isChecked())

    def calculate_spectogram(self):
        data_time_ax = self.data.get_coordinate_object('Time')

        fd = self.transformParameters['fd']
        window = self.transformParameters['window']  # Gaussian window requires std
        nperseg = self.transformParameters['windowlength']
        order = self.transformParameters['order']
        scale = self.transformParameters['scale']
        noverlap = nperseg - self.transformParameters['step']

        spectogram_data = scipy.signal.spectogram(x=self.data.data, fs=1. / data_time_ax.step[0], window='hann',
                                                  nperseg=nperseg, noverlap=noverlap
                                                  )  # return_onesided = True, nfft = 1000, detrend = 'constant',

        spectogram_time_ax = flap.Coordinate(name="Time",
                                             unit="s",
                                             mode=flap.CoordinateMode(equidistant=True),
                                             start=data_time_ax.start,
                                             step=data_time_ax.step[0] * self.transformParameters['step'],
                                             dimension_list=[1]
                                             )

        spectogram_freq_ax = flap.Coordinate(name="Frequency",
                                             unit="Hz",
                                             mode=flap.CoordinateMode(equidistant=True),
                                             start=0,
                                             step=1. / data_time_ax.step[0] / 2,
                                             dimension_list=[0]
                                             )

        spectogram = flap.DataObject(
            data_array=spectogram_data,
            data_unit=flap.Unit(name='Power Spectral density', unit='Watt'),
            exp_id=self.data.exp_id,
            coordinates=[spectogram_time_ax, spectogram_freq_ax],
            data_shape=spectogram_data.shape,
        )
        logger.info('Flap object created and filled')

    def startCalculation(self):
        if self.checkInputs():
            self.progresslogTextEdit.append('Doing some mathmagic')
            for i in range(100):
                self.transformProgressBar.setValue(i + 1)
                self.modeProgressBar.setValue(i + 1)
                # place for some math

            self.openplottinginterfaceButton.setEnabled(True)
            self.saveprocessedsignalButton.setEnabled(True)
            self.quickplotButton.setEnabled(True)
            # self.plotresetButton.setEnabled(True)
            self.quickplottypeComboBox.setEnabled(True)
        else:
            self.progresslogTextEdit.append('Some inputs are not okay (marked red)')

    def checkInputs(self):
        def checkIfNumber(LineEdit):
            inputOkayColor = '#c4df9b'
            inputNotOkayColor = '#f6989d'
            var = LineEdit.text()
            try:
                _ = float(var)
                LineEdit.setStyleSheet("background-color:" + inputOkayColor + " ;")
                return True
            except:
                LineEdit.setStyleSheet("background-color:" + inputNotOkayColor + " ;")
                return False

        i = 0  # correct input number
        # check input parameters' validity and mark wrong ones, calculation wont be started until every parameter is correct
        i += checkIfNumber(self.samplingfreqLineEdit)
        i += checkIfNumber(self.stepLineEdit)
        i += checkIfNumber(self.stftlengthLineEdit)
        i += checkIfNumber(self.samplingfreqLineEdit)
        i += checkIfNumber(self.stftresolutionLineEdit)
        # self.samplingfreqLineEdit.setStyleSheet("background-color:"+color+" ;")
        if i == 5:  # checksum for stft
            return True
        else:
            return False
    
    def loadProcessedSignal(self):
        ui_logger.debug('Loading processed signal started')
        # self.loadSuccessful = False
        try:
            path = QtWidgets.QFileDialog.getOpenFileName()[0]
            if path[-6:] == ".pynwt":
                self.progresslogTextEdit.append('Loading flap object...')
                ui_logger.info('Loading flap object: ' + path)
                self.data = load_pynwt(path)
                self.loadSuccessful = True
            elif path[-4:] == ".sav":
                self.progresslogTextEdit.append("Loading processed sav file...")
                ui_logger.info("Loading sav file: " + path)
                self.data.load_proc_sav(path)
                self.loadSuccessful = True
            else:
                self.progresslogTextEdit.append("Unknown data format, no data loaded")
                ui_logger.warning("Unknown data format, no data loaded")
        except Exception as e:
            self.progresslogTextEdit.append('Loading ERROR')
            ui_logger.error('Error during processed data loading', exc_info=True)

        if self.loadSuccessful is True:
            self.progresslogTextEdit.append("Processed file loaded")
            ui_logger.info("Processed file loaded")
            # self.updateSignalParameters()
            # reset selected channels to empty
            self.channelSelected = []
            # self.channelnumberLabel.setText(str(0))
        self.saveprocessedsignalButton.setEnabled(self.loadSuccessful)
        self.selectchannelsButton.setEnabled(self.loadSuccessful)

        return

    def saveProcessedSignal(self):
        ui_logger.debug('Saving processed signal started')
        try:
            path = QtWidgets.QFileDialog.getSaveFileName()[0]
            self.data.save(path)
            self.progresslogTextEdit.append('Saved signals')
            ui_logger.info('Saved signals to: ' + path)
        except Exception as e:
            self.progresslogTextEdit.append('Saving ERROR')
            ui_logger.error('Error during saving', exc_info=True)
        return

    def updatePlotOptions(self):
        self.progresslogTextEdit.append('plot options button pressed')
        return

    # def doQuickPlot(self):
    #     self.progresslogTextEdit.append('do plot button pressed')
    #     return

    def resetPlot(self):
        self.progresslogTextEdit.append('reset plot button pressed')
        return


# class graph():
#     def __init__(self):


class graph():
    '''
    Plot class that creates a plot on the specified verticalLayout widget.
    '''

    def __init__(self, verticalLayout, x_label=None, y_label=None,
                 scale='log', showHint=False, figure=None,
                 canvas=None, toolBar=True, sharex=None):
        ui_logger.debug('Graph initialization started')
        plt.rcParams.update({'font.size': 12})
        if figure is None:
            self.figure = plt.Figure(dpi=100)
        else:
            self.figure = figure

        if canvas is None:
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
        ui_logger.debug('Grabbing background started')
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
        ui_logger.debug('Dafe blitting started')
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
    ui_logger.debug('Application started')
    app = QtWidgets.QApplication(sys.argv)
    window = MyApp()
    window.show()
    sys.exit(app.exec_())
