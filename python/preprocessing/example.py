import nti_wavelet_preprocessing_data_logic as dl
import nti_wavelet_preprocessing_data_class as dc

data1=dc.Data()
data2=dc.Data()
data1._Data__data=[0.1,1.1,2.1]
data1._Data__time=[0.1,1.1,2.1]
data2._Data_data=[0,0.5,1,1.5,2]
data2._Data_time=[0,0.5,1,1.5,2]
data1.channel_name='ch1'
data2.channel_name='ch2'
data1.sampling_frequency=1
data2.sampling_frequency=2
data_list=dl.DataLogic.data_list
data_list.append(data1)
data_list.append(data2)

dl.DataLogic.retrigger(dl.DataLogic, 'ch2')