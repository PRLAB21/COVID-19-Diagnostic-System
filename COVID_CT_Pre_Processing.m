I =imread('Corona_CT_1.jpg');
signal1=I(:,:,2);
% % signal1 = rgb2gray(I);
% % imshow(signal1)
[cA1,cH1,cV1,cD1] = dwt2(signal1,'db4');

[cA2,cH2,cV2,cD2] = dwt2(cA1,'db4');
[cA3,cH3,cV3,cD3] = dwt2(cA2,'db4');

[cA21,cH21,cV21,cD21] = dwt2(cD1,'db4');
[cA31,cH31,cV31,cD31] = dwt2(cD2,'db4');

DWT_feat = [cA3,cD3,cA31,cD31];
X = idwt2(cA2,cH2,cV2,cD2,'db4');
Third_Level_Decomposition1=uint8(X);
X1 = idwt2(cA21,cH21,cV21,cD21,'db4');
Third_Level_Decomposition2=uint8(X1);
Third_Level_Decomposition1_final=Third_Level_Decomposition1+Third_Level_Decomposition2;
imshow(Third_Level_Decomposition1_final)