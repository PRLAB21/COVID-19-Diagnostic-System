function Iout = preprocess_COVID_images(filepath,desired_size)

I = imread(filepath);

signal1 = I(:,:,2);
[cA1,cH1,cV1,cD1] = dwt2(signal1,'db4');

[cA2,cH2,cV2,cD2] = dwt2(cA1,'db4');
[cA3,cH3,cV3,cD3] = dwt2(cA2,'db4');

[cA21,cH21,cV21,cD21] = dwt2(cD1,'db4');
[cA31,cH31,cV31,cD31] = dwt2(cD2,'db4');

DWT_feat = [cA3,cD3,cA31,cD31];

X1 = idwt2(cA2,cH2,cV2,cD2,'db4');
Third_Level_Decomposition1 = uint8(X1);

X2 = idwt2(cA21,cH21,cV21,cD21,'db4');
Third_Level_Decomposition2 = uint8(X2);

Third_Level_Decomposition3 = Third_Level_Decomposition1 + Third_Level_Decomposition2;

% Converting it back to uint8
Iout = uint8(Third_Level_Decomposition3);
% Resize the image
Iout = imresize(Iout,[desired_size(1),desired_size(2)]);
Iout = cat(3,Iout,Iout,Iout);

end
