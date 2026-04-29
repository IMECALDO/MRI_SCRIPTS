#!/bin/bash

# Should run in derivatives/afni_proc

missing=()

for sub in "proc.sub-"*; do

	tmp="${sub#*.}"
	id="${tmp%%.*}"

	if [ -d $id".rest.results" ]; then
	        echo "Already ran afni_proc for" $id
	else
	        missing+=("$id")
	        echo "Running afni_proc for" $id
	fi

done

parallel -j 2 --delay 60 "tcsh -xef proc.{1}.rest |& tee output.proc.{1}.rest" ::: "${missing[@]}"



