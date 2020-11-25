# Classification and Region Analysis of COVID-19 Infection using Lung CT Images and Deep Convolutional Neural Networks

**Dataset**: <https://drive.google.com/drive/folders/1bPGOPiKpsVgcCf06x5wRljZzpidWwo9q?usp=sharing>

In this repository, we provide the MATLAB GUI and Test Code for the [COVID-19 Detection System](https://arxiv.org/abs/2009.08864) for the research community to use our model.

## Models Architecture

**Pre-trained Models**: <https://drive.google.com/drive/folders/1QpBnvDIcGTeVywpjOE_QIcIRqSgJrK36?usp=sharing>

### Classification Model Architecture

Following is our Classification model that takes Lungs CT scan image as input and predicts if it is COVID patient's CT scan or normal person's CT scan. We used Discrete Wavelet Transform (DWT) as pre-precessing step to improve input representaiton of CNN model.

![Classification Model Architecture](https://github.com/PRLAB21/COVID-19-Diagnostic-System/blob/main/COV-CTNet%20Classification%20Architecture.jpg "Classification Model Architecture")

### Segmentation Model Architecture

Following is our Segmentation model that takes Lungs CT scan image as input and gives binary mask image describing which part of lungs are more effected with coronavirus. This helps in determining the severity of patient's condition.

![Segmentation Model Architecture](https://github.com/PRLAB21/COVID-19-Diagnostic-System/blob/main/COV-RASeg%20Segmentation%20Architecture.jpg "Segmentation Model Architecture")

## Setup

1. Clone this repo.

```git bash
git install https://github.com/PRLAB21/COVID-19-Diagnostic-System.git
```

2. Change directory to cloned folder.

```cmd
cd COVID-19-Diagnostic-System-master
```

3. Download dataset, unzip it and place it in following structure.

```text
COVID-19-Diagnostic-System-master
|__dataset
   |__classification
   |  |__corona-CT-images
   |     |__corona
   |     |__healthy
   |__segmentation
      |__test-images
```

4. Download pre-trained models and place them in following structure.

```text
|__trained-models
   |__model-covid19-classification.mat
   |__model-covid19-segmentation.mat
```

5. Run either **MATLAB-GUI-app** or any code file present under **code** directory as described below.

## Inference Code

1. Open MATLAB.
2. Set MATLAB folder location same as this repos folder.
3. Now add each folder to MATLAB path from Current Folder panel by right clicking on each folder and selecting Add to Path > Selected Folder and Subfolders.
4. Now you can run either test models individually or run MATLAB GUI App as described below.

### Directory: Code

-   **code/classification-codes/test_code_folder.m**: Use this file for testing classification model on folder of images at once.
-   **code/classification-codes/test_code_single.m**: Use this file for testing classification model on one particular image only.
-   **code/segmentation-codes/test_code_folder.m**: Use this file for testing segmentation model on folder of images at once.
-   **code/segmentation-codes/test_code_single.m**: Use this file for testing segmentation model on one particular image only.

### Directory: MATLAB-GUI-app

-   Inside this directory there are two GUI files, the main file is **gui_detection.mlapp**. In order to use MATLAB-GUI-app type following at command window.

```MATLAB
gui_detection
```

Now the GUI interface will open after some time, then it will allow use to load image, preprocess it, detect COVID. In case if the input image was detected as COVID image then you can further analyze it for obtaining the segmentation mask.

## Disclaimer

Although the results derived by finetuning various convolutional networks for COVID-19 detection are really encouraging, it is worth to mention that due to the limited number of COVID-19 images in our training and test sets, study on a larger number of cleanly labeled COVID-10 images is required to have a more concrete conclusion on the potential of CT images for COVID-19 deteciton.

## Citation

This work is done by Saddam Hussain Khan, Anabia Sohail, Asifullah Khan, Yeon Soo Lee. The Arxiv version of the paper can be downloaded from [here](https://arxiv.org/abs/2009.08864):
If you find this work useful, you can refer our work as:

```Bibtex formatted citation
@misc{khan2020classification,
      title={Classification and Region Analysis of COVID-19 Infection using Lung CT Images and Deep Convolutional Neural Networks},
      author={Saddam Hussain Khan and Anabia Sohail and Asifullah Khan and Yeon Soo Lee},
      year={2020},
      eprint={2009.08864},
      archivePrefix={arXiv},
      primaryClass={eess.IV}
}
```
