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
from rotmanfunctions import HFSS_scripter
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

mat_contents = scipy.io.loadmat('RL_coordinates.mat', squeeze_me = True)        # get coordinates from matlab -- squeeze gets rid of brackets around variables when importing
X = mat_contents['X']
Y = mat_contents['Y']
HFSS_scripter(X,Y)  # Write a python script that can be run by HFSS
#print(X)
