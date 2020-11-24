format compact; clear; clc;

model_path = 'trained-models/model-covid19-classification.mat';
if isfile(model_path)
    fprintf("Model loading...\n");
    load(model_path,'Custom_netresnet18_CT_Corona_DWT_W1');
    fprintf("Model loaded successfully.\n");
    [filepath, cancel] = imgetfile();
    if (~cancel)
        original_image = imread(filepath);
        if size(original_image) == [304 304 3]
            preprocessed_image = preprocess_COVID_image(filepath,[156, 156]);
        elseif size(original_image) == [156 156]
            preprocessed_image = cat(3,original_image,original_image,original_image);
            preprocessed_image = imresize(preprocessed_image,[156 156]);
        else
            fprintf("Invalid Image selected. Valid image is either 304x304x3 (rgb) or 156x156 (grayscale).\n");
        end
        fprintf("Running Model on Image.\n");
        [predicted_labels,posterior] = classify(Custom_netresnet18_CT_Corona_DWT_W1,preprocessed_image);
        fprintf("posterior: %f\n", posterior);
        label = categorical(predicted_labels);
        if (label == "Corona")
            fprintf(' \n Danger "COVID-Infected" \n')
        else
            fprintf(' \n Congrats "Healthy" \n')
        end
    else
        fprintf("Invalid Image selected. Valid image is either 304x304 rgb or 156x156 grayscale\n");
    end
else
    fprintf("Model could not be loaded.\n");
end
