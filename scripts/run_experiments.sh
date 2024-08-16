#!/bin/bash
echo Running EXPERIMENTS
wget https://github.com/QueueInc/HAMLET/releases/download/1.0.39-fairness-dev/hamlet-1.0.39-fairness-dev-all.jar
python automl/run_hamlet.py --fair-mode $2 --workspace /test/hamlet/ika --metric balanced_accuracy --fair_metric $1 --mining_target '' --mode max --batch_size 999999 --time_budget 900 --version 1.0.39-fairness-dev --iterations 4 --volume $3 --kb /home/HAMLET-fairness/resources/kb.txt
python automl/run_hamlet.py --fair-mode $2 --workspace /test/hamlet/pkb_ika --metric balanced_accuracy --fair_metric $1 --mining_target '' --mode max --batch_size 999999 --time_budget 900 --version 1.0.39-fairness-dev --iterations 4 --volume $3 --kb /home/HAMLET-fairness/resources/pkb.txt
python automl/run_hamlet.py --fair-mode $2 --workspace /test/hamlet/baseline --metric balanced_accuracy --fair_metric $1 --mining_target '' --mode max --batch_size 999999 --time_budget 3600 --version 1.0.39-fairness-dev --iterations 1 --volume $3 --kb /home/HAMLET-fairness/resources/kb.txt
python automl/run_hamlet.py --fair-mode $2 --workspace /test/hamlet/pkb --metric balanced_accuracy --fair_metric $1 --mining_target '' --mode max --batch_size 999999 --time_budget 3600 --version 1.0.39-fairness-dev --iterations 1 --volume $3 --kb /home/HAMLET-fairness/resources/pkb.txt

