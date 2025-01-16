///////////////////////////////////
// Code to Create Tables S4, S5, S6 in SI
// “A decade-long longitudinal survey shows that the Supreme Court is now much more conservative than the public” (PNAS)
// author: neil malhotra
// date created: 8/17/21
// date updated: 4/15/22
///////////////////////////////////

// This code reproduces the results in Tables S4, S5, and S6 in the SI. Statistics are produced individually for each of the three waves: 2021, 2020, 2010

// Note: Change your working directory appropriately

// 2021 data

insheet using "C:\Users\neilm\Dropbox\supremecourt\surveys-with-ideal\2021-SCOTUSpoll-withideal-and-perceptions_statafriendly.csv", clear

gen dem = pid7==1|pid7==2|pid7==3
gen rep = pid7==5|pid7==6|pid7==7

svyset [pweight=weight]


// Demographics (Table S4)

svy: tab gender
svy: tab age4
svy: tab race
svy: tab educ4
svy: tab rep
svy: tab dem

//// AGREEMENT

// Coding Agreement


foreach var of varlist gayadoption_per azprovballot_per azcollectballot_per schoolspeech_per juvcrime_per databases_per ncaa_per unions_per warrants_per {
gen `var'_agree = `var'==2 if `var'!=.
}

foreach var of varlist donors_per  covidchurch_per agencies_per {
gen `var'_agree = `var'==1 if `var'!=.
}

// Full Sample (Table S5, column 6)

mat results = J(12,1,0)
local a =1

foreach var of varlist gayadoption_per_agree-agencies_per_agree {
qui svy: mean `var'
mat results[`a',1] = e(b)
local ++a
}

matrix list results

// Republicans (Table S5, column 7)

mat results = J(12,1,0)
local a =1

foreach var of varlist gayadoption_per_agree-agencies_per_agree {
qui svy: mean `var' if rep==1
mat results[`a',1] = e(b)
local ++a
}

matrix list results

// Democrats (Table S5, column 8)

mat results = J(12,1,0)
local a =1

foreach var of varlist gayadoption_per_agree-agencies_per_agree {
qui svy: mean `var' if dem==1
mat results[`a',1] = e(b)
local ++a
}

matrix list results

// Coding Accurate Prediction


foreach var of varlist gayadoption_court azprovballot_court azcollectballot_court schoolspeech_court juvcrime_court databases_court ncaa_court unions_court warrants_court {
gen `var'_predict = `var'==2 if `var'!=.
}

foreach var of varlist donors_court  covidchurch_court agencies_court {
gen `var'_predict = `var'==1 if `var'!=.
}


// Full Sample (Table S5, column 9)

mat results = J(12,1,0)
local a =1

foreach var of varlist gayadoption_court_predict-agencies_court_predict {
qui svy: mean `var'
mat results[`a',1] = e(b)
local ++a
}

matrix list results

// Republicans (Table S5, column 10)

mat results = J(12,1,0)
local a =1

foreach var of varlist gayadoption_court_predict-agencies_court_predict {
qui svy: mean `var' if rep==1
mat results[`a',1] = e(b)
local ++a
}

matrix list results

// Democrats (Table S5, column 11)

mat results = J(12,1,0)
local a =1

foreach var of varlist gayadoption_court_predict-agencies_court_predict {
qui svy: mean `var' if dem==1
mat results[`a',1] = e(b)
local ++a
}

matrix list results

// Coding Liberal Position Taking 

foreach var of varlist donors_per covidchurch_per agencies_per warrants_per ncaa_per {
gen `var'_lib = `var'==2 if `var'!=.
}

foreach var of varlist gayadoption_per azprovballot_per azcollectballot_per schoolspeech_per juvcrime_per databases_per  unions_per  {
gen `var'_lib = `var'==1 if `var'!=.
}

egen percent_liberal = rowmean (donors_per_lib covidchurch_per_lib agencies_per_lib warrants_per_lib ncaa_per_lib gayadoption_per_lib azprovballot_per_lib azcollectballot_per_lib schoolspeech_per_lib juvcrime_per_lib databases_per_lib unions_per_lib)

// Table S6 (column 2)

svy: mean percent_liberal
svy: mean percent_liberal if rep==1
svy: mean percent_liberal if dem==1

egen percent_agree = rowmean (gayadoption_per_agree azprovballot_per_agree azcollectballot_per_agree schoolspeech_per_agree juvcrime_per_agree databases_per_agree ncaa_per_agree unions_per_agree warrants_per_agree donors_per_agree covidchurch_per_agree agencies_per_agree)

// Table S6 (column 4)

svy: mean percent_agree
svy: mean percent_agree if rep==1
svy: mean percent_agree if dem==1

egen percent_predict = rowmean (gayadoption_court_predict azprovballot_court_predict azcollectballot_court_predict schoolspeech_court_predict juvcrime_court_predict databases_court_predict ncaa_court_predict unions_court_predict warrants_court_predict donors_court_predict covidchurch_court_predict agencies_court_predict)

// Table S6 (column 5)

svy: mean percent_predict
svy: mean percent_predict if rep==1
svy: mean percent_predict if dem==1

// Coding Personal Opinions Matching Court Predictions

foreach y in donors covidchurch agencies warrants ncaa gayadoption azprovballot azcollectballot schoolspeech juvcrime databases unions {
gen `y'_match = .
recode `y'_match (.=1) if  (`y'_per == `y'_court)&`y'_per!=.&`y'_court!=. 
recode `y'_match (.=0) if  (`y'_per != `y'_court)&`y'_per!=.&`y'_court!=.
}

egen percent_match = rowmean (donors_match covidchurch_match agencies_match warrants_match ncaa_match gayadoption_match azprovballot_match azcollectballot_match schoolspeech_match juvcrime_match databases_match unions_match)

// Table S6 (column 6)
	
svy: mean percent_match
svy: mean percent_match if rep==1
svy: mean percent_match if dem==1	







// 2020 data

insheet using "C:\Users\neilm\Dropbox\supremecourt\surveys-with-ideal\2020-SCOTUSpoll-withideal-and-perceptions_statafriendly.csv", clear

gen dem = pid7==1|pid7==2|pid7==3
gen rep = pid7==5|pid7==6|pid7==7


svyset [pweight=weight]


// Demographics (Table S4)

svy: tab gender
svy: tab age4
svy: tab race
svy: tab educ4
svy: tab rep
svy: tab dem



//// AGREEMENT

// Coding Agreement


foreach var of varlist scholarships_per trump_congress_per cfpb_per   {
gen `var'_agree = `var'==2 if `var'!=.
}

foreach var of varlist fire_gays_per fire_trans_per daca_per abortion_per trump_state_per  electoralcollege_per contraceptives_per {
gen `var'_agree = `var'==1 if `var'!=.
}

// Full Sample (Table S5, column 6)

mat results = J(10,1,0)
local a =1

foreach var of varlist scholarships_per_agree - contraceptives_per_agree {
qui svy: mean `var'
mat results[`a',1] = e(b)
local ++a
}

matrix list results

// Republicans (Table S5, column 7)

mat results = J(10,1,0)
local a =1

foreach var of varlist scholarships_per_agree - contraceptives_per_agree {
qui svy: mean `var' if rep==1
mat results[`a',1] = e(b)
local ++a
}

matrix list results

// Democrats  (Table S5, column 8)

mat results = J(10,1,0)
local a =1

foreach var of varlist scholarships_per_agree - contraceptives_per_agree {
qui svy: mean `var' if dem==1
mat results[`a',1] = e(b)
local ++a
}

matrix list results


// Coding Accurate Prediction


foreach var of varlist scholarships_court trump_congress_court cfpb_court {
gen `var'_predict = `var'==2 if `var'!=.
}

foreach var of varlist fire_gays_court fire_trans_court daca_court abortion_court trump_state_court  electoralcollege_court contraceptives_court {
gen `var'_predict = `var'==1 if `var'!=.
}



// Full Sample  (Table S5, column 9)

mat results = J(10,1,0)
local a =1

foreach var of varlist scholarships_court_predict - contraceptives_court_predict {
qui svy: mean `var'
mat results[`a',1] = e(b)
local ++a
}

matrix list results

// Republicans  (Table S5, column 10)

mat results = J(10,1,0)
local a =1

foreach var of varlist scholarships_court_predict - contraceptives_court_predict {
qui svy: mean `var' if rep==1
mat results[`a',1] = e(b)
local ++a
}

matrix list results

// Democrats  (Table S5, column 11)

mat results = J(10,1,0)
local a =1

foreach var of varlist scholarships_court_predict - contraceptives_court_predict {
qui svy: mean `var' if dem==1
mat results[`a',1] = e(b)
local ++a
}

matrix list results



// Coding Liberal Position Taking 

foreach var of varlist trump_congress_per contraceptives_per {
gen `var'_lib = `var'==2 if `var'!=.
}

foreach var of varlist fire_gays_per fire_trans_per daca_per scholarships_per abortion_per trump_state_per cfpb_per electoralcollege_per   {
gen `var'_lib = `var'==1 if `var'!=.
}

egen percent_liberal = rowmean (trump_congress_per_lib contraceptives_per_lib fire_gays_per_lib fire_trans_per_lib daca_per_lib scholarships_per_lib abortion_per_lib trump_state_per_lib cfpb_per_lib electoralcollege_per_lib)

// Table S6 (column 2)

svy: mean percent_liberal
svy: mean percent_liberal if rep==1
svy: mean percent_liberal if dem==1

egen percent_agree = rowmean (scholarships_per_agree trump_congress_per_agree cfpb_per_agree fire_gays_per_agree fire_trans_per_agree daca_per_agree abortion_per_agree trump_state_per_agree electoralcollege_per_agree contraceptives_per_agree)

// Table S6 (column 4)

svy: mean percent_agree
svy: mean percent_agree if rep==1
svy: mean percent_agree if dem==1

egen percent_predict = rowmean (scholarships_court_predict trump_congress_court_predict cfpb_court_predict fire_gays_court_predict fire_trans_court_predict daca_court_predict abortion_court_predict trump_state_court_predict electoralcollege_court_predict contraceptives_court_predict)

// Table S6 (column 5)

svy: mean percent_predict
svy: mean percent_predict if rep==1
svy: mean percent_predict if dem==1

// Coding Personal Opinions Matching Court Predictions

foreach y in trump_congress contraceptives fire_gays fire_trans daca scholarships abortion trump_state cfpb electoralcollege {
gen `y'_match = .
recode `y'_match (.=1) if  (`y'_per == `y'_court)&`y'_per!=.&`y'_court!=. 
recode `y'_match (.=0) if  (`y'_per != `y'_court)&`y'_per!=.&`y'_court!=.
}

egen percent_match = rowmean (trump_congress_match contraceptives_match fire_gays_match fire_trans_match daca_match scholarships_match abortion_match trump_state_match cfpb_match electoralcollege_match)
	
// Table S6 (column 6)
	
svy: mean percent_match
svy: mean percent_match if rep==1
svy: mean percent_match if dem==1	









// 2010 data

insheet using "C:\Users\neilm\Dropbox\supremecourt\surveys-with-ideal\2010-SCOTUSpoll-withideal-and-perceptions_statafriendly.csv", clear

gen dem = pid7_recapture==1|pid7_recapture==2|pid7_recapture==3
gen rep = pid7_recapture==5|pid7_recapture==6|pid7_recapture==7


svyset [pweight=weight]


// Demographics (Table S4)

svy: tab gender

gen agecont = 2010-age
gen age4 = .
recode age4 (.=1) if agecont<30
recode age4 (.=2) if agecont>29&agecont<45
recode age4 (.=3) if agecont>44&agecont<65
recode age4 (.=4) if agecont>64
svy: tab age4
svy: tab race
svy: tab educ
svy: tab rep
svy: tab dem

//// AGREEMENT

// Coding Agreement


foreach var of varlist guncontrol_per affaction_per raceschools_per guantamo_per {
gen `var'_agree = `var'==2 if `var'!=.
}

foreach var of varlist citizensunited_per sexoffenders_per religoussymbols_per voterid_per cappunish_per pbabortion_per    {
gen `var'_agree = `var'==1 if `var'!=.
}

// Full Sample (Table S5, column 6)

mat results = J(10,1,0)
local a =1

foreach var of varlist guncontrol_per_agree- pbabortion_per_agree {
qui svy: mean `var'
mat results[`a',1] = e(b)
local ++a
}

matrix list results

// Republicans  (Table S5, column 7)

mat results = J(10,1,0)
local a =1

foreach var of varlist guncontrol_per_agree- pbabortion_per_agree {
qui svy: mean `var' if rep==1
mat results[`a',1] = e(b)
local ++a
}

matrix list results

// Democrats (Table S5, column 8)

mat results = J(10,1,0)
local a =1

foreach var of varlist guncontrol_per_agree- pbabortion_per_agree {
qui svy: mean `var' if dem==1
mat results[`a',1] = e(b)
local ++a
}

matrix list results




// Coding Accurate Prediction


foreach var of varlist guncontrol_court affaction_court raceschools_court guantamo_court {
gen `var'_predict = `var'==2 if `var'!=.
}

foreach var of varlist citizensunited_court sexoffenders_court religoussymbols_court voterid_court cappunish_court pbabortion_court {
gen `var'_predict = `var'==1 if `var'!=.
}



// Full Sample (Table S5, column 9)

mat results = J(10,1,0)
local a =1

foreach var of varlist guncontrol_court_predict - pbabortion_court_predict  {
qui svy: mean `var'
mat results[`a',1] = e(b)
local ++a
}

matrix list results

// Republicans (Table S5, column 10)

mat results = J(10,1,0)
local a =1

foreach var of varlist guncontrol_court_predict - pbabortion_court_predict {
qui svy: mean `var' if rep==1
mat results[`a',1] = e(b)
local ++a
}

matrix list results

// Democrats (Table S5, column 11)

mat results = J(10,1,0)
local a =1

foreach var of varlist guncontrol_court_predict - pbabortion_court_predict {
qui svy: mean `var' if dem==1
mat results[`a',1] = e(b)
local ++a
}

matrix list results



// Coding Liberal Position Taking 

foreach var of varlist citizensunited_per sexoffenders_per religoussymbols_per voterid_per cappunish_per pbabortion_per guantamo_per  {
gen `var'_lib = `var'==2 if `var'!=.
}

foreach var of varlist guncontrol_per  affaction_per raceschools_per  {
gen `var'_lib = `var'==1 if `var'!=.
}

egen percent_liberal = rowmean (citizensunited_per_lib sexoffenders_per_lib religoussymbols_per_lib voterid_per_lib cappunish_per_lib pbabortion_per_lib guantamo_per_lib guncontrol_per_lib affaction_per_lib raceschools_per_lib)

// Table S6 (column 2)

svy: mean percent_liberal
svy: mean percent_liberal if rep==1
svy: mean percent_liberal if dem==1

egen percent_agree = rowmean (guncontrol_per_agree affaction_per_agree raceschools_per_agree guantamo_per_agree citizensunited_per_agree sexoffenders_per_agree religoussymbols_per_agree voterid_per_agree cappunish_per_agree pbabortion_per_agree)

// Table S6 (column 4)

svy: mean percent_agree
svy: mean percent_agree if rep==1
svy: mean percent_agree if dem==1

egen percent_predict = rowmean (guncontrol_court_predict affaction_court_predict raceschools_court_predict guantamo_court_predict citizensunited_court_predict sexoffenders_court_predict religoussymbols_court_predict voterid_court_predict cappunish_court_predict pbabortion_court_predict)

// Table S6 (column 5)

svy: mean percent_predict
svy: mean percent_predict if rep==1
svy: mean percent_predict if dem==1

// Coding Personal Opinions Matching Court Predictions

foreach y in citizensunited sexoffenders religoussymbols voterid cappunish pbabortion guantamo guncontrol affaction raceschools  {
gen `y'_match = .
recode `y'_match (.=1) if  (`y'_per == `y'_court)&`y'_per!=.&`y'_court!=. 
recode `y'_match (.=0) if  (`y'_per != `y'_court)&`y'_per!=.&`y'_court!=.
}

egen percent_match = rowmean (citizensunited_match sexoffenders_match religoussymbols_match voterid_match cappunish_match pbabortion_match guantamo_match guncontrol_match affaction_match raceschools_match)

// Table S6 (column 6)
	
svy: mean percent_match
svy: mean percent_match if rep==1
svy: mean percent_match if dem==1	






