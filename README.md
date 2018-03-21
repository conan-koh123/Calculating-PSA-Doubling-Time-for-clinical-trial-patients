# Calculating PSA Doubling Time for clinical trial patients

I was asked by my Principal Investigator to calculate PSA doubling time for 200+ patients with prostate cancer. As calculating PSA doubling time is complex since it involves transforming data into logarithm form and plotting regression lines, it will take months for me to calculate PSA doubling time using a nomogram (https://www.mskcc.org/nomograms/prostate/psa_doubling_time). Hence, with reference to this website (http://palpable-prostate.blogspot.sg/2007/02/psa-doubling-time-r-code.html), I modified the code such that it can calculate the PSA doubling time of many patients and put the result in CSV format. The code in this folder is named as "Prostate_cancer_Calculating PSA doubling time for many patients.R". The sample data to test the code is in this folder as "Prostate_cancer_sample_data.csv"As it is my first time attempting to add values to a data frame in R, the resulting dataset may require some manipulation using Microsoft Excel. 

Formula and Logic to calculating PSA doubling time in the code:
(Modified from http://palpable-prostate.blogspot.sg/2007/02/psa-doubling-time-r-code.html)

- The assumption for calculating PSA doubling time is that the increase in PSA is a positive exponential one with the formula:
