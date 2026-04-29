#!/bin/bash

3dttest++ -prefix stat.ttest.ttest_NaCC_left                     \
  -mask masks/group_mask_bin.nii.gz            \
  -AminusB                                     \
  -setA LOWS                                   \
    sub-014 "sub-014.rest.results/sub-014.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-020 "sub-020.rest.results/sub-020.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-025 "sub-025.rest.results/sub-025.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-030 "sub-030.rest.results/sub-030.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-032 "sub-032.rest.results/sub-032.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-035 "sub-035.rest.results/sub-035.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-047 "sub-047.rest.results/sub-047.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-048 "sub-048.rest.results/sub-048.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-050 "sub-050.rest.results/sub-050.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-065 "sub-065.rest.results/sub-065.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-073 "sub-073.rest.results/sub-073.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-078 "sub-078.rest.results/sub-078.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-081 "sub-081.rest.results/sub-081.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-084 "sub-084.rest.results/sub-084.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-086 "sub-086.rest.results/sub-086.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-087 "sub-087.rest.results/sub-087.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-093 "sub-093.rest.results/sub-093.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-094 "sub-094.rest.results/sub-094.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-097 "sub-097.rest.results/sub-097.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-098 "sub-098.rest.results/sub-098.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
  -setB HIGHS                                   \
    sub-016 "sub-016.rest.results/sub-016.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-018 "sub-018.rest.results/sub-018.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-019 "sub-019.rest.results/sub-019.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-021 "sub-021.rest.results/sub-021.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-022 "sub-022.rest.results/sub-022.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-024 "sub-024.rest.results/sub-024.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-027 "sub-027.rest.results/sub-027.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-034 "sub-034.rest.results/sub-034.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-036 "sub-036.rest.results/sub-036.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-037 "sub-037.rest.results/sub-037.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-043 "sub-043.rest.results/sub-043.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-045 "sub-045.rest.results/sub-045.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-046 "sub-046.rest.results/sub-046.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-067 "sub-067.rest.results/sub-067.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-070 "sub-070.rest.results/sub-070.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-077 "sub-077.rest.results/sub-077.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-079 "sub-079.rest.results/sub-079.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-080 "sub-080.rest.results/sub-080.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-082 "sub-082.rest.results/sub-082.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-083 "sub-083.rest.results/sub-083.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-085 "sub-085.rest.results/sub-085.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-088 "sub-088.rest.results/sub-088.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-089 "sub-089.rest.results/sub-089.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-090 "sub-090.rest.results/sub-090.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-091 "sub-091.rest.results/sub-091.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-092 "sub-092.rest.results/sub-092.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
    sub-096 "sub-096.rest.results/sub-096.CORR-NaCC_left_000_INDIV/WB_Z_ROI_001+tlrc.HEAD"    \
  -covariates covariates.txt    

