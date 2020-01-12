%gp_sxr_diag - routine to get AUG SXR DIAG names, written by
%papp@reak.bme.hu, last changed on 2009-07-08.
%
%To activate automatic interface, run without arguements.
%--------------------------------------------------------
%   shot:   shotnumber as an integer.
%   camera: camera name, eg. 'J_053' (command line)
%                        or   J_053  (input interface)
%
%Syntax for automated execution: 
%gp_sxr_diag(shot,camera)
%example:
%diag=gp_sxr_diag(20975,'J_053')
%
%(for more help, see the .m file)

% Version history:
% 2009-07-07    papp    Start
% 2009-07-08    papp    New method for getting back diag from WhichSX

%initializing the function
function diag=gp_sxr_diag(shot,channel)

%Cheking input arguements. If not enough arguements are present, the
%automatic interface will launch.
if nargin < 2
    
    %If there are some arguements but not enough, a warning appears, and
    %the interface starts.
    if nargin > 0
        disp('Not enough input arguements (<2), activating input interface...');
    end
    
    %Activation of the interface
    disp(' Please load the information about the requested DIAG');
    shot    = input('Shot number:  ');
    channel  = input('Channel name: ','s');
end

%getting diagnostic name for the given shot and given channel with
%WhichSX subroutine. grep cuts the proper line from its output, tr
%truncates the space characters, cut cuts out the proper values. All these
%are echoed back with the -n switch to supress the line break which matlab
%would get back too.
[error,diag]=unix(['echo -n `WhichSX ',num2str(shot),' ',channel,...
                   '|grep Diag|tr -d " "|cut -d: -f4`']);

%If there is an error or diag is empty, send warning,
%set output to 'ERR' and return
if error  | isempty(diag)
    disp(['Error in WhichSX while getting diagnostic name for -',...
           channel,'- in shot -',num2str(shot),'-!'])
       
    disp('Channel does not exist or disconnected.')
    diag='ERR';
    return

end
