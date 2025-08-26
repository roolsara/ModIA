# Example of the use of the Kalman Filter (KF) in a very simple 1D problem
# Goal: correction of noisy measurements of a 1D signal = water level measurements
# Trivial linear estimation problem: z = u + epsilon
import sys 	
import os
import numpy as np
import matplotlib.pyplot as plt

print("***************")
print("*** main.py ***")

# Generate data (synthetic data)
T =1; L = 10; npts = 20;
time = np.linspace(0, T, npts) # in IS units = seconds
data = np.linspace(0, L, npts) # + np.sin(2*np.pi/L) # the measurements (in IS units)
 
# observation errors: Gaussian noise
sigma_obs = 0.5
print('standard deviation of the observations errors sigma_obs = ', sigma_obs)
noise = np.random.normal(0, sigma_obs, npts) # to be tuned if necessary
noisy_data = data + noise # perturbed observations = the synthetic data

# Estimation by KF
estimated_value = np.zeros_like(data); prediction_perfect = np.zeros_like(data) # tab creation 
estimated_value[0] = noisy_data[0] # 1st value of estimation = the measurement

# model error: Gaussian 
sigma_f = 0.5
print('standard deviation of the model error sigma_f = ', sigma_f)

# KF gain (ref value and/or assumed to be constant)
KF_gain= sigma_f / (sigma_f + sigma_obs)
print('resulting gain coefficient KF_gain = ',KF_gain)

# references ("idealistic") estimations
# prediction model: z = u
perfect_values = data # perfect model values from perfect data
prediction_perfect_model = noisy_data # perfect model values from noisy data

# estimation by KF
for i in range(1, len(time)): 
    # prediction model: z = (Identity + eps_model)(u)
    predicted_value = estimated_value[i - 1] + np.random.normal(0, sigma_f)
    
    # analysis step
    gain = KF_gain # constant gain (here a scalar value)
    innovation = noisy_data[i] - predicted_value
    estimated_value[i] = predicted_value + gain * innovation # the analysis value

# Plots
plt.plot(time, noisy_data, 'o', label='measurements (= data)')
plt.plot(time, estimated_value, 'c', linewidth=3, label='estimation by KF')
plt.plot(time, prediction_perfect_model, '--k', label='prediction based on the perfect model from noisy data')
plt.plot(time, perfect_values, '--g', label='perfect (non-perturbed) data values')
plt.xlabel('time'); plt.ylabel('values')
plt.legend(); plt.show()
