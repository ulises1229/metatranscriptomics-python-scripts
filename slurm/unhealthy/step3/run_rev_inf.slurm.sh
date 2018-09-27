#!/bin/bash
#SBATCH --partition FAST
#SBATCH --nodes=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=62G
#SBATCH --time=40-15:15:00     # 1 day 15hours and 15 minutes
#SBATCH --output=s3-inf-rev-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=uolivares@enesmorelia.unam.mx
#SBATCH --job-name="s3-inf-rev"

# cmsearch infernal output 
srun parallel -j 1 'cmsearch --cpu 32 -o {1.}.log --tblout {1.}.infernalout --anytrunc --rfam -E 0.001 rfam/Rfam.cm {1}' ::: *rev*bwa_blat.fasta