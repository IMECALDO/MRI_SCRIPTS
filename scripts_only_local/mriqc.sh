#!/bin/bash

echo MRIQC

fsl_sub -N MRIQC_all singularity run \
-B /misc/milagros/arandacm/SAM-HED_RESTING_STATE/data/ \
-B /misc/milagros/arandacm/SAM-HED_RESTING_STATE/derivatives/mriqc/ \
derivatives/mriqc.sif \
-m T1w bold \
--fd_thres 0.5 \
/misc/milagros/arandacm/SAM-HED_RESTING_STATE/data/ \
/misc/milagros/arandacm/SAM-HED_RESTING_STATE/derivatives/mriqc/ \
participant
