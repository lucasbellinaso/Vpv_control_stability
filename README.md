# Adaptive voltage control of Photovoltaic Boost Converter - Stability Analysis
A MATLAB GUI (Graphical User Interface) is available for analyzing stability of the adaptive voltage control proposed in the manuscript "Cascade control with adaptive voltage controller applied to photovoltaic boost converters".
Authors: Dr. Lucas Vizzotto Bellinaso, Eng. Henrique Horst Figueira, Eng. Mauro Fernando Basquera Jr., Dr. Rodrigo Padilha Vieira, Dr. Hilton Abílio Gründling, Dr. Leandro Michels.   Power Electronics and Control Group / Federal University of Santa Maria.
This project is funded by the Brazilian National Institute of Science and Technology on Distributed Generation.

How to run the MATLAB GUI Application:
1) Download and unpack the file "Voltage_stability_analysis_MATLAB_complete.zip"
2) Paste all files into a same MATLAB folder ("Current folder").
3) Run the script "Voltage_stability_analysis.m".

To use the application:
1) Define the value and tolerance of capacitance Cpv, connected in parallel to the PV array.
2) Define the voltage control sampling frequency (fs2). The inner current loop bandwidth must be always higher than the Nyquist frequency (fs2/2), so the inner current loop can be considered a gain with instant dynamics.
3) Change the resistances rpv and estimated rpv to change the converter operation range, where:
   3.1) rpv is the small-sinal resistance of the PV array.
   3.2) ^rpv (with hat) is defined inside the software by the control designer.
4) Change fcv, which is the frequency which the open voltage loop crosses 0dB when ^rpv (hat) tracks rpv with null zero.
5) Press the button "Press to Calculate" to plot to root locus and verify the stability to all operation points. You can select to consider the parametric variations of Cpv (component tolerance).

This application is a multimedia content attached to the manuscript submitted to IEEE Transactions on Industry Applications. More information about the system is explained in the manuscript.
