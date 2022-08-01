#include<cstdio>
#include<cstdlib>
#include<iostream>

#include "TROOT.h"
#include "TTree.h"
#include "TFile.h"
#include "TRandom.h"
#include "TH1F.h"

int main() {

	// Here's the input file
	// Without the 'recreate' argument, ROOT will assume this file exists to be read in.
	TFile f("tree.root");

	// Let's make an output file which we'll use to save our
	// histogram
	TFile fout("output.root","recreate");

	// We define an histogram for the transverse momentum of the jets
	// The arguments are as follow
	// * Internal name of the histogram
	// * Title that will be used if the histogram is plotted
	// * Number of bins
	// * Low edge of the lowest bin
	// * High edge of the highest bin
	TH1F h1("h1","jet pT (GeV/c)",50,0,150);

	// We will now "Get" the tree from the file and assign it to
	// a new local variable.
	TTree *input_tree = (TTree*)f.Get("t1");

	Float_t met; // Missing energy in the transverse direction.

	Int_t njets; // Necessary to keep track of the number of jets
	// We'll define these assuming we will not write information for
	// more than 16 jets. We'll have to check for this in the code otherwise
	// it could crash!
	Float_t pt[16];
	Float_t eta[16];
	Float_t phi[16];

	// Assign these variables to specific branch addresses
	input_tree->SetBranchAddress("met",&met);
	input_tree->SetBranchAddress("njets",&njets);
	input_tree->SetBranchAddress("pt",&pt);
	input_tree->SetBranchAddress("eta",&eta);
	input_tree->SetBranchAddress("phi",&phi);

	// Get the number of events in the file
	Int_t nevents = input_tree->GetEntries();

	for (Int_t i=0;i<nevents;i++) {

			// Get the values for the i`th event and fill all our local variables
			// that were assigned to TBranches
			input_tree->GetEntry(i);

			// Print the number of jets in this event
			printf("%d\n",njets);

			// Print out the momentum for each jet in this event
			for (Int_t j=0;j<njets;j++) {
					printf("%f,%f,%f\n",pt[j], eta[j], phi[j]);

					// Fill the histogram with each value of pT
					h1.Fill(pt[j]);
			}
	}

	fout.cd();
	h1.Write();
	fout.Close();

	return 0;
}