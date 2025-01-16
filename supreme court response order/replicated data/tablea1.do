///////////////////////////////////
// Code to Create Table A1 in Online Appendix
// author: neil malhotra
// date created: 8/17/21
// date updated: 12/23/23
///////////////////////////////////

// This code reproduces the results in Table A1 in the Online appendix. Statistics are produced individually for each of the three waves: 2022, 2021, 2020

// Note: Change your working directory appropriately

// 2022 data

insheet using 2022-SCOTUSpoll-withideal-and-perceptions_statafriendly.csv, clear

gen dem = pid7==1|pid7==2|pid7==3
gen rep = pid7==5|pid7==6|pid7==7

svyset [pweight=weight]

// Demographics (Table A1)

svy: tab gender
svy: tab age4
svy: tab race
svy: tab educ4
svy: tab rep
svy: tab dem


// 2021 data

insheet using 2021-SCOTUSpoll-withideal-and-perceptions_statafriendly.csv, clear

gen dem = pid7==1|pid7==2|pid7==3
gen rep = pid7==5|pid7==6|pid7==7

svyset [pweight=weight]


// Demographics (Table A1)

svy: tab gender
svy: tab age4
svy: tab race
svy: tab educ4
svy: tab rep
svy: tab dem



// 2020 data

insheet using 2020-SCOTUSpoll-withideal-and-perceptions_statafriendly.csv, clear

gen dem = pid7==1|pid7==2|pid7==3
gen rep = pid7==5|pid7==6|pid7==7


svyset [pweight=weight]


// Demographics (Table A1)

svy: tab gender
svy: tab age4
svy: tab race
svy: tab educ4
svy: tab rep
svy: tab dem



