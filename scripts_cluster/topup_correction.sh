#!/bin/bash

output_folder="derivatives/topup/"

echo "clip functional files"

# clips func files

for sub in data/sub-*/func/*task-rest_bold.nii.gz; do
	brain_file="$(basename "$sub" .nii.gz)_clipped.nii.gz"
	sub_name="$(basename "$sub" _task-rest_bold.nii.gz)/"
	mkdir -p $output_folder$sub_name
	if [ -f "$output_folder$sub_name$brain_file" ]; then
		echo "file exists of $sub"
	else
		fslroi $sub $output_folder$sub_name$brain_file  0 3
	fi
done

echo "clip fmap files"

# clips fmap files

for sub in data/sub-*/fmap/*epi.nii.gz; do
    brain_file="$(basename "$sub" .nii.gz)_clipped.nii.gz"
	sub_name="$(basename "$sub" _dir-RL_epi.nii.gz)/"
	if [ -f "$output_folder$sub_name$brain_file" ]; then
		echo "file exists of $sub"
	else
        fslroi $sub $output_folder$sub_name$brain_file  0 3
	fi
done

echo "calculate topup"

for sub in derivatives/topup/sub-*; do

    sub_id="$(basename "$sub")"
	echo $"$sub_id"

	# merges files of func and fmap
	func_file=$(ls derivatives/topup/"$sub_id"/*-rest_bold_clipped.nii.gz)
	pepolar_file=$(ls derivatives/topup/"$sub_id"/*_dir-RL_epi_clipped.nii.gz)
	merged_file=derivatives/topup/"$sub_id"/$(basename "$sub_id")_merged.nii.gz

    if [ -f "$merged_file" ]; then
        echo "merged file exists of $sub"
	else
		fslmerge -t $merged_file $func_file $pepolar_file
	fi

	# top_up file 
	topup_file=derivatives/topup/"$sub_id"/$(basename "$sub_id")_acq-rest_topup

	if [ -f "$topup_file" ]; then
        echo "topup file exists of $sub"
    else
		fsl_sub topup --imain=$merged_file --datain=code/acq_rest_param.txt --config=b02b0.cnf --out=$topup_file
	fi

done

echo "pepolar fixing:"

# applies topup correction to func files

for sub in derivatives/topup/sub-*; do

    sub_id="$(basename "$sub")"
	echo $"$sub_id"

	# topup file
	topup_file=derivatives/topup/"$sub_id"/$(basename "$sub_id")_acq-rest_topup

	# func files
	func_file=$(ls data/"$sub_id"/func/*task-rest_bold.nii.gz)

	func_corr_file=derivatives/topup/"$sub_id"/$(basename "$sub_id")_task-rest_bold_corr.nii.gz
	if [ -f "$func_corr_file" ]; then
        echo "applied top up file exists of $sub"
    else
		fsl_sub	applytopup  --imain=$func_file --inindex=1 --datain=code/acq_rest_param.txt --topup=$topup_file --method=jac --out=$func_corr_file
	fi

done

