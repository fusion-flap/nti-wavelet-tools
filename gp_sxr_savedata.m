%gp_sxr_savedata - routine to save AUG SXR data, written by
%papp@reak.bme.hu, last changed on 2009-07-08.
%
%To activate automatic interface, run without arguements.
%--------------------------------------------------------
%   shot:    shotnumber as an integer.
%   camera:  camera name, eg. 'I' (for more info, look in the file
%            or run diaggeom). When written explicitly it can stand
%            for a single line eg. 'J_053' (command line)
%                              or   J_053  (input interface)
%   t_start: start of time interval
%   t_end:   end of time interval
%   scp:     automatically secure copy (via ssh) to a remote computer.
%   remote:  Optional override of the default remote machine.
%            Just skip/hit return if default is OK.
%
%Syntax for automated execution:
%gp_sxr_savedata(shot,camera,t_start,t_end,scp,remote)
%example:
%gp_sxr_savedata(20975,'J_053',2,6,1)
%
%(for more help, see the .m file)

% Version history:
% 2009-07-06    papp    Actually rewritten old version
% 2009-07-07    papp    Added gp_sxr_diag as separate function
% 2009-07-08    papp    Added line breaks for better readibility, 
%                       corrected 'remote'
% 2009-07-21    papp    Folder raw_data is now created if not exists


%initializing the function
function gp_sxr_savedata(shot,camera,t_start,t_end,scp,remote)

%Setting defaults
remote_def = 'data@deep.reak.bme.hu:asdex/raw_data/';
%set dummy remote value if remote is not present in the input
if nargin < 6
    remote='';
end

%Adding basic IPP library files in order to have SF2ML
addipplib

%Cheking input arguements. If not enough arguements are present, the
%automatic interface will launch.
if nargin < 5
    
    %If there are some arguements but not enough, a warning appears, and
    %the interface starts.
    if nargin > 0
        disp('Not enough input arguements (<5), activating input interface...');
    end
    
    %Activation of the interface
    disp(' Please load the information about the requested shot');
    shot    = input('Shot number:  ');
    camera  = input('Camera name: ','s');
    t_start = input('Begin of the time interval:  ');
    t_end   = input('End   of the time interval:  ');
    scp = input('Copy to remote machine automatically? ([0]/1)  ');
    
    %setting default for secure copy
    if isempty(scp)
        scp=0;
    end
    %If scp is set but interface is activated, read the remote machine
    %or hit return to leave default value
    if scp
        remote = input(['Remote machine [default is ',remote_def,...
            ', to accept, hit return]: '],'s');
    end
end

%setting default remote machine for scp if nothing else is given
if isempty(remote), remote=remote_def; end

disp('Loading SXR signal(s)...')

%Switching between line groups and single lines
if length(camera) == 5,
    
    %getting diagnostic name for the given shot and camera
    diag=gp_sxr_diag(shot,camera);
    
    %actual data reading with SF2ML
    sxr_g = SF2ML(camera,diag,shot,t_start,t_end,0,'AUGD');
    
else
    
    %Switch-case to go through camera groups if selected.
    %Will return an error and STOP if one line is missing! Better use
    %per-line data acq or rewrite this part with shotfile cheking.
    switch camera
        case 'F'
            for i=10:20, sxr_g(i-9) = SF2ML(strcat('F_0',num2str(i)),'SXH',...
                    shot,t_start,t_end,0,'AUGD');end
            for i=21:27, sxr_g(i-9) = SF2ML(strcat('F_0',num2str(i)),'SXI',...
                    shot,t_start,t_end,0,'AUGD');end
        case 'I'
            for i=53:64, sxr_g(i-52)=SF2ML(strcat('I_0',num2str(i)),'SXF',...
                    shot,t_start,t_end,0,'AUGD');end
        case 'I1'
            for i=15:17, sxr_g(i-14)=SF2ML(strcat('I_0',num2str(i)),'SXI',...
                    shot,t_start,t_end,0,'AUGD');end
            %case 'I3'
            %    for i=89:93, sxr_g(i-89)=SF2ML(strcat('I_0',num2str(i)),'SXI',...
            %shot,t_start,t_end,0,'AUGD');end
        case 'J'
            for i=46:48, sxr_g(i-45)=SF2ML(strcat('J_0',num2str(i)),'SXA',...
                    shot,t_start,t_end,0,'AUGD');end
            for i=49:60, sxr_g(i-45)=SF2ML(strcat('J_0',num2str(i)),'SXB',...
                    shot,t_start,t_end,0,'AUGD');end
        case 'K2'
            for i=50:62, sxr_g(i-49)=SF2ML(strcat('K_0',num2str(i)),'SXL',...
                    shot,t_start,t_end,0,'AUGD');end
        case 'K1'
            for i=13:15, sxr_g(i-12)=SF2ML(strcat('K_0',num2str(i)),'SXL',...
                    shot,t_start,t_end,0,'AUGD');end
            for i=16:27, sxr_g(i-12)=SF2ML(strcat('K_0',num2str(i)),'SXK',...
                    shot,t_start,t_end,0,'AUGD');end
        case 'H1'
            for i=17:17, sxr_g(i-16)=SF2ML(strcat('H_0',num2str(i)),'SXH',...
                    shot,t_start,t_end,0,'AUGD'); end
            for i=18:23, sxr_g(i-16)=SF2ML(strcat('H_0',num2str(i)),'SXC',...
                    shot,t_start,t_end,0,'AUGD'); end
            for i=24:25, sxr_g(i-16)=SF2ML(strcat('H_0',num2str(i)),'SXI',...
                    shot,t_start,t_end,0,'AUGD'); end
        case 'H2'
            for i=47:50, sxr_g(i-46)=SF2ML(strcat('H_0',num2str(i)),'SXD',...
                    shot,t_start,t_end,0,'AUGD');end
            for i=51:60, sxr_g(i-46)=SF2ML(strcat('H_0',num2str(i)),'SXC',...
                    shot,t_start,t_end,0,'AUGD');end
        case 'H3'
            for i=81:84, sxr_g(i-80)=SF2ML(strcat('H_0',num2str(i)),'SXF',...
                    shot,t_start,t_end,0,'AUGD');end
            for i=85:95, sxr_g(i-80)=SF2ML(strcat('H_0',num2str(i)),'SXD',...
                    shot,t_start,t_end,0,'AUGD');end
        case 'G'
            for i=17:24, sxr_g(i-16)=SF2ML(strcat('G_0',num2str(i)),'SXJ',...
                    shot,t_start,t_end,0,'AUGD');end
            
    end
    
end

%Now data is ready to be saved. Displaying some fancy info for the user:
disp('==================================');
disp('Saving data... (Please be patient)');

%setting a default filename. Filename is good to be unique to avoid
%overwriting, but does not matter later, all data will be obtained by the
%other programs from the .mat file itself.
filename=['../raw_data/',num2str(shot),'_',camera,'_',num2str(t_start),...
    '_',num2str(t_end),'.mat'];

%Checking if raw_data folder exists, if not, creating it
if exist('../raw_data/','dir') ~= 7
    disp('Directory ../raw_data/ does not exist. Creating...');
    mkdir('../','raw_data');
    disp('Directory created.')
end
    

%Actual data saving
save(filename, 'sxr_g');
disp(['Succesfully saved ',filename]);

%Automated secure copy of the file, if scp is set.
if scp
    disp(['Secure copying file to ',remote])
    disp('(Your ssh password may be needed)')
    unix(['scp ',filename,' ',remote]);
end


