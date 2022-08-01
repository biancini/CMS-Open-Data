import numpy as np
import matplotlib.pylab as plt
import time

import uproot
import awkward as ak

# Depending on if you downloaded the file or not, you'll use either
infile_name = 'root://eospublic.cern.ch//eos/opendata/cms/derived-data/AOD2NanoAODOutreachTool/ForHiggsTo4Leptons/SMHiggsToZZTo4L.root'
# or 
#infile_name = 'SMHiggsToZZTo4L.root'
# Uncomment the above line if you downloaded the file.

infile = uproot.open(infile_name)

events = infile['Events']

pt = events['Muon_pt']
eta = events['Muon_eta']
phi = events['Muon_phi']

print(pt)
print()

print(pt.array())
print()

print(len(pt.array()))
print()

for i in range(5):
    print(pt.array()[i])

x = 2*pt.array()

print(x[0:5])

print(ak.flatten(pt.array()))

plt.figure()
plt.hist(ak.flatten(pt.array()),bins=100,range=(0,100));
plt.xlabel(r'Muon $p_T$ (GeV/c)',fontsize=14)


# Some helper functions

def energy(m, px, py, pz):    
    E = np.sqrt( (m**2) + (px**2 + py**2 + pz**2))
    return E
   
def invmass(E, px, py, pz):
    m2 = (E**2) - (px**2 + py**2 + pz**2)
   
    if m2 < 0:
        m = -np.sqrt(-m2)
    else:
        m = np.sqrt(m2)
    return m

def convert(pt, eta, phi):
    px = pt * np.cos(phi)
    py = pt * np.sin(phi)
    pz = pt * np.sinh(eta)
    
    return px, py, pz

# Convert momentum to x,y,z components

muon_number = events['nMuon'].array()

pt = events['Muon_pt'].array()
eta = events['Muon_eta'].array()
phi = events['Muon_phi'].array()
muon_q = events['Muon_charge'].array()
mass = events['Muon_mass'].array()

muon_px,muon_py,muon_pz = convert(pt, eta, phi)
muon_e = energy(mass, muon_px, muon_py, muon_pz)

# Do the calculation

masses = []

nevents = len(pt)
print(f"Nevents: {nevents}")

start = time.time()

for n in range(nevents):

    if n%10000==0:
        print(n)

    nmuons = muon_number[n]
    
    e = muon_e[n]
    q = muon_q[n]
    px = muon_px[n] 
    py = muon_py[n]
    pz = muon_pz[n]
    

    if nmuons < 4:
        continue
    
    for i in range(0, nmuons-3):
        for j in range(i+1, nmuons-2):
            for k in range(j+1, nmuons-1):
                for l in range(k+1, nmuons):

                    if q[i] + q[j] + q[k] + q[l] == 0:
                        etot = e[i] + e[j] + e[k] + e[l]
                        pxtot = px[i] + px[j] + px[k] + px[l]
                        pytot = py[i] + py[j] + py[k] + py[l]
                        pztot = pz[i] + pz[j] + pz[k] + pz[l]

                        m = invmass(etot, pxtot, pytot, pztot)
                        masses.append(m)
                        
print(f"Time to run: {(time.time() - start)} seconds") 

# Plot the results

plt.figure()
plt.hist(masses,bins=140,range=(80,150))
plt.xlabel(r'4-muon invariant mass (GeV/c$^2$',fontsize=18)
plt.show()


start = time.time()

muons = ak.zip({
    "px": muon_px,
    "py": muon_py,
    "pz": muon_pz,
    "e": muon_e,
    "q": muon_q,
})

quads = ak.combinations(muons, 4)

mu1, mu2, mu3, mu4 = ak.unzip(quads)

mass_fast = (mu1.e + mu2.e + mu3.e + mu4.e)**2 - ((mu1.px + mu2.px + mu3.px + mu4.px)**2 + (mu1.py + mu2.py + mu3.py + mu4.py)**2 + (mu1.pz + mu2.pz + mu3.pz + mu4.pz)**2)

mass_fast = np.sqrt(mass_fast)

qtot = mu1.q + mu2.q + mu3.q + mu4.q

print(f"Time to run: {(time.time() - start)} seconds") 

plt.hist(ak.flatten(mass_fast[qtot==0]), bins=140,range=(80,150));
plt.xlabel(r'4-muon invariant mass (GeV/c$^2$',fontsize=18)
plt.show()