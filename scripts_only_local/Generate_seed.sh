#!/bin/bash

main_path="/mnt/d/SAM-HED_RESTING_STATE/"


for sub in $main_path"derivatives/afni_proc_good/sub-"*; do

	id="$(basename "$sub" )"
	id=${id:0:7}

    if [ -d $id".rest.results/"$id".CORR-NaCC_000_INDIV" ]; then

        echo already ran bilateral NaCC seed map for $id

    else
        
        echo running seed map for $id

        3dNetCorr -inset ${id}.rest.results/errts.${id}.rest.fanaticor+tlrc  \
        -in_rois seeds/Bilateral_NaCC_resampled_bin.nii.gz  \
        -ts_wb_corr -ts_wb_Z -ts_out -ts_indiv -prefix ${id}.rest.results/${id}.CORR-NaCC
        
    fi
done



for sub in $main_path"derivatives/afni_proc_good/sub-"*; do

	id="$(basename "$sub" )"
	id=${id:0:7}

    if [ -d $id".rest.results/"$id".CORR-NaCC_left_000_INDIV" ]; then

        echo already ran left NaCC seed map for $id

    else
        
        echo running seed map for $id

        3dNetCorr -inset ${id}.rest.results/errts.${id}.rest.fanaticor+tlrc  \
        -in_rois seeds/Left_NaCC_resampled_bin.nii.gz  \
        -ts_wb_corr -ts_wb_Z -ts_out -ts_indiv -prefix ${id}.rest.results/${id}.CORR-NaCC_left
        
    fi

done


for sub in $main_path"derivatives/afni_proc_good/sub-"*; do

	id="$(basename "$sub" )"
	id=${id:0:7}

    if [ -d $id".rest.results/"$id".CORR-NaCC_right_000_INDIV" ]; then

        echo already ran right NaCC seed map for $id

    else
        
        echo running seed map for $id

        3dNetCorr -inset ${id}.rest.results/errts.${id}.rest.fanaticor+tlrc  \
        -in_rois seeds/Right_NaCC_resampled_bin.nii.gz  \
        -ts_wb_corr -ts_wb_Z -ts_out -ts_indiv -prefix ${id}.rest.results/${id}.CORR-NaCC_right
        
    fi

done




