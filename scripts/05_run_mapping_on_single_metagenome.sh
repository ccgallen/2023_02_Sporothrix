#!/bin/bash
#SBATCH --account=def-xxxxxx
#SBATCH --time=2-0:0
#SBATCH --cpus-per-task=32
#SBATCH --job-name=mapping
#SBATCH --mem=250G
#SBATCH --output=mapping.script.logs.out


module load StdEnv/2020
module load gcc/9.3.0
module load bowtie2/2.4.4
module load samtools/1.16.1

project_directory="$1"
sample="$2"
reads_1=$SCRATCH/"$project_directory"/03_CLEAN_READS/"$sample"_1.fastq.gz
reads_2=$SCRATCH/"$project_directory"/03_CLEAN_READS/"$sample"_2.fastq.gz
contigs=$SCRATCH/"$project_directory"/04_assemblies/"$sample"/contigs.fasta
mapping_dir=$SCRATCH/"$project_directory"/05_mapping/"$sample"
# binning_dir=$SCRATCH/"$project_directory"/06_concoct_binning/"$sample"
#reffas=
#ref=  # give it a reference database name
#query= # query fasta file
#reffas= # reference fasta file name
#datadir= # where the original fastq file stored
#output_dir= #final output directory

#bowtie2 version is 2.4.4
#samtools version is 1.13

mkdir "$mapping_dir"
cd "$mapping_dir"
bowtie2-build "$contigs" "$sample"_assembly
bowtie2 -x "$sample"_assembly -1 "$reads_1" -2 "$reads_2" --no-unal -p 32 -S "$sample".sam
samtools view -b -o "$sample"-raw.bam "$sample".sam
samtools sort -o "$sample".bam "$sample"-raw.bam
samtools index "$sample".bam
rm "$sample".sam
rm "$sample"-raw.bam