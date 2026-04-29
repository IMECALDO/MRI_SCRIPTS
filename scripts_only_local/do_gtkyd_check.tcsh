#!/bin/tcsh

# The goals of these two commands are to:
# 1) Make a spreadsheet of dataset properties that we want to check for 
#    consistency or appropriateness.
# 2) Check whether those properties really are consistent and/or appropriate.

# Step 1: make a table, combining dataset properties

# This command takes a bunch of EPIs across several subjects, and
# creates a spreadsheet, check_all_epi.xls

gtkyd_check.py                                            \
    -infiles    data/sub-*/func/*bold.nii.gz     \
    -outdir     check_all_epi \
    -overwrite

# ... and you can open up the the spreadsheet: check_all_epi.xls.
# 
# + The top row shows the things checked:
#   n3     : matrix size in 3 dimensions
#   nv     : number of volumes (AKA number of time points)
#   orient : dataset orientation on the disk
#   ad3    : voxel dimensions in 3D
#   tr     : TR (repetition time)
#   is slice_timing_nz : is there nonzero slice timing present? (1=yes, 0=no)
#   space  : what is the space of the dataset (ORIG for original, TLRC for template)
#   ... and lots more properties, including NIFTI fields
#   
#   In a soon-to-be added update, users can query for JSON sidecars,
#   and then check values within there (e.g., acquisition name, phase
#   encode direction, and more)

# Step 2: query the full set of properties, for either consistency or goodness.

# this command allows you to query any column from the XLS for lots of
# things---being constant across all subjects (VARY), being a
# numerical value *close* to constant, within a plus/minus range
# (VAR_PM <<plus minus value>>) being equal to a particular value (EQ
# <<some value>>), simply be displayed (SHOW), or more.  See
# gen_ss_review_table.py's help for the full list

# Here, I show all subject IDs, and then look for properties that
# would make me concerned. In order:
# + is the "afni view" space "+tlrc", meaning that this unprocessed data is
#   somehow labelled as being in standard space already?
# + does the dset matrix size (n3) vary across subjects?
# + does the number of volumes (n4) vary across subjects?
# + does the dset orientation vary across subjects? 
# + does the datum (=float, short, ...) vary across subjects?
# + does the voxel size vary across subjects, to within 0.001 (because sometimes
#   voxel sizes are rounded a bit, like 2.9999 and 3.00001, etc., and I don't 
#   want such rounding errors to be considered as "varying"; VARY_PM is useful
#   for checking consistency of floating point values)
# + does the TR vary across subjects?  (again, this is a floating point value,
#   so I use a plus/minus)

# NB: mechanically here, the thing you provide to this program after
# the previous gtkyd_check.py run is a set of *.txt files in a
# subdirectory created by that command. You can always use the same
# PREFIX name from the previous command, with "/dset*.txt", as shown here.

gen_ss_review_table.py                                    \
    -outlier_sep space                                    \
    -infiles            check_all_epi/dset*txt            \
    -report_outliers    'subject ID'     SHOW             \
    -report_outliers    'av_space'       EQ    "+tlrc"    \
    -report_outliers    'n3'             VARY             \
    -report_outliers    'nv'             VARY             \
    -report_outliers    'orient'         VARY             \
    -report_outliers    'datum'          VARY             \
    -report_outliers    'ad3'            VARY_PM 0.001    \
    -report_outliers    'tr'             VARY_PM 0.001    \

# this outputs a table of things that pop up, like, where n3 varied
# across subjects (compared to the value of the first subject in the
# list, which isn't shown, so you might have to look back at the XLS
# file), or where TR varied, etc.  If you want, you can save this by
# redirecting the output to a text file when running.

# ... in the end, for this conglomeration of data from different
# sites, *many* of these things vary.  More realistically, many won't
# for a given site's data---but you would be surprised how often
# things do. Many datasets have mixed voxel size or something, because
# someone forgot to tick a box at the scanner, etc. This helps flag
# stuff early on.
