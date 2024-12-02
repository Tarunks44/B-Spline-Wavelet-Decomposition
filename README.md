This code implements a spline wavelet decomposition analysis system. Here are the key components:

Core Functions:


bspline_filter: Generates filter coefficients for different spline orders (1-4)
spline_wavelet_decomp: Performs wavelet decomposition using splines, calculating approximation and detail coefficients


Signal Processing Steps:


Creates test signal combining three sinusoids
Decomposes signal using different spline orders
Calculates MSE at each decomposition level
Stores coefficients for visualization


Visualization System:


Shows original input signal
Creates separate figures for each spline order showing:

Original signal
Approximation coefficients
Detail coefficients


Generates MSE comparison bar plot
Displays statistics in text boxes


Key Parameters:


Decomposition level: 3
Spline orders: 1-4
Test signal: Combination of 10Hz, 50Hz, and 100Hz components

This implementation helps analyze signal characteristics at different scales and compare performance across spline orders.
