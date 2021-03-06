# Calculating PSA Doubling Time for a group of patients (In months)

I was asked by my Principal Investigator to calculate Prostate Specific Antigen (PSA) doubling time (in months), which is the time taken for PSA to double from its initial value, for 500+ patients with prostate cancer. As calculating PSA doubling time is complex since it involves transforming data into logarithm form and plotting regression lines, it will take months for me to calculate PSA doubling time using a nomogram. Hence, with reference to this website (http://palpable-prostate.blogspot.sg/2007/02/psa-doubling-time-r-code.html), I modified the code such that it can calculate the PSA doubling time of many patients and put the result in CSV format. The result is close to that from a nomogram created by Memorial Sloan Kettering Cancer Centre (https://www.mskcc.org/nomograms/prostate/psa_doubling_time).

The code in this folder is named as "Prostate_cancer_Calculating PSA doubling time for many patients.R". The sample data to test the code is in this folder as "Prostate_cancer_sample_data.csv". 

Before using the code, ensure that there is a exising csv file with the following data fields: Record.ID, PSA_Date and PSA (as according to the sample data in the folder). Make sure that is data for different patients and the date is in dmy format. The code begin from the label "#Start Code" and end with the label "#End Code". 

As it was my first time adding data to a dataframe in R, the resulting dataset may require manipulation in Microsoft Excel (as shown below) 

Below are the formula for calculating PSA doubling time, result from the code and references used.

==

Formula and Logic to calculating PSA doubling time (in months) in the code:

The assumption for calculating PSA doubling time is that the increase in PSA is a positive exponential one with the formula:
> PSA now = initial PSA x e ^ (k x time interval in days)

The equation is manipulated in the following manner to obtain PSA doubling time:
> PSA now/ initial PSA = e ^ (k x time interval in days) = 2 [2 as PSA is doubled]

> In 2 = k x time interval in days [natural log on both sides]

> PSA doubling time = In 2/ k

> PSA doubling time = In 2/ slope of In PSA vs time interval

Since the code uses log2 in its formula:
> PSA doubling time = log2(2)/ slope of log2(PSA) vs time interval

> PSA doubling time = 1/ slope of log2(PSA) vs date of PSA recorded

==

Result from the code

<br>
<img height = "300", src = "https://github.com/conan-koh123/Calculating-PSA-Doubling-Time-for-clinical-trial-patients/blob/master/Result%20of%20sample%20data.jpg"/>
</br>
==

Reference used:
- Nomogram: https://www.mskcc.org/nomograms/prostate/psa_doubling_time
- Referred R code: http://palpable-prostate.blogspot.sg/2007/02/psa-doubling-time-r-code.html 
- Equations of PSA Doubling time: http://www.meducator3.net/algorithms/content/psa-doubling-time-psadt
- Sample dataset: Vickers, A. J., & Brewster, S. F. (2012). PSA Velocity and Doubling Time in Diagnosis and Prognosis of Prostate Cancer. British Journal of Medical & Surgical Urology, 5(4), 162–168. http://doi.org/10.1016/j.bjmsu.2011.08.006

