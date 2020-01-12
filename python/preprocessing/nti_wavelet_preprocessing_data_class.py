class Data(object):
    experiment_name = None
    shot_number = None
    channel_name = None
    coordinates_history = None
    data_history = None
    __data = None
    new_data = None
    __time = None
    new_time = None
    phi = None
    theta = None
    #__tokamak_coordinates = None           #instead of phi and theta
    #new_tokamak_coordinates = None
    sampling_time = None
    sampling_frequency = None
    nyquist_frequency = None
    n_data_points = None


    def __init__(self):
        super(Data, self).__init__()
        #self.calculate_sampling_data()


    def calculate(self, data):
        data.n_data_points = len(data._Data__data)
        data.sampling_time = (data._Data__time[-1] - data._Data__time[0])/(data.n_data_points-1)
        data.sampling_frequency = 1/ data.sampling_time
        data.nyquist_frequency = data.sampling_frequency/2


    def change_sampling(self,new_time_input,add_data_history):
        # self.resampling code
        self.calculate_sampling_data()

'''
	def reset_sampling(self):
	
	def change_coordinates(self,new_coordinates_input,add_coordinates_history):
	
	def reset_coordinates(self):
	
	def calculate_sampling_data(self):
'''
