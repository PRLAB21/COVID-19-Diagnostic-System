format compact; clear; clc;

if ~isfolder('code/segmentation-codes/outputs-concat/')
    mkdir('code/segmentation-codes/outputs-concat/');
end
if ~isfolder('code/segmentation-codes/outputs-mask/')
    mkdir('code/segmentation-codes/outputs-mask/');
end

model_path = "trained-models/model-covid19-segmentation.mat";
if (isfile(model_path))
    fprintf("Model loading...\n");
    load(model_path,'net_New_S_R');
    fprintf("Model loaded successfully.\n");
    test_dataset_path = 'dataset/segmentation/test-dataset/';
    images_name_list = dir([test_dataset_path, '*.jpg']);
    for i = 1:length(images_name_list)
        fprintf("processing image: %d / %d; ", i, length(images_name_list));
        image_name = images_name_list(i).name;
        original_image = imread([test_dataset_path,image_name]);
        [C,scores] = semanticseg(original_image,net_New_S_R);
        B = labeloverlay(original_image,C);
        x = cat(2,original_image,B);
        imwrite(x,strcat('code/segmentation-codes/outputs-concat/',image_name));
        BW = C == 'COVID19';
        imwrite(BW,strcat('code/segmentation-codes/outputs-mask/',image_name));
        fprintf("output saved\n");
    end
else
    fprintf("Model could not be loaded.\n");
end
