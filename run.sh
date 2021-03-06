#!/bin/bash

#SBATCH --nodes=1
#SBATCH --gres=gpu:1
#SBATCH --mem=250G
#SBATCH --partition=sched_mit_rgmark
#SBATCH --time=72:00:00
#SBATCH --output=out/%a.out
#SBATCH --error=err/%a.err
#SBATCH --array=0-299

# THIS IS IMPORTANT OR THE MODULES WILL NOT IMPORT
. /etc/profile.d/modules.sh
module load python/3.6.3
module load cuda/8.0
module load cudnn/6.0

pip3 install --user virtualenv
virtualenv -p python3 venv
source venv/bin/activate
pip3 install -r requirements.txt
python3 runNN.py $SLURM_ARRAY_TASK_ID

