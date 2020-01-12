from idlpy import IDL
import nti_wavelet_preprocessing_data_class
import scipy.io
import numpy


class DataLogic(object):
    data_list = []

    def __init__(self):
        pass

    def delete_data(self, data_list, data_number):
        print(data_number, data_list[data_number].channel_name, 'deleted')
        del data_list[data_number]

    def read_text(self, data_list, file_path, delimiter = ',', headersize = 1,
                  time_col=0, data_col=1,  experiment_name = None, shot_number = None,
                  channel_name = None, coordinates_history = None, data_history = None):

        data_matrix = numpy.loadtxt(file_path, delimiter = delimiter,
                                    skiprows = int(headersize), usecols=(time_col,data_col))

        data = nti_wavelet_preprocessing_data_class.Data()
        data._Data__time = data_matrix[:,time_col]
        data._Data__data = data_matrix [:,data_col]
        data.experiment_name = experiment_name
        data.shot_number = shot_number
        data.channel_name = channel_name
        data.coordinates_history = coordinates_history
        data.data_history = data_history

        nti_wavelet_preprocessing_data_class.Data.calculate(self, data)


    def read_matlab(self, data_list, file_path, time_name = 'time', data_name ='data', channel_name = 'channel_name',
                    experiment_name ='experiment_name',shot_number = 'shot_number',
                    coordinates_history = 'coordinates_history', data_history = 'data_history' ):
        matlab_data = scipy.io.loadmat(file_path)
        data_keys = list(matlab_data.keys())
        data = nti_wavelet_preprocessing_data_class.Data()
        for i in range(0, len(data_keys)): ##later in another more elegant way
            if data_keys[i] == time_name:
                data._Data__time = matlab_data[data_keys[i]][0, :]
            elif data_keys[i] == data_name:
                data._Data__data = matlab_data[data_keys[i]][0, :]
            elif data_keys[i] == channel_name:
                data.channel_name = matlab_data[data_keys[i]][0]  #string
            elif data_keys[i] == experiment_name:
                data.experiment_name = matlab_data[data_keys[i]][0] #string
            elif data_keys[i] == shot_number:
                data.shot_number = matlab_data[data_keys[i]][0,:] #int
            elif data_keys[i] == coordinates_history:
                data.coordinates_history = matlab_data[data_keys[i]][0]  #string
            elif data_keys[i] == data_history:
                data.data_history = matlab_data[data_keys[i]][0] #string

        #r, fi, theta
        nti_wavelet_preprocessing_data_class.Data.calculate(self, data)

        data_list.append(data)


#    def read_wav(self, file_path):
#        self.error = QtGui.QLabel("\n Function of reading wav files is currently not available. \n")


    def read_nwt(self, file_path):
        IDL.restore(file_path)

        for i in range (0, len(IDL.channels)):

            data = nti_wavelet_preprocessing_data_class.Data()
            data.experiment_name = IDL.expname
            data.shot_number = IDL.shotnumber
            data.coordinates_history = IDL.coord_history
            data.data_history = IDL.data_history
            data.phi = IDL.phi[i]
            data.theta = IDL.theta[i]
            data.channel_name = IDL.channels[i]
            data._Data__data = IDL.data[i,:].tolist()
            data._Data__time = IDL.timeax.tolist()
            nti_wavelet_preprocessing_data_class.Data.calculate(self, data)
            self.data_list.append(data)

    # def get_rawsignal(self, tokamak):
    #     data = IDL.get_rawsignal_fun(87879,'JET/JPF/DA/C1M-I802',datapath='/data/JET')
    #     print(data)

    def set_metadata(self, data_number, experiment_name = None , shot_number = None,
                     channel_name = None, coordinates_history = None, data_history = None, phi = None, theta = None):

        self.data_list[data_number].experiment_name = experiment_name
        self.data_list[data_number].shot_number = shot_number
        self.data_list[data_number].channel_name = channel_name
        self.data_list[data_number].coordinates_history = coordinates_history
        self.data_list[data_number].data_history = data_history
        self.data_list[data_number].phi = phi
        self.data_list[data_number].theta = theta

    def retrigger(self, channel_name):
        print('ok')
        for j in range(0, len(self.data_list)):
            if self.data_list[j].channel_name == channel_name:
                default_number = j

        for i in range(0, len(self.data_list)):
            delta = self.data_list[default_number]._Data__time[0] - self.data_list[i]._Data__time[0]
            fraction = [float(delta)*self.data_list[i].sampling_frequency]

            self.data_list[i].new_data = IDL.pg_retrigger(numpy.asarray(self.data_list[i]._Data__data),
                                                          numpy.asarray(fraction)[0])

            self.data_list[i].new_time = [t + delta for t in self.data_list[i]._Data__time]

            print(self.data_list[i]._Data__data, i, 'original data')
            print(self.data_list[i]._Data__time, i, 'original time')
            print(self.data_list[i].new_data, i, 'retriggered data')
            print(self.data_list[i].new_time, i, 'retriggered time')

        self.resample(self,channel_name)

    def resample(self, channel_name):
        for j in range(0, len(self.data_list)):
            if self.data_list[j].channel_name == channel_name:
                default_number = j

        for i in range(0, len(self.data_list)):
            self.data_list[i].new_data = IDL.pg_resample(numpy.asarray(self.data_list[i].new_data),
                                                       len(self.data_list[default_number].new_time))
            self.data_list[i].new_time = self.data_list[default_number]._Data__time
            print(self.data_list[i].new_data, i, 'resampled data')
            print(self.data_list[i].new_time, i, 'resampled time')


    def save_file(self, data_list, file_path):
        channels = []
        theta = []
        phi = []
        datas = []
        for i in range(0, len(self.data_list)):
            # if attributes except data and channel_name is not the same -> error
            datas.append(data_list[i]._Data__data)
            channels.append(data_list[i].channel_name)
            theta.append(data_list[i].theta)
            phi.append(data_list[i].phi)

        datas = numpy.asarray(datas)
        #channels = numpy.asarray(channels)
        theta = numpy.asarray(theta)
        phi = numpy.asarray(phi)

        expname = data_list[0].experiment_name
        shotnumber = data_list[0].shot_number
        # later coordinates_history and data_history lists every signal
        data_history = 'Loaded-with-NTI-Wavelet-Preprocessing_Tool'
        coord_history = 'Loaded-with-NTI-Wavelet-Preprocessing_Tool'
        time = numpy.asarray(data_list[0]._Data__time)

        IDL.datas = datas
        IDL.channels = channels
        IDL.time = time
        IDL.theta = theta
        IDL.phi = phi

        #output = {'expname': expname, 'shotnumber': shot_number, 'channels' : channels,
        #                   'coord_history': coord_history, 'data_history' : data_history,
        #                   'data' : data[1][0:5], 'time' : timeax[0:5], 'theta' : theta, 'phi' : phi}

        IDL.nti_wavelet_bridge(expname=expname,shotnumber=shotnumber,channels=channels,datas=datas,
                               time=time,theta=theta,phi=phi,data_history=data_history,coord_history=coord_history,
                               file_name=file_path, nocall=1)
        #IDL.save(input_structure, filename='file.sav')




