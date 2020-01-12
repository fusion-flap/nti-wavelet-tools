pro gp_fit_bp_constants,N,norm=norm,crash_group=crash_group,$
                        crash_times=crash_times,A_orig=A_orig,$
                        thro=thro

;setting crash group to know crash times
case N of
   8:  crash_group='20975_A'
   5:  crash_group='24006_A'
;   5:  crash_group='20975_A1'
   15: crash_group='20975_D'
   17: crash_group='20974_A'
   19: crash_group='23476_1'
   16: crash_group='23476_1b'
   9:  crash_group='23476_2'
endcase
print,'Selected crash group: '+crash_group

case crash_group of
   '20975_D': begin
      crash_times=[$
         1.4366, 1.5235, 1.6045, 1.6776,$
         1.7531, 1.8243, 1.8968, 1.9689,$
         2.11, 2.1833, 2.2523,$
         2.32, 2.3868, 2.456, 2.5235]
      A_orig=[0.05,700,0]
      if norm then A_orig=[1.5,700,0]
      thro=0.001
   end
   '20974_A': begin
      crash_times=[$
         1.4219, 1.5143, 1.5949, 1.6681,$
         1.7393, 1.80635, 1.8736, 1.9394,$
         2.0049, 2.0663, 2.1298, 2.1928,$
         2.25915, 2.3244, 2.3899, 2.4543,$
         2.5136]
      A_orig=[0.05,700,0]
      if norm then A_orig=[1.5,700,0]
      thro=0.001
   end
   '20975_A': begin
      crash_times=[$
         3.948, 4.051, 4.1345, 4.217,$
         4.3013, 4.378, 4.446, 4.507]
      A_orig=[0.05,700,0]
      if norm then A_orig=[1.5,700,0]
      thro=0.001
   end
   '20975_A1': begin
      crash_times=[$
         4.051,4.3013, 4.378, 4.446,$
         4.507]
      A_orig=[0.05,700,0]
      if norm then A_orig=[1.5,700,0]
      thro=0.001
   end
   '23476_1': begin
      crash_times=[$
         2.7081, 2.7415, 2.7785, 2.8204,$
         2.8637, 2.9066, 2.9496, 2.9925,$
         3.0332, 3.0739, 3.1188, 3.1633,$
         3.2084, 3.2528, 3.2987, 3.3439,$
         3.3844, 3.4396, 3.4876]
      A_orig=[20000,900,0]
      if norm then A_orig=[1.5,700,0]
      thro=400
   end
   '23476_1b': begin
      crash_times=[$
         2.8204,$
         2.8637, 2.9066, 2.9496, 2.9925,$
         3.0332, 3.0739, 3.1188, 3.1633,$
         3.2084, 3.2528, 3.2987, 3.3439,$
         3.3844, 3.4396, 3.4876]
      A_orig=[20000,900,0]
      if norm then A_orig=[3,1500,0]
      thro=400
   end
   '23476_2': begin
      crash_times=[$
         3.7238, 3.7757, 3.8250,$
         3.8770, 3.9307, 3.9837, 4.0377,$
         4.0920, 4.1442]
      A_orig=[20000,900,0]
      if norm then A_orig=[1.5,700,0]
      thro=400
   end
   '24006_A': begin
      crash_times=[1.5555013, 1.6537532, 1.8310067, 1.9175084, 2.0072503]
      A_orig=[50,700,0]
      if norm then A_orig=[1.5,700,0]
      thro=0.001
   end
endcase

end
