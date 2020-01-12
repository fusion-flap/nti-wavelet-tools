# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'C:\Users\Anna\Documents\NTI_Wavelet_Tools\NTI_Wavelet_Tools\trunk\python\nti_wavelet_preprocessing_gui.ui'
#
# Created: Mon Sep 21 11:49:18 2015
#      by: PyQt4 UI code generator 4.10.4
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    def _fromUtf8(s):
        return s

try:
    _encoding = QtGui.QApplication.UnicodeUTF8
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig, _encoding)
except AttributeError:
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig)

class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName(_fromUtf8("MainWindow"))
        MainWindow.resize(792, 453)
        self.centralwidget = QtGui.QWidget(MainWindow)
        self.centralwidget.setObjectName(_fromUtf8("centralwidget"))
        self.graph = PlotWidget(self.centralwidget)
        self.graph.setGeometry(QtCore.QRect(380, 10, 400, 400))
        self.graph.setObjectName(_fromUtf8("graph"))
        self.scroll = QtGui.QScrollArea(self.centralwidget)
        self.scroll.setGeometry(QtCore.QRect(10, 10, 201, 171))
        self.scroll.setWidgetResizable(True)
        self.scroll.setObjectName(_fromUtf8("scroll"))
        self.scrollAreaWidgetContents = QtGui.QWidget()
        self.scrollAreaWidgetContents.setGeometry(QtCore.QRect(0, 0, 199, 169))
        self.scrollAreaWidgetContents.setObjectName(_fromUtf8("scrollAreaWidgetContents"))
        self.verticalLayout = QtGui.QVBoxLayout(self.scrollAreaWidgetContents)
        self.verticalLayout.setObjectName(_fromUtf8("verticalLayout"))
        self.label = QtGui.QLabel(self.scrollAreaWidgetContents)
        self.label.setAutoFillBackground(False)
        self.label.setObjectName(_fromUtf8("label"))
        self.verticalLayout.addWidget(self.label)
        self.scroll.setWidget(self.scrollAreaWidgetContents)
        self.widget = QtGui.QWidget(self.centralwidget)
        self.widget.setGeometry(QtCore.QRect(250, 60, 111, 121))
        self.widget.setObjectName(_fromUtf8("widget"))
        self.verticalLayout_2 = QtGui.QVBoxLayout(self.widget)
        self.verticalLayout_2.setMargin(0)
        self.verticalLayout_2.setObjectName(_fromUtf8("verticalLayout_2"))
        self.pushButton = QtGui.QPushButton(self.widget)
        self.pushButton.setObjectName(_fromUtf8("pushButton"))
        self.verticalLayout_2.addWidget(self.pushButton)
        spacerItem = QtGui.QSpacerItem(20, 40, QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Expanding)
        self.verticalLayout_2.addItem(spacerItem)
        self.plotOptions = QtGui.QComboBox(self.widget)
        self.plotOptions.setObjectName(_fromUtf8("plotOptions"))
        self.verticalLayout_2.addWidget(self.plotOptions)
        self.plotButton = QtGui.QPushButton(self.widget)
        self.plotButton.setObjectName(_fromUtf8("plotButton"))
        self.verticalLayout_2.addWidget(self.plotButton)
        MainWindow.setCentralWidget(self.centralwidget)
        self.menubar = QtGui.QMenuBar(MainWindow)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 792, 21))
        self.menubar.setObjectName(_fromUtf8("menubar"))
        self.menuFile = QtGui.QMenu(self.menubar)
        self.menuFile.setObjectName(_fromUtf8("menuFile"))
        self.menuRead_File = QtGui.QMenu(self.menuFile)
        self.menuRead_File.setObjectName(_fromUtf8("menuRead_File"))
        self.menuHelp = QtGui.QMenu(self.menubar)
        self.menuHelp.setObjectName(_fromUtf8("menuHelp"))
        MainWindow.setMenuBar(self.menubar)
        self.statusbar = QtGui.QStatusBar(MainWindow)
        self.statusbar.setObjectName(_fromUtf8("statusbar"))
        MainWindow.setStatusBar(self.statusbar)
        self.actionRead_Binary_File = QtGui.QAction(MainWindow)
        self.actionRead_Binary_File.setObjectName(_fromUtf8("actionRead_Binary_File"))
        self.actionRead_Text_File = QtGui.QAction(MainWindow)
        self.actionRead_Text_File.setObjectName(_fromUtf8("actionRead_Text_File"))
        self.menuRead_File.addAction(self.actionRead_Binary_File)
        self.menuRead_File.addAction(self.actionRead_Text_File)
        self.menuFile.addAction(self.menuRead_File.menuAction())
        self.menubar.addAction(self.menuFile.menuAction())
        self.menubar.addAction(self.menuHelp.menuAction())

        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        MainWindow.setWindowTitle(_translate("MainWindow", "NTI Wavelet Preprocessing Tool", None))
        self.label.setText(_translate("MainWindow", "Data", None))
        self.pushButton.setText(_translate("MainWindow", "Show Data", None))
        self.plotButton.setText(_translate("MainWindow", "Plot", None))
        self.menuFile.setTitle(_translate("MainWindow", "File", None))
        self.menuRead_File.setTitle(_translate("MainWindow", "Read File", None))
        self.menuHelp.setTitle(_translate("MainWindow", "Help", None))
        self.actionRead_Binary_File.setText(_translate("MainWindow", "Read Binary File", None))
        self.actionRead_Text_File.setText(_translate("MainWindow", "Read Text File", None))

from pyqtgraph import PlotWidget

if __name__ == "__main__":
    import sys
    app = QtGui.QApplication(sys.argv)
    MainWindow = QtGui.QMainWindow()
    ui = Ui_MainWindow()
    ui.setupUi(MainWindow)
    MainWindow.show()
    sys.exit(app.exec_())

