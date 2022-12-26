# 3DCV_final
## Scannet200 - 3D Longtail Semantic Segmentation

credit to [LanguageGroundedSemseg](https://github.com/RozDavid/LanguageGroundedSemseg)

## Prerequisite

```sh
cd LanguageGroundedSemseg/
# download dataset and checkpoint
source download.sh
# create conda environment
conda env create -f config/lg_semseg.yml
conda activate lg_semseg

```

Additionally, [MinkowskiEngine](https://github.com/NVIDIA/MinkowskiEngine) has to be installed manually with a specified CUDA version. 
E.g. for CUDA 11.1 run 

```sh
export CUDA_HOME=/usr/local/cuda-11.1
pip install -U git+https://github.com/NVIDIA/MinkowskiEngine -v --no-deps --install-option="--blas=openblas"
```

## Run Inference

```sh
source inference.sh <TEST_NAME_POSTFIX> <ADDITIONAL_ARGS>
# e.g. source inference.sh baseline-test
```

## Run Visualization

You can visualize plyfile after inferencing, just run

```sh
python3 visualize.py <plt_filepath>
# e.g. python3 visualize.py ./output/Scannet200Voxelization2cmDataset/Res16UNet34D-baseline-test/visualize/full_eval/scene0500_00.ply
```

## Optional (Run Training)

### Language Grounded Pretraining (stage 1)

```sh
source training_scripts/text_representation_train.sh <BATCH_SIZE> <TRAIN_NAME_POSTFIX> <ADDITIONAL_ARGS>
# e.g. source training_scripts/text_representation_train.sh 2 baseline-stage_1
```

### Downstream Semantic Segmentation (stage 2)

For this stage modify environment variables ``PRETRAINED_WEIGHTS`` in ``training_scripts/train_models.sh``, then run

```sh
source training_scripts/train_models.sh <BATCH_SIZE> <LOSS_TYPE> <TRAIN_NAME_POSTFIX> <ADDITIONAL_ARGS>
# e.g. source training_scripts/train_models.sh 2 cross_entropy baseline-stage2
```

``<LOSS_TYPE>`` can be ``focal`` or ``cross_entropy``

### Finetune Stage

For this stage modify environment variables ``PRETRAINED_WEIGHTS`` in ``training_scripts/fine_tune_classifier.sh``, then run

```sh
source training_scripts/fine_tune_classifier.sh <BATCH_SIZE> <LOSS_TYPE> <SAMPLE_TAIL> <TRAIN_NAME_POSTFIX> <ADDITIONAL_ARGS>
# e.g. source training_scripts/fine_tune_classifier.sh 2 focal True baseline-finetune
```
``<SAMPLE_TAIL>`` can be ``True`` or ``False``