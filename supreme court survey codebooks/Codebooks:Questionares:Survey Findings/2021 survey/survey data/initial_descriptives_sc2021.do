*** This file puts together some simple descriptive stats for the Court cases***
*** Neil Malhotra ***
*** 4/20/21 ****


cd "C:\Users\neilm\Dropbox\supremecourt\2021 survey\survey data"
use supremecourtdata2021_cleaned, clear
set more off


// Recode to make 1 the liberal response


recode acatax_per (1=2) (2=1)
recode acatax_court (1=2) (2=1)
recode acasev_per (1=2) (2=1)
recode acasev_court (1=2) (2=1)
recode donors_per (1=2) (2=1)
recode donors_court (1=2) (2=1)
recode ncaa_per (1=2) (2=1)
recode ncaa_court (1=2) (2=1)
recode covidchurch_per (1=2) (2=1)
recode covidchurch_court (1=2) (2=1)
recode agencies_per (1=2) (2=1)
recode agencies_court (1=2) (2=1)
recode warrants_per (1=2) (2=1)
recode warrants_court (1=2) (2=1)

svyset [pweight=weight]

foreach var of varlist *_per {
recode `var' (2=0)
}

foreach var of varlist *_court {
recode `var' (2=0)
}

rename ideology_court ideology_court2

mat results = J(14,8,0)

local a =1
foreach var of varlist *_per {
qui svy: mean  `var'
mat results[`a',1] = e(b)
local ++a
}

local a =1
foreach var of varlist *_per {
qui svy: mean  `var' if pid3==1
mat results[`a',2] = e(b)
local ++a
}

local a =1
foreach var of varlist *_per {
qui svy: mean  `var' if pid3==2
mat results[`a',3] = e(b)
local ++a
}

local a =1
foreach var of varlist *_per {
qui svy: mean  `var' if pid3==3
mat results[`a',4] = e(b)
local ++a
}

local a =1
foreach var of varlist *_court {
qui svy: mean  `var'
mat results[`a',5] = e(b)
local ++a
}

local a =1
foreach var of varlist *_court {
qui svy: mean  `var' if pid3==1
mat results[`a',6] = e(b)
local ++a
}

local a =1
foreach var of varlist *_court {
qui svy: mean  `var' if pid3==2
mat results[`a',7] = e(b)
local ++a
}

local a =1
foreach var of varlist *_court {
qui svy: mean  `var' if pid3==3
mat results[`a',8] = e(b)
local ++a
}

mat2txt, matrix(results) saving(tab1) replace














