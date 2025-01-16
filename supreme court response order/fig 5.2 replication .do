* upload cleaned data for specific year *
use "/Users/gabrielbo/Dropbox/src 2024/supreme court survey codebooks/cleaned survey data/supremecourtsurveydata2024_cleaned.dta"


* Step 1: Check for missing values in any of the diffuse variables
list diffuse1 diffuse2 diffuse3 diffuse4 diffuse5 if missing(diffuse1, diffuse2, diffuse3, diffuse4, diffuse5)

* Step 2: Drop observations with missing values in any of the diffuse variables
drop if missing(diffuse1, diffuse2, diffuse3, diffuse4, diffuse5)

* Step 1: Replace missing values with 0
replace diffuse1 = 0 if missing(diffuse1)
replace diffuse2 = 0 if missing(diffuse2)
replace diffuse3 = 0 if missing(diffuse3)
replace diffuse4 = 0 if missing(diffuse4)
replace diffuse5 = 0 if missing(diffuse5)

*^^ for these steps we are handling missing values in a multiple ways to try to get the exact values


* Step 1: Recode diffuse2 (inverse it)
gen diffuse2_recode = 6 - diffuse2

* Step 2: Standardize each variable to a 0-1 scale
gen diffuse1_std = (diffuse1 - 1) / 4
gen diffuse2_std = (diffuse2_recode - 1) / 4
gen diffuse3_std = (diffuse3 - 1) / 4
gen diffuse4_std = (diffuse4 - 1) / 4
gen diffuse5_std = (diffuse5 - 1) / 4

* Step 3: Calculate the average score
gen diffuse_avg = (diffuse1_std + diffuse2_std + diffuse3_std + diffuse4_std + diffuse5_std) / 5

* Optionally, summarize the average score
summarize diffuse_avg

* Step 4: Summarize for pid3 == 1 (dems)
summarize diffuse_avg if pid3 == 1

* Step 5: Summarize for pid3 == 2 (rep)
summarize diffuse_avg if pid3 == 2

* don't save!!! *
