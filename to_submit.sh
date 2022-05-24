#!/bin/bash


SBATCH --job-name=az_test
#SBATCH --output=job_output.txt
#SBATCH --error=job_error.txt
SBATCH --partition=unkillable                           # Ask for unkillable job
SBATCH --cpus-per-task=2                                # Ask for 2 CPUs
SBATCH --gres=gpu:1                                     # Ask for 1 GPU
SBATCH --mem=8G                                        # Ask for 10 GB of RAM
SBATCH --time=0:15:00                                   # The job will run for 3 hours
#SBATCH -o /network/scratch/a/aldo.zaimi/slurm-%j.out  # Write the log on scratch

# Load anaconda
module load anaconda/3

# Activate virtual env.
conda activate az_venv

# Load modules
module load python/3.7
module load python/3.7/tensorflow/2.4



# 1. Load the required modules
#module load python/3.7

# 2. Load your environment
#conda activate mnist_venv

# Launch script
python cluster_test_az/cluster_mnist.py


# 3. Copy your dataset on the compute node
#cp /network/data/<dataset> $SLURM_TMPDIR

# 4. Launch your job, tell it to save the model in $SLURM_TMPDIR
#    and look for the dataset into $SLURM_TMPDIR
#python main.py --path $SLURM_TMPDIR --data_path $SLURM_TMPDIR

# 5. Copy whatever you want to save on $SCRATCH
#cp $SLURM_TMPDIR/<to_save> /network/scratch/<u>/<username>/










