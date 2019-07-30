#!/usr/bin/python

import sys, os, json, random

if len(sys.argv) != 2:
	sys.exit('Please enter only the file name you which to process.\n'+sys.argv)

fpath = sys.argv[1]

if os.path.exists(fpath) is not True:
	sys.exit('File does not exist or is unreadable\n'+fpath)

with open(fpath, 'r') as f:
	ensemble = json.load(f)

motifs = ensemble["Motifs"]

for motif in motifs:
	for location in motif["Motif_Locations"]:
		source = random.choice(['MEME','Gibbs','Homer'])
		location['Source'] = source

with open('new.json', 'w') as outfile:
	json.dump(ensemble, outfile)
