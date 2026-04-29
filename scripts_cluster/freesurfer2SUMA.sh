#!/bin/bash
#$ -S /bin/bash
#$ -N freesurfer2SUMA
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

echo "Running SUMA_Make_Spec_FS for $SUBID"

if [ -d "derivatives/freesurfer/"$id"/SUMA" ]; then
        echo "data already in suma"
else
        @SUMA_Make_Spec_FS -fspath "derivatives/freesurfer/"$id -sid $id -NIFTI
fi
