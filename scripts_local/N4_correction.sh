#!/bin/bash

echo N4 corretion:

for sub in data/sub-*/anat/*T1w.nii.gz; do
        id=$(basename $sub _T1w.nii.gz)
        if [ -d "derivatives/N4/$id" ]; then
		echo N4  correction already exists
	else
		N4_file="derivatives/N4/"$id"/"$id"_T1w_N4.nii.gz"
		mkdir "derivatives/N4/"$id
		N4BiasFieldCorrection -d 3 -i $sub -o $N4_file
	fi
done
