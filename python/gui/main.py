# -*- coding: utf-8 -*-
"""
Created on Sat Jul 27 12:22:10 2019

@author: poloskei
"""
import matplotlib.pyplot as plt
from matplotlib.colors import ListedColormap
from matplotlib import gridspec
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
class NavigationToolbar(NavigationToolbar):
    toolitems = [t for t in NavigationToolbar.toolitems if
                  t[0] in ('Home', 'Zoom', 'Save', 'Pan')]
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
qtPlotHelpFile = "plot_help.ui"
Ui_MainWindow, QtBaseClass = uic.loadUiType(qtCreatorFile)
Ui_ChannelsWindow, _ = uic.loadUiType(qtChannelsFile)
Ui_PlotOptionsWindow, _ = uic.loadUiType(qtPlotOptionsFile)
Ui_PlotHelpWindow, _ = uic.loadUiType(qtPlotHelpFile)

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
        self.loadsignalButton.clicked.connect(self.loadSignal)
        self.savesignalButton.clicked.connect(self.saveSignal)
        self.selectchannelsButton.clicked.connect(self.selectChannels)
        self.stftRadioButton.toggled.connect(self.setOtherGrey)
        self.quickanddirtyButton.clicked.connect(self.quickAndDirtySetting)
        self.domodenumbersCheckBox.clicked.connect(self.setGrey)
        self.startcalculationButton.clicked.connect(self.startCalculation)
        # connect buttons - part 2 - processed data
        self.loadprocessedsignalButton.clicked.connect(self.loadProcessedSignal)
        self.saveprocessedsignalButton.clicked.connect(self.saveProcessedSignal)
        # connect buttons - part 3 - detailed plotting
        self.openplottinginterfaceButton.clicked.connect(self.openPlotOptions)
        # connect buttons - part 4 - quick plotting
        self.quickplotButton.clicked.connect(self.doQuickPlot)
        self.hintCheckBox.clicked.connect(self.tryRemoveText)
        self.plothelpButton.clicked.connect(self.openPlotHelp)
        # connect menu
        # self.actionReset.triggered.connect(self.__init__)

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

    def loadSignal(self):
        ui_logger.debug('Loading signal started')
        self.loadSuccessful = False
        self.data.__init__()
        try:
            path = QtWidgets.QFileDialog.getOpenFileName()[0]

            if path.count('.') == 0:
                print('file has no extension we dont know what kind of file we shoudl read and how')
                return
            extension = (path.split('.'))[-1]

            if extension == "flapdata":
                self.progresslogTextEdit.append('Loading flap object...')
                ui_logger.info('Loading flap object: ' + path)
                self.data.load_flap_raw_dump(path)
                self.loadSuccessful = True
            elif extension == "sav":
                self.progresslogTextEdit.append("Loading sav file...")
                ui_logger.info("Loading sav file: " + path)
                self.data.load_raw_sav(path)
                ui_logger.debug("Finished loading raw sav")
                self.loadSuccessful = True
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

    def saveSignal(self):
        ui_logger.debug('Saving signal started')
        try:
            path = QtWidgets.QFileDialog.getSaveFileName()[0]
            # core.save_pynwt(self.data, path)
            self.data.save(path)
            self.progresslogTextEdit.append('Saved signals')
            ui_logger.info('Saved signals to: ' + path + ".pynwt")
        except Exception as e:
            self.progresslogTextEdit.append('Saving ERROR')
            ui_logger.error('Error during saving', exc_info=True)
    
    def loadProcessedSignal(self):
        ui_logger.debug('Loading processed signal started')
        self.loadSuccessful = False
        self.data.__init__()
        try:
            path = QtWidgets.QFileDialog.getOpenFileName()[0]
            if path.count('.') == 0:
                print('file has no extension we dont know what kind of file we shoudl read and how')
                return
            extension = (path.split('.'))[-1]
            if extension == "pynwt":
                self.progresslogTextEdit.append('Loading flap object...')
                ui_logger.info('Loading flap object: ' + path)
                self.data = load_pynwt(path)
                self.loadSuccessful = True
            elif extension == "sav":
                self.progresslogTextEdit.append("Loading processed sav file...")
                ui_logger.info("Loading sav file: " + path)
                self.data.load_proc_sav(path)
                try: #check if it indeed was a processed data...
                    _ = self.data.transforms.get_coordinate_object('Transf_timeax').valuess
                    self.loadSuccessful = True
                except:
                    self.progresslogTextEdit.append('Loading ERROR')
            else:
                self.progresslogTextEdit.append("Unknown data format, no data loaded")
                ui_logger.warning("Unknown data format, no data loaded")
        except Exception as e:
            self.progresslogTextEdit.append('Loading ERROR')
            ui_logger.error('Error during processed data loading', exc_info=True)
            self.loadSuccessful = False
            

        if self.loadSuccessful is True:
            self.progresslogTextEdit.append("Processed file loaded")
            ui_logger.info("Processed file loaded")
            self.updateSignalParameters()
            # reset selected channels to empty
            self.channelSelected = []
        try:
            nch = self.data.transforms.data.shape[-1]
            self.channelnumberLabel.setText(str(nch))
        except:
            pass
        # self.transformsGB.setEnabled(self.loadSuccessful)
        self.saveprocessedsignalButton.setEnabled(self.loadSuccessful)
        self.selectchannelsButton.setEnabled(self.loadSuccessful)
        self.openplottinginterfaceButton.setEnabled(self.loadSuccessful)
        self.quickplotButton.setEnabled(True)
        self.hintCheckBox.setEnabled(True)
        self.transfDetailsCheckBox.setEnabled(True)
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

    def tryRemoveText(self):
        try:
            self.txt.remove()
            self.canvas.draw()
        except:
            pass
    def addTextToCanvas(self, additional_text=''):
        # self.canvas.create_text(0,0,text = 'cica')
        # self.canvas.draw()
        return

    def doQuickPlot(self):
        ''' plot some '''
        try:
            self.figure.clf()
        except:
            pass
        selectedPlotOption = self.quickplottypeComboBox.currentText()
        # self.addTextToCanvas()
        self.plotTitle = ''
        if selectedPlotOption == 'Spectrogram':  
            self.colormap = plt.get_cmap('inferno')
            self.plottedData = np.abs((self.data.transforms.data)[:,:,0])**0.1
            self.plotTitle = self.data.transforms.exp_id+'_'+(self.data.transforms.get_coordinate_object('Selected_channels').values)[0]

            self.timeax = self.data.transforms.get_coordinate_object('Transf_timeax').values
            self.freqax = self.data.transforms.get_coordinate_object('Transf_freqax').values
            levels = 10
            cbarText = 'Power / a.u.'
        elif selectedPlotOption == 'Modenumber':
            self.colormap = self.modenumberColormap()
            # self.colormap = plt.get_cmap('terrain')
            self.timeax = self.data.transforms.get_coordinate_object('Transf_timeax').values
            self.freqax = self.data.transforms.get_coordinate_object('Transf_freqax').values
            self.plottedData = self.data.modenumbers.data
            levels = np.arange(np.unique(self.plottedData)[0],np.unique(self.plottedData)[-1]+2,dtype=int)-0.5
            txtlevels = np.arange(np.unique(self.plottedData)[0],np.unique(self.plottedData)[-1]+2,dtype=int)
            cbarText = 'Modenumber'
        if self.transfDetailsCheckBox.isChecked():
            # print('here')
            gs = gridspec.GridSpec(2, 1, height_ratios=[5,1]) 
            self.ax = self.figure.add_subplot(gs[0])
            self.cax = self.figure.add_axes([0.82, 0.31, 0.02, 0.57])
            self.textax = self.figure.add_subplot(gs[1])
            self.textax.axis('off')
            line1 = 'Neque porro quisquam'+'\n'
            line2 = 'est qui dolorem ipsum'+'\n'
            line3 = 'quia dolor sit amet,'+'\n'
            line4 = 'consectetur, adipisci velit...'
            self.textax.text(0,0,line1+line2+line3+line3+line4, fontsize = 5)
            self.textax.text(0.33,0,line1+line2+line3+line3+line4, fontsize = 5)
            self.textax.text(0.66,0,line1+line2+line3+line3+line4, fontsize = 5)
            self.figure.subplots_adjust(right=0.8)
        else:
            self.ax = self.figure.add_subplot(111)
            self.figure.subplots_adjust(right=0.8)
            self.cax = self.figure.add_axes([0.82, 0.125, 0.02, 0.755])

        # discards the old graph
        self.ax.clear()
        cm = self.ax.contourf(self.timeax, self.freqax, self.plottedData, cmap=self.colormap, levels = levels)
        self.ax.set_xlabel('Time / s')
        self.ax.set_ylabel('Frequency / kHz')
        self.ax.set_title(self.plotTitle)
        self.colorbar = self.figure.colorbar(cm, cax=self.cax)
        self.colorbar.set_label(cbarText)
        if selectedPlotOption == 'Modenumber':
            if txtlevels[0]*txtlevels[-1]<0:
                minmax0 = np.array([txtlevels[0], 0, txtlevels[-2]])
                minmax0_value = [txtlevels[0], 0, txtlevels[-2]]
            else:
                minmax0 = np.array([txtlevels[0], txtlevels[-2]])
                minmax0_value = [txtlevels[0], txtlevels[-2]]
            self.colorbar.set_ticks(minmax0)
            self.colorbar.set_ticklabels(minmax0_value)            
        # refresh canvas
        self.canvas.draw()

    # def updateQuickPlot(self):
    #     selectedPlotOption = self.quickplottypeComboBox.currentText()
    #     # print('something else is selected for plotting, displayed stuff needs to be updated')
    #     # print(selectedPlotOption)

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
                    act =  ypos #*(hi-lo)+lo
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
                        self.progresslogTextEdit.append('selected modenumber is: '+str(int((high+low)/2)))
                        selectedCmap[:, -1] = 0.05
                    else:
                        selectedCmap[:, -1] = 0.2
                    selectedCmap[ind0:ind1, -1] = 1.
                    selectedCmap = ListedColormap(selectedCmap)
                    # redraw contour with custom colormap with current zoom settings
                    xran = self.ax.get_xlim()
                    yran = self.ax.get_ylim()
                    self.ax.clear()
                    self.ax.contourf(self.timeax, self.freqax, self.plottedData, cmap=selectedCmap)
                    self.ax.set_xlim(xran)
                    self.ax.set_ylim(yran)
                    self.ax.set_xlabel('Time / s')
                    self.ax.set_ylabel('Frequency / kHz')
                    self.ax.set_title(self.plotTitle)
                if event.button == 2:  # middle click -reset plot
                    self.doQuickPlot()
                if event.button == 3:  # right click - reset colormap
                    self.ax.contourf(self.timeax, self.freqax, self.plottedData, cmap=self.colormap)
                self.canvas.draw()

            elif self.ax == event.inaxes:
                # self.progresslogTextEdit.append('contour click')
                t = event.xdata
                f = event.ydata
                indt = np.argmin(np.abs(t - self.timeax))
                indf = np.argmin(np.abs(f - self.freqax))
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
            indt = np.argmin(np.abs(t - self.timeax))
            indf = np.argmin(np.abs(f - self.freqax))
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
        self.transformParameters['fs'] = 300  # kHz
        self.transformParameters['window'] = 'gaussian'
        self.transformParameters['windowlength'] = 200  # data point
        self.transformParameters['order'] = 5
        self.transformParameters['scale'] = 0.1

    def selectChannels(self):
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

    def quickAndDirtySetting(self):
        self.progresslogTextEdit.append('Quick and dirty button pressed')
        ui_logger.info('Quick and dirty button pressed')
        # update stft settings

    def updateSignalParameters(self):
        ui_logger.debug('Updating signal parameters started')
        self.channelID = []
        n = self.data.raw_datapoints
        self.datapointsLabel.setText(str(n))
        timeax = self.data.raw_data.get_coordinate_object('Time').values
        dt = (timeax[-1]-timeax[0])/n  # presumably in [s] 2b checked
        fs = 1. / dt / 1000  # kHz
        self.samplingfrequencyLabel.setText('{:.0f}'.format(fs) + ' kHz')
        ui_logger.debug("Sample frequency extracted")
        dt = n / fs  # ms
        self.timerangeLabel.setText('{:.2f}'.format(timeax[0])+' s +'+'{:.0f}'.format(dt) + ' ms')
        _id = self.data.raw_data.get_coordinate_object('Channels').values
        # for ch in _id:
        #     self.channelID.append(str(ch).replace("'", "").replace("b", ""))
        self.channelID = _id
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

    def startCalculation(self):
        if self.checkInputs():
            self.progresslogTextEdit.append('Doing some math in FLAP')
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

    def openPlotOptions(self):
        self.progresslogTextEdit.append('plot options button pressed')
        # ui_logger.debug('Selecting channels started')
        # init window
        self.window = QtWidgets.QMainWindow()

        self.ui = Ui_PlotOptionsWindow()
        self.ui.setupUi(self.window)
        self.window.show()
        return
    
    def openPlotHelp(self):
        self.window = QtWidgets.QDialog()

        self.ui = Ui_PlotHelpWindow()
        self.ui.setupUi(self.window)
        self.window.show()      
        
        #      self.window.setModal(True)  # disable main window until channels being selected

        # self.ui = Ui_ChannelsWindow()
        # self.ui.setupUi(self.window)
    def modenumberColormap(self):
        cmap = plt.get_cmap('hsv')
        _ = cmap(np.arange(cmap.N))
        _ = _[0:int(cmap.N/1.2),:] #cut top part (not making it cyclical)
        cmap = ListedColormap(_)
        return cmap
    
# class plotOptionWindow(self):
#     def __init__(self):
#         QtWidgets.QMainWindow.__init__(self)
#         Ui_PlotOptionsWindow.__init__(self)
#         self.setupUi(self)
#         print()

if __name__ == "__main__":
    ui_logger.debug('Application started')
    app = QtWidgets.QApplication(sys.argv)
    window = MyApp()
    window.show()
    sys.exit(app.exec_())
