#!/bin/bash
#SBATCH --nodes 1
#SBATCH --ntasks-per-node 1
#SBATCH --cpus-per-task 1
#SBATCH --mem 8192
#SBATCH --time 1:00:00
#SBATCH --job-name="SSM"
#SBATCH --qos=serial
#SBATCH --output=%A_%a.out
#SBATCH --error=%A_%a.err


mut_res=("120A" "121A" "122A" "123A" "124A" "125A" "126A" "127A" "128A" "129A" "130A" "131A")

for i in ${mut_res[@]}
do
    srun /PATH_TO_ROSETTA/source/bin/rosetta_scripts.linuxiccrelease -parser:protocol per_position_sampling.xml -ignore_unrecognized_res -out:file:score_only ssm_scan.sc -s SwIL15_split.pdb -parser:script_vars r=$i -out:no_nstruct_label -out:suffix _$i
done