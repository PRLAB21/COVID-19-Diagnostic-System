# Classification and Region Analysis of COVID-19 Infection using Lung CT Images and Deep Convolutional Neural Networks

This work proposes a two-stage deep Convolutional Neural Networks (CNNs) based framework for delineation of COVID-19 infected regions in Lung CT images. In the first stage, initially, COVID-19 specific CT image features are enhanced using a two-level discrete wavelet transformation. These enhanced CT images are then classified using the proposed custom-made deep CoV-CTNet. In the second stage, the CT images classified as infectious images are provided to the segmentation models for the identification and analysis of COVID-19 infectious regions. In this regard, we propose a novel semantic segmentation model CoV-RASeg, which systematically uses average and max pooling operations in the encoder and decoder blocks. This systematic utilization of max and average pooling operations helps the proposed CoV-RASeg in simultaneously learning both the boundaries and region homogeneity. Moreover, the idea of attention is incorporated to deal with mildly infected regions. The proposed two-stage framework is evaluated on a standard Lung CT image dataset, and its performance is compared with the existing deep CNN models. The performance of the proposed CoV-CTNet is evaluated using Mathew Correlation Coefficient (MCC) measure (0.98) and that of proposed CoV-RASeg using Dice Similarity (DS) score (0.95). The promising results on an unseen test set suggest that the proposed framework has the potential to help the radiologists in the identification and analysis of COVID-19 infected regions.

In this repository, we provide the MATLAB GUI and Test Code for the COVID-19 Detection System for the research community to use our model.

## Models Architecture

### Classification Model Architecture

Following is our Classification model that takes COVID-19 CT Lungs images as input and predicts COVID-19 Infected or Healthy CT scan. We used a Discrete Wavelet Transform (DWT) and Data augmentation as a pre-processing step to improve input representation as well as increasing the samples to improve the performance of the CNN model.

![Classification Model Architecture](https://github.com/PRLAB21/COVID-19-Diagnostic-System/blob/main/COV-CTNet%20Classification%20Architecture.jpg "Classification Model Architecture")

### Segmentation Model Architecture

Following is our Segmentation model that takes COVID-19 Infected CT Lungs image as input and gives binary mask image describing which part of lungs are more effected with coronavirus. This helps in determining the severity of patient's condition.

![Segmentation Model Architecture](https://github.com/PRLAB21/COVID-19-Diagnostic-System/blob/main/COV-RASeg%20Segmentation%20Architecture.jpg "Segmentation Model Architecture")

## Dataset

Dataset: <http://medicalsegmentation.com/covid19/>

Two main steps are performed on original dataset.

1. 3D to 2D conversion
2. Separation of COVID-19 Infected and Heathy slices for classification and segmentation challenge.

## Setup

1. Clone this repo.

```git bash
git install https://github.com/PRLAB21/COVID-19-Diagnostic-System.git
```

2. Change directory to cloned folder.

```cmd
cd COVID-19-Diagnostic-System-master
```

3. Download dataset and place it in following structure.

```text
COVID-19-Diagnostic-System-master
|__dataset
   |__classification
   |__segmentation
```

4. Pre-trained models are downloaded along with this repo and are present inside trained-models directory.

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
