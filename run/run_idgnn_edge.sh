#!/usr/bin/env bash

DIR=IDGNN
CONFIG=edge
GRID=link
REPEAT=3
MAX_JOBS=4
SLEEP=1

# generate configs (after controlling computational budget)
# please remove --config_budget, if don't control computational budget
python configs_gen.py --config configs/${DIR}/${CONFIG}.yaml \
  --config_budget configs/${DIR}/${CONFIG}.yaml \
  --grid grids/${DIR}/${GRID}.txt \
  --out_dir configs
# run batch of configs
# Args: config_dir, num of repeats, max jobs running, sleep time
bash parallel.sh configs/${CONFIG}_grid_${GRID} $REPEAT $MAX_JOBS $SLEEP
# rerun missed / stopped experiments
bash parallel.sh configs/${CONFIG}_grid_${GRID} $REPEAT $MAX_JOBS $SLEEP
# rerun missed / stopped experiments
bash parallel.sh configs/${CONFIG}_grid_${GRID} $REPEAT $MAX_JOBS $SLEEP

# aggregate results for the batch
python agg_batch.py --dir results/${CONFIG}_grid_${GRID}




# predicting enzymes dataset (use a smaller model)

DIR=IDGNN
CONFIG=edge
GRID=path
REPEAT=3
MAX_JOBS=4
SLEEP=1

# generate configs (after controlling computational budget)
# please remove --config_budget, if don't control computational budget
python configs_gen.py --config configs/${DIR}/${CONFIG}.yaml \
  --config_budget configs/${DIR}/${CONFIG}.yaml \
  --grid grids/${DIR}/${GRID}.txt \
  --out_dir configs
# run batch of configs
# Args: config_dir, num of repeats, max jobs running, sleep time
bash parallel.sh configs/${CONFIG}_grid_${GRID} $REPEAT $MAX_JOBS $SLEEP
# rerun missed / stopped experiments
bash parallel.sh configs/${CONFIG}_grid_${GRID} $REPEAT $MAX_JOBS $SLEEP
# rerun missed / stopped experiments
bash parallel.sh configs/${CONFIG}_grid_${GRID} $REPEAT $MAX_JOBS $SLEEP

# aggregate results for the batch
python agg_batch.py --dir results/${CONFIG}_grid_${GRID}
