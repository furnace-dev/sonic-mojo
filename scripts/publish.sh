#!/bin/bash

# pixi global install rattler-build

# ignore errors because we want to ignore duplicate packages
for file in $CONDA_BLD_PATH/**/*.conda; do
    magic run rattler-build upload prefix -c "furnace-dev" "$file" --api-key=$PREFIX_DEV_API_KEY || true
done

rm $CONDA_BLD_PATH/**/*.conda