# -*- coding: utf-8 -*-
"""
Created on Sat Jul 27 12:22:10 2019

@author: poloskei
"""
import matplotlib.pyplot as plt
import numpy as np
import sys
sys.path.append('./LIB')
import datetime as dttm
import calendar as clndr

from PyQt5 import QtCore, QtGui, QtWidgets, uic
from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg as FigureCanvas
from matplotlib.backends.backend_qt5agg import NavigationToolbar2QT as NavigationToolbar

# load UI
qtCreatorFile = "gui_layout.ui"
qtChannelsFile = "channel_selection.ui"
Ui_MainWindow, QtBaseClass = uic.loadUiType(qtCreatorFile)
Ui_ChannelsWindow, _ = uic.loadUiType(qtChannelsFile)

class MyApp(QtWidgets.QMainWindow, Ui_MainWindow):
    def __init__(self):
        QtWidgets.QMainWindow.__init__(self)
        Ui_MainWindow.__init__(self)
        self.setupUi(self)
        self.progresslogTextEdit.append('Welcome!')
        
        #data storage structures
        self.channelID = []
        self.channelphi = []
        self.channeltheta = []
        self.channelrho = []
        self.data = []
        self.timeax = []
        self.channelselection = []
        self.channelnumberLabel.setText(str(len(self.channelselection)))
        
        #settings
        
        #connect buttons
        self.loadsignalButton.clicked.connect(self.loadsignal)
        self.selectchannelsButton.clicked.connect(self.selectchannels)
        self.quickanddirtyButton.clicked.connect(self.quickanddirtysetting)
    def loadsignal(self):
        try:
            path = QtWidgets.QFileDialog.getOpenFileName()[0]
            ####LOAD SIGNAL HERE####
            
            ###code missing filled up with random stuff
            
            ########################
            self.channelID = ['Ch1', 'Ch2', 'Ch3','Ch1', 'Ch2', 'Ch3','Ch1', 'Ch2', 'Ch3','Ch1', 'Ch2', 'Ch3']
            self.channelphi = np.array([0.,10.,20.])
            self.channeltheta = np.array([1,2,3])
            self.channelrho = np.array([1,2,3])
            self.channelselection = np.zeros(len(self.channelID))
            
            n = 10000
            self.data = np.random.randn(3,n)
            fs = 200e3 #Hz
            dt = 1./fs
            self.timeax = np.arange(n)*dt
                                   
            self.progresslogTextEdit.append('Signal loaded!')
            self.datapointsLabel.setText(str(len(self.timeax)))
            self.samplingfrequencyLabel.setText('{:.2f}'.format(fs/1000.) + ' kHz')
            self.timerangeLabel.setText('{:.3f}'.format(self.timeax[0])+' - '+'{:.3f}'.format(self.timeax[-1])+' s')
        except:
            self.progresslogTextEdit.append('cica')
    
    def selectchannels(self):
        def setchannelsselected(self):
            print('thing')
        self.progresslogTextEdit.append('Select channels button pressed')
        Ui_ChannelsWindow, _ = uic.loadUiType(qtChannelsFile)
        self.channelswindow = QtWidgets.QMainWindow()
        Ui_ChannelsWindow.__init__(self.channelswindow)
        bt = QtWidgets.QPushButton('Select', self.channelswindow)
        bt.move(0,0)
        bt.clicked.connect(setchannelsselected)
        channelCB = []
        for i in range(len(self.channelID)):
            w = QtWidgets.QCheckBox(self.channelID[i], self.channelswindow)
            w.move(100,i*20)
            channelCB.append(w)
        self.channelswindow.show()
    def quickanddirtysetting(self):
        self.progresslogTextEdit.append('Quick and dirty button pressed')
        ### update stft settings

class graph():
    '''
    Plot class that creates a plot on the specified verticalLayout widget. 
    '''  
    def __init__(self, verticalLayout, x_label = None, y_label = None, 
                 scale = 'log', showHint = False, figure = None,
                 canvas= None, toolBar=True, sharex = None):
        plt.rcParams.update({'font.size': 12})
        if figure is None:
            self.figure = plt.Figure(dpi=100)
        else:
            self.figure = figure

        if canvas==None:
            self.canvas = FigureCanvas(self.figure)
        else:
            self.canvas = canvas
            
        self.canvas.setParent(None)
        self.canvas.setSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Expanding)
        self.canvas.updateGeometry()
        verticalLayout.addWidget(self.canvas)
        if toolBar:
            self.plt_toolbar = NavigationToolbar(self.canvas,None)
            verticalLayout.addWidget(self.plt_toolbar)
        self.plot_ax = self.figure.add_subplot(111, sharex=sharex)
        self.figure.subplots_adjust(left=0.15,right=0.95,
                            bottom=0.15,top=0.95,
                            hspace=0.2,wspace=0.2)
        if showHint:
            self.canvas.mpl_connect('motion_notify_event', self.on_plot_hover)
            self.txt = self.plot_ax.text(0, 0, '', fontsize = 'x-small')   
#        self.plot_ax.set_yscale(scale, nonpsy='clip')
        self.plot_ax.set_yscale(scale) 
        # self.canvas.mpl_connect('button_press_event', self.on_middle_autoScale)
        
        self.canvas.setSizePolicy(QtWidgets.QSizePolicy.Expanding,QtWidgets.QSizePolicy.Ignored)
        self.background1 = None
        self.draw_cid = self.canvas.mpl_connect('draw_event', self.grab_background)
        self.timeSpan = None
 
        if x_label is not None:
            self.plot_ax.set_xlabel(x_label)         
        if y_label is not None:
            self.plot_ax.set_ylabel(y_label)

        
    def grab_background(self, line = None):
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
        self.id= id
    
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