# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'C:\Users\Anna\Documents\NTI_Wavelet_Tools\NTI_Wavelet_Tools\trunk\python\nti_wavelet_preprocessing_readtext_dialog.ui'
#
# Created: Tue Sep  1 18:49:03 2015
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

class Ui_Dialog(object):
    def setupUi(self, Dialog):
        Dialog.setObjectName(_fromUtf8("Dialog"))
        Dialog.resize(417, 330)
        self.verticalLayout = QtGui.QVBoxLayout(Dialog)
        self.verticalLayout.setObjectName(_fromUtf8("verticalLayout"))
        self.textEdit = QtGui.QTextEdit(Dialog)
        self.textEdit.setVerticalScrollBarPolicy(QtCore.Qt.ScrollBarAsNeeded)
        self.textEdit.setHorizontalScrollBarPolicy(QtCore.Qt.ScrollBarAsNeeded)
        self.textEdit.setReadOnly(True)
        self.textEdit.setObjectName(_fromUtf8("textEdit"))
        self.verticalLayout.addWidget(self.textEdit)
        self.gridLayout = QtGui.QGridLayout()
        self.gridLayout.setObjectName(_fromUtf8("gridLayout"))
        self.label = QtGui.QLabel(Dialog)
        self.label.setObjectName(_fromUtf8("label"))
        self.gridLayout.addWidget(self.label, 0, 0, 1, 1)
        spacerItem = QtGui.QSpacerItem(40, 20, QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Minimum)
        self.gridLayout.addItem(spacerItem, 0, 3, 1, 1)
        self.label_2 = QtGui.QLabel(Dialog)
        self.label_2.setObjectName(_fromUtf8("label_2"))
        self.gridLayout.addWidget(self.label_2, 1, 0, 1, 1)
        spacerItem1 = QtGui.QSpacerItem(40, 20, QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Minimum)
        self.gridLayout.addItem(spacerItem1, 1, 3, 1, 1)
        self.okButton = QtGui.QPushButton(Dialog)
        self.okButton.setObjectName(_fromUtf8("okButton"))
        self.gridLayout.addWidget(self.okButton, 2, 0, 1, 2)
        self.cancelButton = QtGui.QPushButton(Dialog)
        self.cancelButton.setObjectName(_fromUtf8("cancelButton"))
        self.gridLayout.addWidget(self.cancelButton, 2, 2, 1, 1)
        spacerItem2 = QtGui.QSpacerItem(40, 20, QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Minimum)
        self.gridLayout.addItem(spacerItem2, 2, 3, 1, 1)
        self.headerText = QtGui.QLineEdit(Dialog)
        self.headerText.setObjectName(_fromUtf8("headerText"))
        self.gridLayout.addWidget(self.headerText, 1, 1, 1, 2)
        self.delimiterText = QtGui.QLineEdit(Dialog)
        self.delimiterText.setObjectName(_fromUtf8("delimiterText"))
        self.gridLayout.addWidget(self.delimiterText, 0, 1, 1, 2)
        self.verticalLayout.addLayout(self.gridLayout)

        self.retranslateUi(Dialog)
        QtCore.QMetaObject.connectSlotsByName(Dialog)

    def retranslateUi(self, Dialog):
        Dialog.setWindowTitle(_translate("Dialog", "Read Text File", None))
        self.label.setText(_translate("Dialog", "Delimiter:", None))
        self.label_2.setText(_translate("Dialog", "Headersize:", None))
        self.okButton.setText(_translate("Dialog", "OK", None))
        self.cancelButton.setText(_translate("Dialog", "Cancel", None))


if __name__ == "__main__":
    import sys
    app = QtGui.QApplication(sys.argv)
    Dialog = QtGui.QDialog()
    ui = Ui_Dialog()
    ui.setupUi(Dialog)
    Dialog.show()
    sys.exit(app.exec_())

