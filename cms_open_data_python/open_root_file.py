import numpy as np
import matplotlib.pylab as plt

import uproot
import awkward as ak


infile_name = 'root://eospublic.cern.ch//eos/opendata/cms/derived-data/AOD2NanoAODOutreachTool/ForHiggsTo4Leptons/SMHiggsToZZTo4L.root'

infile = uproot.open(infile_name)

print(type(infile))


keys = infile.keys()

print(keys)


events = infile['Events']

print(type(events))


branches = infile['Events'].keys()

for branch in branches:
    print(f"{branch:20s} {infile['Events'][branch]}")