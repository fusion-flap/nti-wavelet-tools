;+
;NAME: check_idl_python_bridge
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2017.03.08.
;
; PURPOSE: Test proper functioning of IDL-Python bridge (available for IDL version 8.6 and above). Run in IDL, tests passing 
; variable to Python, running Python function and returning the variable. Optionally adds reference folder to system path.
;
; CALLING SEQUENCE:
;	bridge_available=check_idl_python_bridge()
;
; INPUTS:
;   startpath (optional): Adds location of NTI Wavelet Tools main files, acting as reference path, to the system path
;   for the scope of the IDL session 
;
; OUTPUT: 
;   bridge_available: Boolean value indicating functionality of IDL-Python bridge
;
;-

function check_idl_python_bridge, startpath

  ; Initialize
  bridge_available = boolean(0)
  test_string = "IDL-Pyton bridge ok"
  return_string = "IDL-Pyton bridge NOT working!"
  
  ; Error handling
  catch, error_status
  if error_status NE 0 then return, bridge_available
  
  ; Bridge test
  if nti_wavelet_defined(startpath) then begin
    Python.startpath = startpath
    Python.Run, 'import sys'
    Python.Run, 'sys.path.append(startpath)'
  endif
  check_module = Python.Import('python.utility.check_idl_python_bridge')
  return_string = check_module.check_idl_python_bridge(test_string)
  if return_string EQ test_string then bridge_available = boolean(1)
  
  print, 'IDL: '+ return_string
  return, bridge_available
end