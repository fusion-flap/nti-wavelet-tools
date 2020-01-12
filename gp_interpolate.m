%gp_interpolate - routine to correct bad AUG SXR data, written by
%papp@reak.bme.hu, last changed on 2009-07-31.
%
%To activate automatic interface, run without arguements.
%--------------------------------------------------------
%   filename:   file name, eg. '20975_J_053_2_3.mat'
%               File must be in ../raw_data/ !
%   weight:     Weight factor to control bad points. If the derivative at a
%               point is higher than weigth times the standard deviation of
%               the derivative, the point will be interpolated.
%               Default is 3.
%   max_bad_points: maximum number of bad points. Set it over 0 if the
%               iteration does not converge.
%               Default is 0.
%
%Syntax for automated execution:
%gp_interpolate(filename,weight,max_bad_points)
%example 1:
%gp_interpolate(20975_J_053_2_3.mat,2.7,10)
%example 2:
%gp_interpolate(20975_J_053_2_3.mat,2.7)
%(With this version, default will be used for max_bad_points)
%example 3:
%gp_interpolate(20975_J_053_2_3.mat)
%(With this version, defaults will be used for weight and max_bad_points
%
%(for more help, see the .m file)

% Version history:
% 2009-07-20    papp    Actually rewritten old version
% 2009-07-31    papp    Fine setting, make code more readable

%Initializing the function
function gp_interpolate(filename,weight,max_bad_points)

%Manual program version will be set in the .mat file. Please modify this
%value if you change the code!
last_modified='2009-07-31';

%Setting defaults
weight_default=3;
max_bad_points_default=0;

%Give warning if only filename is given
if nargin==1
    disp('Using defaults for weight and max_bad_points')
end

%Cheking input arguements. If not enough arguements are present, the
%automatic interface will launch.
if nargin==0
    disp('Please provide the needed input parameters!');
    filename = input('FULL filename in ../raw_data/ : ','s');
    weight = input(['Weight factor: [',num2str(weight_default),'] ']);
    max_bad_points = input(['Maximum number of bad points: ['...
        ,num2str(max_bad_points_default),'] ']);
    
    %Setting defaults for weight and max_bad_points, if left empty
    if isempty(weight)
        weight=weight_default;
    end
    if isempty(max_bad_points)
        max_bad_points=max_bad_points_default;
    end
    
end

%Setting defaults for weight and max_bad_points, if still not exist
if exist('weight','var')==0
    weight=weight_default;
end
if exist('max_bad_points','var')==0
    max_bad_points=max_bad_points_default;
end

%Giving feedback for the user about the used parameters
disp('Weight factor: ');
disp(num2str(weight))
disp('Maximum number of bad points: ');
disp(num2str(max_bad_points));

%Loading data
disp(['Loading [../raw_data/',filename,']']);
load(['../raw_data/',filename]);
disp('Data loaded.');
disp(' ');

%Initializing diff matrix
diff1=zeros(length(sxr_g),length(sxr_g(1,1).y)-1);

%Checking and returning the std and max values of the derivates of each
%line
for j=1:length(sxr_g)
    diff1(j,:)=diff(sxr_g(1,j).y);
    disp(['Std of the diff of ',sxr_g(1,j).yN,' is ',...
        num2str(std(diff1(j,:)))]);
    disp(['Max of the diff of ',sxr_g(1,j).yN,' is ',...
        num2str(max(abs(diff1(j,:))))]);
end

%Give feedback and set control_param
disp(' ');
disp('Starting iteration...')
control_param_k=max_bad_points+2;

%Starting iteration, until number of bad points drops below the max
while control_param_k>max_bad_points+1
    %Resetting the control parameter
    control_param_k=0;
    
    %For cycle goes through each line of sight, if more than 1 present
    for j=1:length(sxr_g)
        
        %Setting threshold for interpolation
        thr=std(diff1(j,:))*weight;
             
        %For cycles go through the points and interpolate if the point
        %differs significantly from the others. 2 cycles for both positive
        %and negative correction.
        
        %Calculate the actual derivate
        d=diff(sxr_g(1,j).y);
        for i=2:length(sxr_g(1,1).y)-1
            if d(i)>thr
                sxr_g(1,j).y(i)=(sxr_g(1,j).y(i+1)+sxr_g(1,j).y(i-1))/2;
                control_param_k=control_param_k+1;
            end
        end
        
        %Calculate the actual derivate
        d=diff(sxr_g(1,j).y);
        for i=1:length(sxr_g(1,1).y)-2
            if d(i)<-thr
                sxr_g(1,j).y(i+1)=(sxr_g(1,j).y(i+2)+sxr_g(1,j).y(i))/2;
                control_param_k=control_param_k+1;
            end
        end
        
    end
    
    %Giving feedback about the result of the current iteration step.
    disp(['Corrected ',int2str(control_param_k),' values.']);
end


disp('Interpolation correction finished.');
disp(' ');

%Setting flags in the file for the future, to warn that data has been
%manipulated with a given program at a given time.
sxr_g.correction=['gp_interpolate, version ',last_modified];
sxr_g.correction_time=fix(clock);

%Saving data with a new filename
disp('Saving data...');
newname=strrep(filename,'.mat','_interp.mat');
save(['../raw_data/',newname], 'sxr_g');
disp(['Succesfully saved [','../raw_data/',newname,']']);
