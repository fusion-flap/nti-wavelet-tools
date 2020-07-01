pro convert_processed_sav,filename

restore,filename

expname = saved_datablock.expname
shotnumber = saved_datablock.shotnumber
timerange = saved_datablock.timerange
samplefreq = saved_datablock.samplefreq
numofchann = saved_datablock.numofchann
data_history = saved_datablock.data_history
coord_history = saved_datablock.coord_history
channels = *saved_datablock.channels
channels_ind = *saved_datablock.channels_ind
data = *saved_datablock.data
time = *saved_datablock.time
theta = *saved_datablock.theta
phi = *saved_datablock.phi
channelpairs = *saved_datablock.channelpairs
channelpairs_ind = *saved_datablock.channelpairs_ind
channelpairs_num = saved_datablock.channelpairs_num
datapoints = saved_datablock.datapoints
transf_version = saved_datablock.transf_version
crosstr_version = saved_datablock.crosstr_version
coh_version = saved_datablock.coh_version
mode_version = saved_datablock.mode_version
transf_timeax = *saved_datablock.transf_timeax
transf_freqax = *saved_datablock.transf_freqax
transf_scaleax = *saved_datablock.transf_scaleax
transforms = *saved_datablock.transforms
smoothed_apsds = *saved_datablock.smoothed_apsds
crosstransforms = *saved_datablock.crosstransforms
smoothed_crosstransforms = *saved_datablock.smoothed_crosstransforms
coherences = *saved_datablock.coherences
transfers = *saved_datablock.transfers
modenumbers = *saved_datablock.modenumbers
qs = *saved_datablock.qs

; Possible further variables to convert:
;"PROC_TRANSF_SELECTION": 0,
;"PROC_TRANSF_CWT_SELECTION": 0,
;"PROC_TRANSF_CWT_FAMILY": "Morlet",
;"PROC_TRANSF_CWT_ORDER": 6,
;"PROC_TRANSF_CWT_DSCALE": 0.10000000000000001,
;"PROC_TRANSF_STFT_SELECTION": 1,
;"PROC_TRANSF_STFT_WINDOW": "Gauss",
;"PROC_TRANSF_STFT_LENGTH": 200,
;"PROC_TRANSF_STFT_FRES": 800,
;"PROC_TRANSF_STFT_STEP": 6,
;"PROC_TRANSF_FREQ_MIN": 0.00000000000000000,
;"PROC_TRANSF_FREQ_MAX": 200.00000000000000,
;"PROC_TRANSF_FREQ_RESDATAPOINTS": 8000.0000000000000,
;"PROC_CROSSTR_SELECTION": 0,
;"PROC_CROSSTR_CORRECTION_SELECTION": 1,
;"PROC_COH_SELECTION": 0,
;"PROC_COH_AVG": 0,
;"PROC_TRANSFER_SELECTION": 0,
;"PROC_MODE_SELECTION": 0,
;"PROC_MODE_TYPE": "Toroidal",
;"PROC_MODE_FILTER": "Rel.pos.",
;"PROC_MODE_OPTIMIZED": 0,
;"PROC_MODE_STEPS": 1.0000000000000000,
;"PROC_MODE_MIN": -6,
;"PROC_MODE_MAX": 6,

save, expname, shotnumber, timerange, samplefreq, numofchann, data_history, coord_history, channels, channels_ind, $
  data, time, theta, phi, channelpairs, channelpairs_ind, channelpairs_num, datapoints, $
  transf_version, crosstr_version, coh_version, mode_version, transf_timeax, transf_freqax, transf_scaleax, $
  transforms, smoothed_apsds, crosstransforms, smoothed_crosstransforms, coherences, transfers, modenumbers, $
  qs, filename=filename + '_modified.sav'
  
end
