#!/bin/bash

# Should run in derivatives/afni_proc

main_path="/mnt/d/SAM-HED_RESTING_STATE/"

# first for - select few
# second for - all subjects

for sub in 21 27 34 36 37 43 45 49 65 73 83 84 85 87 93; do	
id="sub-0$sub"

#for sub in $main_path"data/sub-"* ; do
#id="$(basename "$sub" )"

echo "Creating afni_proc for" $id

if [ -f "proc."$id".rest" ]; then
        echo "afni proc already created"
else
        echo "creating" $id

        epi=$main_path"derivatives/topup/"$id"/"$id"_task-rest_bold_corr.nii.gz"
		#epi=$main_path"data/"$id"/func/"$id"_task-rest_bold.nii.gz"
        SUMA=$main_path"derivatives/freesurfer/"$id"/SUMA"
        warp=$main_path"derivatives/SSwarper/"$id"/"$id"_anat_warped"


	afni_proc.py                                                                 				                \
        	-subj_id                  $id".rest"                                                                \
	        -blocks                   despike align tlrc volreg blur                                            \
	                                  mask scale                                                                \
	        -radial_correlate_blocks  tcat volreg                                                               \
	        -copy_anat                $warp/anatSS.$id.nii                                                      \
	        -anat_has_skull           no                                                                        \
	        -anat_follower            anat_w_skull anat $warp/anatU.$id.nii                                     \
	        -anat_follower_ROI        aaseg anat                                                                \
	                                  $SUMA/aparc.a2009s+aseg_REN_all.nii.gz                                    \
	        -anat_follower_ROI        aeseg epi                                                                 \
	                                  $SUMA/aparc.a2009s+aseg_REN_all.nii.gz                                    \
	        -anat_follower_ROI        FSvent epi $SUMA/fs_ap_latvent.nii.gz                                     \
	        -anat_follower_ROI        FSWe epi $SUMA/fs_ap_wm.nii.gz                                            \
	        -anat_follower_erode      FSvent FSWe                                                               \
	        -dsets                    $epi                                                                      \
	        -tcat_remove_first_trs    2                                                                         \
	        -align_unifize_epi        local                                                                     \
	        -align_opts_aea           -cost lpc+ZZ -giant_move                                                  \
	                                  -check_flip                                                               \
	        -tlrc_base                MNI152_2009_template_SSW.nii.gz                                           \
	        -tlrc_NL_warp                                                                                       \
	        -tlrc_NL_warped_dsets     $warp/anatQQ.$id.nii $warp/anatQQ.$id.aff12.1D                            \
	                                  $warp/anatQQ.$id"_WARP.nii"                                               \
	        -volreg_align_to          MIN_OUTLIER                                                               \
	        -volreg_align_e2a                                                                                   \
	        -volreg_tlrc_warp                                                                                   \
	        -blur_size                4                                                                         \
	        -mask_epi_anat            yes                                                                       \
	        -html_review_style        pythonic

fi

done
