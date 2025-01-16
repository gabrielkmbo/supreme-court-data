///////////////////////////////////
// Code to do benchmarking of response order effects against PID
// author: neil malhotra
// date created: 7/24/23
// date updated: 12/23/23
///////////////////////////////////


// 2020 data

use responseorder_2020.dta, clear

gen respid = _n

gen dem = pid7==1|pid7==2|pid7==3
gen rep = pid7==5|pid7==6|pid7==7


// Coding Liberal Position Taking 

foreach var of varlist trump_congress_per contraceptives_per aca_per {
gen `var'_lib = `var'==2 if `var'!=.
}

foreach var of varlist fire_gays_per fire_trans_per daca_per scholarships_per abortion_per trump_state_per cfpb_per electoralcollege_per  handguns_per {
gen `var'_lib = `var'==1 if `var'!=.
}


rename fire_gays_per_lib case1 
rename fire_trans_per_lib case2 
rename  daca_per_lib case3
rename handguns_per_lib case4
rename  scholarships_per_lib case5
rename  abortion_per_lib case6
rename  trump_congress_per_lib case7
rename  trump_state_per_lib case8
rename  cfpb_per_lib case9
rename  electoralcollege_per_lib case10
rename  contraceptives_per_lib case11
rename  aca_per_lib case12

gen forma = rand_ab-1

reshape long case, i(respid) j(cid)

gen wave = 2

keep respid cid weight age4 dem rep pid7 gender race educ most_recent_correct justice_term_correct gop_appt_correct justice_selection_correct current_chief_correct last_say_correct total_correct wave forma case


save responseorder_2020merge_benchmarking.dta, replace



// 2021 data

use responseorder_2021.dta, clear

gen respid = _n + 2000

gen dem = pid7==1|pid7==2|pid7==3
gen rep = pid7==5|pid7==6|pid7==7


// Coding Liberal Position Taking 

foreach var of varlist donors_per covidchurch_per agencies_per warrants_per ncaa_per acatax_per acasev_per {
gen `var'_lib = `var'==2 if `var'!=.
}

foreach var of varlist gayadoption_per azprovballot_per azcollectballot_per schoolspeech_per juvcrime_per databases_per  unions_per  {
gen `var'_lib = `var'==1 if `var'!=.
}

rename gayadoption_per_lib case13
rename acatax_per_lib case14
rename  acasev_per_lib case15
rename  azprovballot_per_lib case16
rename  azcollectballot_per_lib case17
rename  donors_per_lib case18
rename  schoolspeech_per_lib case19
rename  juvcrime_per_lib case20
rename  databases_per_lib case21
rename  ncaa_per_lib case22
rename  covidchurch_per_lib case23
rename  unions_per_lib case24
rename  agencies_per_lib case25
rename  warrants_per_lib case26

gen forma = rand_ab-1

reshape long case, i(respid) j(cid)

gen wave = 3

keep respid cid weight age4 dem rep pid7 gender race educ most_recent_correct justice_term_correct gop_appt_correct justice_selection_correct current_chief_correct last_say_correct total_correct wave forma case

save responseorder_2021merge_benchmarking.dta, replace



// 2022 data

use responseorder_2022.dta, clear

gen respid = _n + 4158

gen dem = pid7==1|pid7==2|pid7==3
gen rep = pid7==5|pid7==6|pid7==7



// Coding Liberal Position Taking 

foreach var of varlist guncontrol_per terrorism_per freespeech_per clergy_per  flag_per smallbizvax_per healthcarevax_per execpriv_per   {
gen `var'_lib = `var'==2 if `var'!=.
}

foreach var of varlist abortion_per  schoolchoice_per  epa_per schoolprayer_per  immigration_per  nativeamer_per  {
gen `var'_lib = `var'==1 if `var'!=.
}


rename abortion_per_lib case27
rename guncontrol_per_lib case28
rename schoolchoice_per_lib case29
rename terrorism_per_lib case30
rename freespeech_per_lib case31
rename clergy_per_lib case32
rename flag_per_lib case33
rename smallbizvax_per_lib case34
rename healthcarevax_per_lib case35
rename epa_per_lib case36
rename execpriv_per_lib case37
rename schoolprayer_per_lib case38
rename immigration_per_lib case39
rename nativeamer_per_lib case40

gen forma = rand_ab-1

reshape long case, i(respid) j(cid)

gen wave = 4

keep respid cid weight age4 dem rep pid7 gender race educ most_recent_correct justice_term_correct gop_appt_correct justice_selection_correct current_chief_correct last_say_correct total_correct wave forma case

save responseorder_2022merge_benchmarking.dta, replace



// stacking data

use responseorder_2020merge_benchmarking.dta, clear


append using responseorder_2021merge_benchmarking.dta

append using responseorder_2022merge_benchmarking.dta

save responseorder_fullmerge_benchmarking.dta, replace

gen pid7b = pid7
recode pid7b (8=4)
gen pid7b2 = (pid7b-1)/6


reg case pid7b2 i.wave [pweight=weight], cluster(respid)

/// This regression estimates the 36.2% benchmark effect of moving across the party ID scale on voting for the conservative side of the Supreme Court opinions.
