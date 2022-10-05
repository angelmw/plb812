#!/bin/bash --login
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=100GB
#SBATCH --job-name assignment-3
#SBATCH --output=%x-%j.SLURMout
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mckayang@msu.edu

cd ${PBS_O_WORKDIR}

#Add conda environment to the path
export PATH="${HOME}/miniconda3/envs/plb812/bin:${PATH}"
export LD_LIBRARY_PATH="${HOME}/miniconda3/envs/plb812/lib:${LD_LIBRARY_PATH}"

sra_list="SRR5448223 SRR5448224 SRR5448225 SRR5448226 SRR5448227 SRR5448228 SRR5448229 SRR5448230 SRR5448231 SRR5448232 SRR5448233 SRR5448234 SRR5448235"

#trim
for sra in ${sra_list}
do
trimmomatic PE -threads 13 -phred33 ${sra}_1.fastq.gz ${sra}_2.fastq.gz ${sra}_1_trimmed.fastq.gz ${sra}_2_trimmed.fastq.gz LEADING:20 TRAILING:20 MINLEN:30
done

#fastqc
fastqc -f fastq -o ${HOME}/plb812/data/RNA-seq_trimmed_fastqc ${HOME}/plb812/data/RNA-seq/*trimmed.fastq.gz

#copy html to assignment3
cp ${HOME}/plb812/data/RNA-seq_trimmed_fastqc/*fastqc.html ${HOME}/plb812/lab_assignments/assignment3
