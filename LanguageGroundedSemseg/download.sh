#!/bin/bash

# download checkpoint
gdown -O "checkpoint_best.ckpt" "https://drive.google.com/uc?id=1mr8szXHYAitOj5doK-gjT1WlvLOGJgTW&confirm=t"

# download dataset
gdown -O "dataset.zip" "https://drive.google.com/uc?id=1wd5nHK52FhI3gGN8ZUw1T_HiZPVTI9-6&confirm=t"
unzip dataset.zip
