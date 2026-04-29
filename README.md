# MRI SCRIPTS
Scripts to run MRI analysis.

# Some scripts have two versions available to them, being able to run in the cluster or in the local machine
## scripts_cluster
Certain scripts need be run with `bash script.sh` or `qsub script.sh`. This depends on the script, good luck finding which one. :D

## scripts_local
All local scripts need be run with `bash script.sh`.

# Some scripts can ONLY (Or at least I couldn't find a way) be run in the local machine
## scripts_only_local


# Specifics

# scripts_cluster/qsub_conn.sh
Script to run a conn job, #$ -t 1-N, N must match number of all partitioned jobs. If any jobs fails for any reason, one can just rerun the script with no problem. (no need to delete botched runs).
* Need to change the node number, to match the number of the job.
* Need to change file path and number of participants (if applicable).
* Need be run with `qsub qsub_conn.sh`.





