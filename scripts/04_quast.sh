#!/bin/bash

#SBATCH --account=def-tspribi
#SBATCH --time=1-0:0
#SBATCH --cpus-per-task=32
#SBATCH --mem=300G
#SBATCH --job-name=quast
#SBATCH --output=quast.script.logs.out
#SBATCH --mail-user=w6p9c9j6t9c6a2i6@spribillelabworkspace.slack.com
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END

SAMPLENAME="$1" #ca202112

module load StdEnv/2020
module load gcc/9.3.0
module load quast/5.0.2

quast --fungus -t 32 $SCRATCH/2023_02_Sporothrix/04_assemblies/"$SAMPLENAME"/contigs.fasta -o $SCRATCH/2023_02_Sporothrix/04_assemblies/"$SAMPLENAME"/quast