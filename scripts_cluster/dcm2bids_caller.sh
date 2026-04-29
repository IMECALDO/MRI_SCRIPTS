#!/bin/bash

shopt -s nullglob extglob

mkdir -p RAW/data_organized

echo copying data of subjects:

# organize data from Fernando's Lizcano database
for subdir in RAW/data_raw/*/*; do

	id="${subdir: -3}"

	# copies only relevant data
    if [ -d "RAW/data_organized/sub-$id" ]; then
                echo "data_organized of sub-$id"
        else
		mkdir -p RAW/data_organized/sub-$id
		cp -r --update=none "$subdir"/3D_Sag_T1_MPRAGE_* RAW/data_organized/sub-$id
        cp -r --update=none "$subdir"/Ax_fMRI_Resting_State_HB_* RAW/data_organized/sub-$id
		cp -r --update=none "$subdir"/Ax_fMRI_RS_HB_pepolar_* RAW/data_organized/sub-$id

		echo copied data of sub-$id
	fi
done

echo running dcm2bids

# calls dcm2bids
for subdir in RAW/data_organized/*; do
        if [ -d "data/$(basename $subdir)" ]; then
		echo "BIDS data exists of $(basename $subdir)"
	else
        	sub=$(basename "$subdir" | sed 's/sub-//')
		echo running with $(basename $subdir)
		fsl_sub dcm2bids -d "$subdir" -p "$sub" --config scripts/dcm2bids_config.json -o data --auto_extract_entities
	fi
done

echo finished dcm2bids caller
