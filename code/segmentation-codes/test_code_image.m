format compact; clear; clc;

model_path = "trained-models/model-covid19-segmentation.mat";
if isfile(model_path)
    fprintf("Model loading...\n");
    load(model_path,'net_New_S_R');
    fprintf("Model loaded successfully.\n");
    [filepath, cancel] = imgetfile();
    if (~cancel)
        original_image = imread(filepath);
        disp(size(original_image))
        [C,scores] = semanticseg(original_image,net_New_S_R);
        overlay_image = labeloverlay(original_image,C);
        mask_image = C == 'COVID19';
        figure(1);
        subplot(1,3,1);
        imshow(imresize(original_image,[1024,1024]));
        subplot(1,3,2);
        imshow(imresize(overlay_image,[1024,1024]));
        subplot(1,3,3);
        imshow(imresize(mask_image,[1024,1024]));
    end
else
    fprintf("Model could not be loaded.\n");
end
