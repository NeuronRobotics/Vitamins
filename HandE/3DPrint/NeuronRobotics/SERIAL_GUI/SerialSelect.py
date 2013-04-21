# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'src/NeuronRobotics/SERIAL_GUI/SerialSelect.ui'
#
# Created: Sun Apr 21 10:38:07 2013
#      by: PyQt4 UI code generator 4.9.3
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s

class Ui_Dialog(object):
    def setupUi(self, Dialog):
        Dialog.setObjectName(_fromUtf8("Dialog"))
        Dialog.resize(238, 213)
        self.buttonBox = QtGui.QDialogButtonBox(Dialog)
        self.buttonBox.setGeometry(QtCore.QRect(-140, 160, 341, 32))
        self.buttonBox.setOrientation(QtCore.Qt.Horizontal)
        self.buttonBox.setStandardButtons(QtGui.QDialogButtonBox.Cancel|QtGui.QDialogButtonBox.Ok)
        self.buttonBox.setObjectName(_fromUtf8("buttonBox"))
        self.comboBox = QtGui.QComboBox(Dialog)
        self.comboBox.setGeometry(QtCore.QRect(10, 120, 201, 31))
        self.comboBox.setObjectName(_fromUtf8("comboBox"))
	import re
	import subprocess
	device_re = re.compile("Bus\s+(?P<bus>\d+)\s+Device\s+(?P<device>\d+).+ID\s(?P<id>\w+:\w+)\s(?P<tag>.+)$", re.I)
	df = subprocess.check_output("lsusb", shell=True)
	wewe = []
	for i in df.split('\n'):
	    if i:
	        info = device_re.match(i)
	        if info:
	            dinfo = info.groupdict()
	            dinfo['device'] = '/dev/bus/usb/%s/%s' % (dinfo.pop('bus'), dinfo.pop('device'))
	            wewe.append(dinfo)
	print len(wewe)
	count = 0
	newlist = []
	while (count < len(wewe)):
		endindex = df.index('\n')
		newlist.append(df[:endindex])
		df = df[endindex + 1:len(df)]
		count = count + 1
	self.comboBox.addItems(newlist)
        self.MainLogo = QtGui.QLabel(Dialog)
        self.MainLogo.setGeometry(QtCore.QRect(60, 0, 111, 121))
        self.MainLogo.setText(_fromUtf8(""))
        self.MainLogo.setPixmap(QtGui.QPixmap(_fromUtf8(":/me/test/hat.png")))
        self.MainLogo.setObjectName(_fromUtf8("MainLogo"))

        self.retranslateUi(Dialog)
#        QtCore.QObject.connect(self.buttonBox, QtCore.SIGNAL(_fromUtf8("accepted()")), Dialog.accept)
#	        QtCore.QObject.connect(self.buttonBox, QtCore.SIGNAL(_fromUtf8("rejected()")), Dialog.reject)
        QtCore.QMetaObject.connectSlotsByName(Dialog)

    def retranslateUi(self, Dialog):
        Dialog.setWindowTitle(QtGui.QApplication.translate("Dialog", "Serial Port Selection", None, QtGui.QApplication.UnicodeUTF8))

import sys
sys.path.append('src/NeuronRobotics/SERIAL_GUI')
import rsrc_rc
