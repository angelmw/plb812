#!/bin/bash --login
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=10
#SBATCH --mem=100GB
#SBATCH --job-name assignment-5
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
htseq-count -f bam -s no --counts_output=htseq-counts ${HOME}/plb812/data/RNA-seq_alignment/${sra}.bam ${HOME}/plb812/data/St_Phytozome/annotation/St.gene_exons.gtf 
done
