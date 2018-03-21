#===
#Preparation before running code
#===
  
#Before using the code, be sure to have a csv format with the following data fields: Record.ID, PSA_Date and PSA
#Make sure there is data for different patients
#Ensure that the date is in dmy format (Since I am in Singapore, the date is in dmy format)

#===
#Start Code
#===
  
#import data from csv
psa.df <- read.csv(file.choose(), colClasses = c("character", "character", "numeric")) 

#Converting date of PSA into date format
library(lubridate)
psa.df$PSA_Date <- dmy(psa.df$PSA_Date)

#obtain unique patient list
library(dplyr)
psa_pt_list <-  psa.df %>% select(Record.ID)
psa_pt_list <- unique(psa_pt_list)
psa_pt <- lapply(split(psa_pt_list, rownames(psa_pt_list)), as.list)

#Create a result dataframe
result <- data.frame("PID")

# Code from http://palpable-prostate.blogspot.sg/2007/02/psa-doubling-time-r-code.html
# run regression for each patient in the list(variable psa.lm)
# calculate the number of days to double (variable dt)
# coef(psa.lm)[2] is the slope of the regression line (in variable dt)
# calculate the number of months to double (variable dtm)
# output: patient ID and PSA doubling time in months, which is added to the result dataframe
for (patient in psa_pt) {
  psa_data <- psa.df %>% filter(Record.ID == patient)
  psa.lm <- lm(log2(PSA) ~ PSA_Date, psa_data) 
  dt <- 1/coef(psa.lm)[2] 
  dtm <- 12/365 * dt  
  result[as.character(patient)] <- as.numeric(dtm)
  print(patient)
  print(dtm)
}

#Manipulate the result dataframe and obtaining final result
result_transpose <- as.data.frame(t(result))
names(result_transpose) <- c("PSA Doubling Time")

#import the result dataframe and manipulate the data in Excel
write.csv(result_transpose, "PSA_Doubling_time_result.csv")

#===
#End Code
#===