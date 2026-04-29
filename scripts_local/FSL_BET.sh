#!/bin/bash

echo Brain Extracting:

for sub in data/sub-*/anat/*T1w.nii.gz; do

	brain_file="$(basename "$sub" .nii.gz)_bet_f04_B.nii.gz"
	sub_name="$(basename "$sub" _T1w.nii.gz)/"

	output_folder="derivatives/bet/"

	if [ -f "$output_folder$sub_name$brain_file" ]; then

		echo "file exists of $sub"

	else

		mkdir -p $output_folder$sub_name
		bet $sub $output_folder$sub_name$brain_file -f .4 -B
		echo $sub_name

	fi

done
