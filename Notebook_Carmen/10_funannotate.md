
# copy predict files from previous funannotate version (1.8.5) to working directory
* 2023.07.12

copy predict files from previous funannotate version (1.8.5) to working directory

```
cd /data/ccallen/2023_02_Sporothrix/10_annotations/funannotate
for FILENAME in $(tail -n +2 ../genomes.txt)
do
SP=${FILENAME%%_S_*} #Tremella_mesenterica
SPECIES=${SP//_/ } #Tremella mesenterica
G=${SP%%_*} #Tremella
GS=${G:0:1} #T
S=${SP#*_} #mesenterica
ss=${S:0:2} #me
SS=$(tr '[a-z]' '[A-Z]' <<< $ss) #ME
SP_STRAIN=${FILENAME%%_G*} #Tremella_mesenterica_S_ATCC28783
STRAIN=${SP_STRAIN##*_} #ATCC28783
BASENAME="$GS""$SS""$STRAIN" #TMEATCC28783

mkdir -p "$FILENAME"/"$BASENAME"_preds
cp -r /data/ccallen/2022_04_fungal_annotation/01_funannotate/"$FILENAME"/*_preds/predict_results "$FILENAME"/"$BASENAME"_preds/.
done
```

# Run fungal genomes through funannotate version 1.8.5 to get gene models
* when 2023.08.02
* where /data/ccallen/2022_04_eukaryote_annotation

* how funannotate version 1.8.5 via debary fun-env

```
cd /data/ccallen/2022_04_fungal_annotation/01_funannotate
for sample in $(cat samples.txt)
do
bash ../scripts/funannotate_predict_script_v2022_2.sh "$sample".fna &>> "$sample".out
done

```




# Installed latest funannotate for annotations  

* funannotate dependencies
```
funannotate check --show-versions

-------------------------------------------------------
Checking dependencies for 1.8.15
-------------------------------------------------------
You are running Python v 3.8.15. Now checking python packages...
biopython: 1.81
goatools: 1.3.1
matplotlib: 3.4.3
natsort: 8.4.0
numpy: 1.24.4
pandas: 1.5.3
psutil: 5.9.5
requests: 2.31.0
scikit-learn: 1.3.0
scipy: 1.10.1
seaborn: 0.12.2
All 11 python packages installed


You are running Perl v b'5.032001'. Now checking perl modules...
Carp: 1.50
Clone: 0.46
DBD::SQLite: 1.72
DBD::mysql: 4.046
DBI: 1.643
DB_File: 1.858
Data::Dumper: 2.183
File::Basename: 2.85
File::Which: 1.24
Getopt::Long: 2.54
Hash::Merge: 0.302
JSON: 4.10
LWP::UserAgent: 6.67
Logger::Simple: 2.0
POSIX: 1.94
Parallel::ForkManager: 2.02
Pod::Usage: 1.69
Scalar::Util::Numeric: 0.40
Storable: 3.15
Text::Soundex: 3.05
Thread::Queue: 3.14
Tie::File: 1.06
URI::Escape: 5.17
YAML: 1.30
local::lib: 2.000029
threads: 2.25
threads::shared: 1.61
All 27 Perl modules installed


Checking Environmental Variables...
$FUNANNOTATE_DB=/data/databases/funannotate_db_2023
$PASAHOME=/data/ccallen/miniconda/envs/funannotate-1.8.15-env/opt/pasa-2.5.2
$TRINITY_HOME=/data/ccallen/miniconda/envs/funannotate-1.8.15-env/opt/trinity-2.8.5
$EVM_HOME=/data/ccallen/miniconda/envs/funannotate-1.8.15-env/opt/evidencemodeler-1.1.1
$AUGUSTUS_CONFIG_PATH=/data/ccallen/miniconda/envs/funannotate-1.8.15-env/config/
	ERROR: GENEMARK_PATH not set. export GENEMARK_PATH=/path/to/dir
-------------------------------------------------------
Checking external dependencies...
PASA: 2.5.2
CodingQuarry: 2.0
Trinity: 2.8.5
augustus: 3.5.0
bamtools: bamtools 2.5.1
bedtools: bedtools v2.31.0
blat: BLAT v37x1
diamond: 2.1.8
ete3: 3.1.3
exonerate: exonerate 2.4.0
fasta: 36.3.8g
glimmerhmm: 3.0.4
gmap: 2023-06-01
gmes_petap.pl: 4.62_lic
hisat2: 2.2.1
hmmscan: HMMER 3.3.2 (Nov 2020)
hmmsearch: HMMER 3.3.2 (Nov 2020)
java: 17.0.3-internal
kallisto: 0.46.1
mafft: v7.520 (2023/Mar/22)
makeblastdb: makeblastdb 2.14.0+
minimap2: 2.26-r1175
pigz: 2.6
proteinortho: 6.2.3
pslCDnaFilter: no way to determine
salmon: salmon 0.14.1
samtools: samtools 1.16.1
snap: 2006-07-28
stringtie: 2.2.1
tRNAscan-SE: 2.0.12 (Nov 2022)
tantan: tantan 40
tbl2asn: 25.8
tblastn: tblastn 2.14.0+
trimal: trimAl v1.4.rev15 build[2013-12-17]
trimmomatic: 0.39
	ERROR: emapper.py not installed
	ERROR: signalp not installed
```
Funannotate Databases currently installed:

  Database          Type        Version      Date         Num_Records   Md5checksum                     
  merops            diamond     12.0         2017-10-04          5009   a6dd76907896708f3ca5335f58560356
  uniprot           diamond     2023_03      2023-06-28        569793   d5c13a5c303640ff7c90f3584ad5785c
  dbCAN             hmmer3      11.0         2022-08-09           699   fb112af319a5001fbf547eac29e7c3b5
  pfam              hmmer3      35.0         2021-11            19632   c78ab387de299860bd242d6f57930c7f
  repeats           diamond     1.0          2023-07-12         11950   4e8cafc3eea47ec7ba505bb1e3465d21
  go                text        2023-06-11   2023-06-11         47558   b4aafb08e95a7c5c5852872e3d4a8959
  mibig             diamond     1.4          2023-07-12         31023   118f2c11edde36c81bdea030a0228492
  interpro          xml         95.0         2023-05-29         39227   b3e86e8aa6831cbcad2a6fd491ad20fe
  busco_outgroups   outgroups   1.0          2023-07-12             8   6795b1d4545850a4226829c7ae8ef058
  gene2product      text        1.91         2023-06-11         34378   659882a8a93a2403bd159d763853342a


# run through genomes

```
cd /data/ccallen/2023_02_Sporothrix/10_annotations/funannotate
for sample in $(tail -n +2 ../genomes.txt) #skip the header
do
bash ../../scripts/funannotate_annotate_script_v2023_1.sh "$sample".fna &>> "$sample".out
done
```

# collect gbk
```
cd /data/ccallen/2023_02_Sporothrix/10_annotations/funannotate
for FILENAME in $(tail -n +2 ../genomes.txt)
do
SP=${FILENAME%%_S_*} #Tremella_mesenterica
SPECIES=${SP//_/ } #Tremella mesenterica
G=${SP%%_*} #Tremella
GS=${G:0:1} #T
S=${SP#*_} #mesenterica
ss=${S:0:2} #me
SS=$(tr '[a-z]' '[A-Z]' <<< $ss) #ME
SP_STRAIN=${FILENAME%%_G*} #Tremella_mesenterica_S_ATCC28783
STRAIN=${SP_STRAIN##*_} #ATCC28783
BASENAME="$GS""$SS""$STRAIN" #TMEATCC28783


cp "$FILENAME"/"$BASENAME"_preds/annotate_results/"$SP"_"$STRAIN".gbk gbk/.
done
```

# collect annotation tables
```
cd /Users/carmenallen/Documents/2023_02_Sporothrix/10_annotations #local

for FILENAME in $(tail -n +2 genomes.txt)
do
SP=${FILENAME%%_S_*} #Tremella_mesenterica
SPECIES=${SP//_/ } #Tremella mesenterica
G=${SP%%_*} #Tremella
GS=${G:0:1} #T
S=${SP#*_} #mesenterica
ss=${S:0:2} #me
SS=$(tr '[a-z]' '[A-Z]' <<< $ss) #ME
SP_STRAIN=${FILENAME%%_G*} #Tremella_mesenterica_S_ATCC28783
STRAIN=${SP_STRAIN##*_} #ATCC28783
BASENAME="$GS""$SS""$STRAIN" #TMEATCC28783


scp ccallen@142.244.110.136:/data/ccallen/2023_02_Sporothrix/10_annotations/funannotate/"$FILENAME"/"$BASENAME"_preds/annotate_results/"$SP"_"$STRAIN".annotations.txt annotation_tables_funannotate/.
done
```


in debary
docker pull nextgenusfs/funannotate:latest

copied it over to narval

rsync -arxvHu --no-g --no-p gbk ccallen@cedar.computecanada.ca:/home/ccallen/scratch/2023_02_Sporothrix/10_annotations/funannotate/.


* 2023.09.27
-re-did annotations with dbCAN 12 database
-updated funannotate dbCAN database

hid the version 11 results from funannotate
```
cd /data/ccallen/2023_02_Sporothrix/10_annotations/funannotate
for FILENAME in $(tail -n +2 ../genomes.txt)
do
SP=${FILENAME%%_S_*} #Tremella_mesenterica
SPECIES=${SP//_/ } #Tremella mesenterica
G=${SP%%_*} #Tremella
GS=${G:0:1} #T
S=${SP#*_} #mesenterica
ss=${S:0:2} #me
SS=$(tr '[a-z]' '[A-Z]' <<< $ss) #ME
SP_STRAIN=${FILENAME%%_G*} #Tremella_mesenterica_S_ATCC28783
STRAIN=${SP_STRAIN##*_} #ATCC28783
BASENAME="$GS""$SS""$STRAIN"

mv "$FILENAME"/"$BASENAME"_preds/annotate_misc/annotations.dbCAN.txt "$FILENAME"/.

done
```

* re-do annotations
```
cd /data/ccallen/2023_02_Sporothrix/10_annotations/funannotate
for DIRNAME in $(tail -n +2 ../genomes.txt)
do
SP=${DIRNAME%%_S_*} #Tremella_mesenterica
SPECIES=${SP//_/ } #Tremella mesenterica
G=${SP%%_*} #Tremella
GS=${G:0:1} #T
S=${SP#*_} #mesenterica
ss=${S:0:2} #me
SS=$(tr '[a-z]' '[A-Z]' <<< $ss) #ME
SP_STRAIN=${DIRNAME%%_G*} #Tremella_mesenterica_S_ATCC28783
STRAIN=${SP_STRAIN##*_} #ATCC28783
BASENAME="$GS""$SS""$STRAIN"
funannotate annotate -i "$DIRNAME"/"$BASENAME"_preds --sbt template.sbt.txt --eggnog "$DIRNAME"/"$BASENAME"_preds/annotate_misc/eggnog_results.emapper.annotations --busco_db dikarya --strain "$STRAIN" --cpus 12 --force &>> "$DIRNAME".redo.out
done
```

* gathered gbks again (like above)
* funannotate compare in cedar

```
#!/bin/bash
#SBATCH --account=def-tspribi
#SBATCH --time=2-0:00
#SBATCH --cpus-per-task=32
#SBATCH --job-name=compare
#SBATCH --output=funannotate.script.Sept28.notree.logs.out
#SBATCH --mem=249G
#SBATCH --mail-user=w6p9c9j6t9c6a2i6@spribillelabworkspace.slack.com
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END

module load StdEnv/2020
module load apptainer/1.1.8

cd $SLURM_TMPDIR
mkdir -p run_compare
cd run_compare
cp -r /scratch/ccallen/2023_02_Sporothrix/10_annotations/funannotate/gbk .

apptainer run --bind $(pwd) $SCRATCH/docker_builds/funannotate_latest.sif funannotate compare -i \
gbk/Leptographium_lundbergii_CBS138716.gbk \
gbk/Ophiostoma_fasciatum_VPRI43845.gbk \
gbk/Ophiostoma_ips_VPRI43529.gbk \
gbk/Ophiostoma_novoulmi_H327.gbk \
gbk/Sporothrix_bragantina_CBS47491.gbk \
gbk/Sporothrix_brasiliensis_5110.gbk \
gbk/Sporothrix_brunneoviolacea_CBS124561.gbk \
gbk/Sporothrix_curviconia_CBS95973.gbk \
gbk/Sporothrix_dimorphospora_CBS55374.gbk \
gbk/Sporothrix_epigloea_CBS119000.gbk \
gbk/Sporothrix_epigloea_CBS57363.gbk \
gbk/Sporothrix_epigloea_TF4163.gbk \
gbk/Sporothrix_eucalyptigena_CBS139899.gbk \
gbk/Sporothrix_eucalyptigena_CBS140593.gbk \
gbk/Sporothrix_euskadiensis_VPRI43754.gbk \
gbk/Sporothrix_globosa_CBS120340.gbk \
gbk/Sporothrix_humicola_CBS118129.gbk \
gbk/Sporothrix_inflata_CBS23968.gbk \
gbk/Sporothrix_insectorum_RCEF264.gbk \
gbk/Sporothrix_luriei_CBS93772.gbk \
gbk/Sporothrix_mexicana_CBS120341.gbk \
gbk/Sporothrix_nigrograna_VPRI43755.gbk \
gbk/Sporothrix_pallida_CBS13156.gbk \
gbk/Sporothrix_phasma_CBS119721.gbk \
gbk/Sporothrix_protearum_CBS116654.gbk \
gbk/Sporothrix_pseudoabietina_VPRI43531.gbk \
gbk/Sporothrix_schenckii_1099.gbk \
gbk/Sporothrix_thermara_CBS139747.gbk \
gbk/Sporothrix_variecibatus_CBS121961.gbk \
--num_orthos 1 --cpus 32 -o funannotate_compare_notree

cp *.tar.gz $SCRATCH/2023_02_Sporothrix/10_annotations/funannotate/.
cp -r funannotate_compare_notree $SCRATCH/2023_02_Sporothrix/10_annotations/funannotate/.
```
```
cd /Users/carmenallen/Documents/2023_02_Sporothrix/10_annotations #local

for FILENAME in $(tail -n +2 genomes.txt)
do
SP=${FILENAME%%_S_*} #Tremella_mesenterica
SPECIES=${SP//_/ } #Tremella mesenterica
G=${SP%%_*} #Tremella
GS=${G:0:1} #T
S=${SP#*_} #mesenterica
ss=${S:0:2} #me
SS=$(tr '[a-z]' '[A-Z]' <<< $ss) #ME
SP_STRAIN=${FILENAME%%_G*} #Tremella_mesenterica_S_ATCC28783
STRAIN=${SP_STRAIN##*_} #ATCC28783
BASENAME="$GS""$SS""$STRAIN" #TMEATCC28783


Rscript ../scripts/10_merge_annotations.R $FILENAME
done
```
