#!/bin/bash

main_path="/mnt/d/SAM-HED_RESTING_STATE/"

for sub in $main_path"derivatives/afni_proc_good/sub-"*; do

    id="$(basename "$sub" )"
	id=${id:0:7}

    cd $id".rest.results/"

    if [ -f "errts."$id".rest.fanaticor+tlrc.nii.gz" ]; then
        echo "errst already in .nii"
    else
        #echo "errts."$id".rest.fanaticor+tlrc.nii.gz"
        #echo "errts."$id".rest.fanaticor+tlrc.BRIK.gz"
        3dAFNItoNIFTI -prefix errts."$id".rest.fanaticor+tlrc.nii.gz errts."$id".rest.fanaticor+tlrc.BRIK.gz
    fi

    if [ -f "anat_final."$id".rest+tlrc.nii.gz" ]; then
        echo "anat already in .nii"
    else
        echo "anat_final."$id".rest+tlrc.BRIK.gz"
        3dAFNItoNIFTI -prefix anat_final."$id".rest+tlrc.nii.gz "anat_final."$id".rest+tlrc.BRIK.gz"
    fi

    cd ..

done