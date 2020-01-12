%gp_ece_savedata - routine to save AUG ECE data, written by
%papp@reak.bme.hu, last changed on 2009-07-28.
%
%To activate automatic interface, run without arguements.
%--------------------------------------------------------
%   shot:    shotnumber as an integer.
%   t_start: start of time interval
%   t_end:   end of time interval
%   scp:     automatically secure copy (via ssh) to a remote computer.
%   remote:  Optional override of the default remote machine.
%            Just skip/hit return if default is OK.
%
%Syntax for automated execution:
%gp_ece_savedata(shot,t_start,t_end,scp,remote)
%example:
%gp_ece_savedata(20975,2,6,1)
%
%(for more help, see the .m file)

% Version history:
% 2009-07-28    papp    Actually rewritten old version


%initializing the function
function gp_ece_savedata(shot,t_start,t_end,scp,remote)

%Setting defaults
remote_def = 'data@deep.reak.bme.hu:asdex/raw_data/';

%set dummy remote value if remote is not present in the input
if nargin < 5
    remote='';
end

%Adding basic IPP library files in order to have SF2ML
addipplib

%Cheking input arguements. If not enough arguements are present, the
%automatic interface will launch.
if nargin < 4
    
    %If there are some arguements but not enough, a warning appears, and
    %the interface starts.
    if nargin > 0
        disp('Not enough input arguements (<4), activating input interface...');
    end
    
    %Activation of the interface
    disp(' Please load the information about the requested shot');
    shot    = input('Shot number:  ');
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


%give some info to the user about what is goint to happen
disp('Loading ECE signals...');

%Actual data reading with SF2ML
%Getting ECE data and channel positions as functions of time
ece=SF2ML('Trad-A','CEC',shot,t_start,t_end,0,'AUGD');
ece_z=SF2ML('z-A','CEC',shot,t_start,t_end,0,'AUGD');
ece_R=SF2ML('R-A','CEC',shot,t_start,t_end,0,'AUGD');



%Now data is ready to be saved. Displaying some fancy info for the user:
disp('==================================');
disp('Saving data... (Please be patient)');

%setting a default filename. Filename is good to be unique to avoid
%overwriting.
filename=['../raw_data/',num2str(shot),'_ECE_',num2str(t_start),'_',num2str(t_end),'.mat'];

%Checking if raw_data folder exists, if not, creating it
if exist('../raw_data/','dir') ~= 7
    disp('Directory ../raw_data/ does not exist. Creating...');
    mkdir('../','raw_data');
    disp('Directory created.')
end
    
%Actual data saving
save(filename,'ece','ece_z','ece_R');
disp(['Succesfully saved ',filename]);

%Automated secure copy of the file, if scp is set.
if scp
    disp(['Secure copying file to ',remote])
    disp('(Your ssh password may be needed)')
    unix(['scp ',filename,' ',remote]);
end


