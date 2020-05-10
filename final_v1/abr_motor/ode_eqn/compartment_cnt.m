%% labelling compartments 
mglA_count=1;
mglB_count=2;
romR_count=3;
im_count=4; % inactive motor 
amp_count=5; % active motor 
amn_count=6;
bmp_count=7;% bound positive motor
bmn_count=8; 

total_speices = 8;
%%
% MglA
mglA_start = mglA_count;
mglA_end = mglA_count*comp_num; 

% mglB
mglB_start =((mglB_count-1)*comp_num)+1;
mglB_end =mglB_start+comp_num-1;

%romR
romR_start =(romR_count-1)*comp_num+1;
romR_end=romR_start+comp_num-1;


%inactive motor
im_start=(im_count-1)*comp_num+1;
im_end = im_start+comp_num-1;

%acitve positive motor
amp_start=(amp_count-1)*comp_num+1;
amp_end= amp_start+comp_num-1;

%active negative motor
amn_start=(amn_count-1)*comp_num+1;
amn_end=amn_start+comp_num-1;

%bound motor positive
bmp_start=(bmp_count-1)*comp_num+1;
bmp_end=bmp_start+comp_num-1;

%bound motor negative
bmn_start=(bmn_count-1)*comp_num+1;
bmn_end=bmn_start+comp_num-1;