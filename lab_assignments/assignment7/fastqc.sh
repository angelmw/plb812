#!/bin/bash --login
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=100GB
#SBATCH --job-name assignment-7
#SBATCH --output=%x-%j.SLURMout
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mckayang@msu.edu

cd ${PBS_O_WORKDIR}

#Add conda environment to the path
export PATH="${HOME}/miniconda3/envs/plb812/bin:${PATH}"
export LD_LIBRARY_PATH="${HOME}/miniconda3/envs/plb812/lib:${LD_LIBRARY_PATH}"

fastqc -f fastq -o ${HOME}/plb812/data/Genome_fastqc ${HOME}/plb812/data/Genome/*.fastq.gz

cp ${HOME}/plb812/data/Genome_fastqc/*fastqc.html ${HOME}/plb812/lab_assignments/assignment7
