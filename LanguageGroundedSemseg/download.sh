#!/bin/bash

# download checkpoint
gdown -O "checkpoint_best.ckpt" "https://drive.google.com/uc?id=1mr8szXHYAitOj5doK-gjT1WlvLOGJgTW&confirm=t"

# download dataset
gdown -O "dataset.zip" ""
unzip dataset.zip
