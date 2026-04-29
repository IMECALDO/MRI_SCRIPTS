#!/bin/bash
#$ -S /bin/bash
#$ -N sswarper
#$ -cwd
#$ -o logs/
#$ -e logs/
#$ -V
#$ -t 1-50

# Make an array of subject folders
SUBJECTS=(data/sub-*)

# Pick the subject based on the task ID
SUBJECT=${SUBJECTS[$((SGE_TASK_ID-1))]}

# Extract just the subject ID (basename of folder)
id=$(basename "$SUBJECT")

echo "Running SSwarper for " $id

if [ -d "derivatives/SSwarper/"$id ]; then
        echo "data already warped"
else
        echo "running" $id
        mkdir "derivatives/SSwarper/"$id
        @SSwarper -input "derivatives/N4/"$id"/"$id"_T1w_N4.nii.gz"                   \
                -subid $id                                       \
                -odir  "derivatives/SSwarper/"$id"/"$id"_anat_warped"  \
                -base  MNI152_2009_template_SSW.nii.gz
fi
