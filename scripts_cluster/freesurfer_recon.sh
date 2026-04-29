#!/bin/bash

for sub in derivatives/N4/sub-*; do
	id=$(basename "$sub")

	if [ -d "derivatives/freesurfer/"$id ]; then
		echo "data already reconed"
	else
		echo "running" $sub
		fsl_sub -N $id recon-all -subject $id -i $sub"/"$id"_T1w_N4.nii.gz" -all
	fi

done
