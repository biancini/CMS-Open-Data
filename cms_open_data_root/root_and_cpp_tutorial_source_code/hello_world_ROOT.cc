#include "TROOT.h"
#include "TTree.h"
#include "TFile.h"
#include "TRandom.h"

#include<cstdio>
#include<cstdlib>
#include<iostream>

// http://physino.xyz/learning/2020/02/11/automate-compilation-of-root-based-c++-program-with-makefile/

// https://root.cern.ch/doc/v610/tree1_8C.html

// setenv LD_LIBRARY_PATH /usr/local/lib/root:/usr/local/lib//usr/lib/x86_64-linux-gnu:/lib/x86_64-linux-gnu/

#include<cstdio>
#include<cstdlib>
#include<iostream>

#include "TROOT.h"
#include "TTree.h"
#include "TFile.h"
#include "TRandom.h"

int main() {

   // Create a ROOT file, f.
   // The first argument, "tree.root" is the name of the file.
   // The second argument, "recreate", will recreate the file, even if it already exists.
   TFile f("tree.root","recreate");

   // A TTree object called t1.
   // The first argument is the name of the object as stored by ROOT.
   // The second argument is a short descriptor.
   TTree t1("t1","A simple Tree with simple variables");

   Float_t met; // Missing energy in the transverse direction.

   Int_t njets; // Necessary to keep track of the number of jets

   // We'll define these assuming we will not write information for
   // more than 16 jets. We'll have to check for this in the code otherwise
   // it could crash!
   Float_t pt[16];
   Float_t eta[16];
   Float_t phi[16];

   // The first argument is ROOT's internal name of the variable.
   // The second argument is the *address* of the actual variable we defined above
   // The third argument defines the *type* of the variable to be stored, and the "F"
   // at the end signifies that this is a float
   t1.Branch("met",&met,"met/F");

   // First we define njets where the syntax is the same as before,
   // except we take care to identify this as an integer with the final
   // /I designation
   t1.Branch("njets",&njets,"njets/I");

   // We can now define the other variables, but we use a slightly different
   // syntax for the third argument to identify the variable that will be used
   // to count the number of entries per event
   t1.Branch("pt",&pt,"pt[njets]/F");
   t1.Branch("eta",&eta,"eta[njets]/F");
   t1.Branch("phi",&phi,"phi[njets]/F");

   Int_t nevents = 1000;

   for (Int_t i=0;i<nevents;i++) {

       // Generate random number between 10-60 (arbitrary)
       met = 50*gRandom->Rndm() + 10;

       // Generate random number between 0-5, inclusive
       njets = gRandom->Integer(6);

       for (Int_t j=0;j<njets;j++) {
           pt[j] =  100*gRandom->Rndm();
           eta[j] =  6*gRandom->Rndm();
           phi[j] =  6.28*gRandom->Rndm() - 3.14;
       }

       // After each event we need to *fill* the TTree
       t1.Fill();
   }

   // After we've run over all the events, we "change directory" to the file object
   // and write the tree to it.
   // We can also print the tree, just as a visual identifier to ourselves that
   // the program ran to completion.
   f.cd();
   t1.Write();
   t1.Print();
   
   return 0;
}
