# Okay here are the basic principles of what I'm trying to do. I want to
# calculate Rotman parameters based on Matlab code and then generate geometries
# then have python turn those geometries into a shape for HFSS. Then feed back
# s parameter data and run some algorithm (calculate phase error and do genetic
# algorithm?) to redraw the shape?

import io                       # file and stream handling
import codecs                   # encoding for python... probably don't need
import string
import numpy as np              # Numpy provides a high-performance multidimensional array and basic tools to compute with and manipulate these arrays

import matplotlib as mpl
import matplotlib.pyplot as plt # matlab like plotting
import scipy
from scipy import linalg, optimize, io

# https://docs.scipy.org/doc/scipy/reference/
# cluster
# constants
# fftpack
# integrate
# interpolate
# io
# linalg
# ndimage
# odr
# optimize
# signal
# sparse
# spatial
# special
# stats



######### -------- USEFUL NOTES -------- #########
# Amazing notes: http://cs231n.github.io/python-numpy-tutorial/
# scipy.io.loadmat and scipy.io.savemat read and write matlab files
# data = np.genfromtxt(f)
#
#
#
#
#
#

mat_contents = scipy.io.loadmat('RL_coordinates.mat', squeeze_me = True)        #squeeze gets rid of brackets around variables when importing
X = mat_contents['X']
Y = mat_contents['Y']
f = open('rotmanHFSS.py', 'w')
f.write('import ScriptEnv\nScriptEnv.Initialize("Ansoft.ElectronicsDesktop")\noDesktop.RestoreWindow()\noProject = oDesktop.SetActiveProject("RL_template")\noDesign = oProject.SetActiveDesign("RL_template")\noEditor = oDesign.SetActiveEditor("3D Modeler")\noEditor.CreatePolyline(\n')
f.write('    [\n        "NAME:PolylineParameters",\n        "IsPolylineCovered:="    , True,\n        "IsPolylineClosed:="     , True,\n')
f.write('        [\n            "NAME:PolylinePoints",\n')
for i in range(len(X)):
    f.write('            [\n                "NAME:PLPoint",')
    f.write('            \n                "X:="            , "{}mm",'.format(X[i]))
    f.write('            \n                "Y:="            , "{}mm",'.format(Y[i]))
    f.write('            \n                "Z:="            , "1.27mm"\n')
    f.write('            ],\n')
f.write('        ],\n')
f.write('        [\n            "NAME:PolylineSegments",\n')
for i in range(len(X)):
    f.write('            [\n                "NAME:PLSegment",')
    f.write('            \n                "SegmentType:="     , "Line",')
    f.write('            \n                "StartIndex:="      , %d,' % i)
    f.write('            \n                "NoOfPoints:="      , 2\n')
    f.write('            ],\n')
f.write('        ],\n')
f.write('        [\n            "NAME:PolylineXSection",\n')
f.write('            "XSectionType:="	, "None",\n')
f.write('            "XSectionOrient:="	, "Auto",\n')
f.write('            "XSectionWidth:="	, "0mm",\n')
f.write('            "XSectionTopWidth:="	, "0mm",\n')
f.write('            "XSectionHeight:="	, "0mm",\n')
f.write('            "XSectionNumSegments:="	, "0",\n')
f.write('            "XSectionBendType:="	, "Corner"\n')
f.write('        ]\n')
f.write('    ],\n')
f.write('    [\n')
f.write('        "NAME:Attributes",\n')
f.write('        "Name:="		, "Polyline1",\n')
f.write('        "Flags:="		, "",\n')
f.write('        "Color:="		, "(143 175 143)",\n')
f.write('        "Transparency:="	, 0,\n')
f.write('        "PartCoordinateSystem:=", "Global",\n')
f.write('        "UDMId:="		, "",\n')
f.write('        "IsAlwaysHiden:="	, False,\n')
f.write('        "MaterialValue:="	, "\\"vacuum\\"",\n')
f.write('        "SolveInside:="		, True\n')
f.write('    ])\n')
f.write('oProject.Save()')


f.close
#print(X)
