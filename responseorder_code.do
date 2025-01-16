
// Set up 2010 wave for merging

use "C:\Users\neilm\Dropbox\supremecourt\responseorder\responseorder_2010.dta", clear

gen weight = V102

gen respid = _n

gen agecont = 2010-age
gen age4 = .
recode age4 (.=1) if agecont<30
recode age4 (.=2) if agecont>29&agecont<45
recode age4 (.=3) if agecont>44&agecont<65
recode age4 (.=4) if agecont>64

gen dem = pid7_recapture==1|pid7_recapture==2|pid7_recapture==3
gen rep = pid7_recapture==5|pid7_recapture==6|pid7_recapture==7

rename citizensunited_per case1
rename citizensunited_court case2
rename sexoffenders_per case3
rename sexoffenders_court case4 
rename guncontrol_per case5 
rename guncontrol_court case6
rename religoussymbols_per case7 
rename religoussymbols_court case8
rename affaction_per case9 
rename affaction_court case10
rename voterid_per case11
rename voterid_court case12
rename cappunish_per case13
rename cappunish_court case14
rename raceschools_per case15
rename raceschools_court case16
rename pbabortion_per case17
rename pbabortion_court case18
rename guantanamo_per case19
rename guantanamo_court case20

gen forma =  SBB300A!=.

reshape long case, i(respid) j(cid)

gen wave = 1
gen personal = cid==1|cid==3|cid==5|cid==7|cid==9|cid==11|cid==13|cid==15|cid==17|cid==19

keep respid cid weight age4 dem rep pid7_recapture gender race educ number_justices_correct justice_selection_correct current_chief_correct total_correct wave personal forma case

save "C:\Users\neilm\Dropbox\supremecourt\responseorder\responseorder_2010merge.dta", replace

// Set up 2020 wave for merging

use "/Users/gabrielbo/Downloads/summer 24 research/cleaned survey data/supremecourtsurveydata2020_cleaned.dta", clear

gen respid = _n + 1500

gen dem = pid7==1|pid7==2|pid7==3
gen rep = pid7==5|pid7==6|pid7==7

rename fire_gays_per case21 
rename fire_gays_court case22 
rename fire_trans_per case23 
rename fire_trans_court case24
rename  daca_per case25
rename  daca_court case26
rename handguns_per case27
rename  handguns_court case28
rename  scholarships_per case29
rename  scholarships_court case30
rename  abortion_per case31
rename  abortion_court case32
rename  trump_congress_per case33
rename  trump_congress_court case34
rename  trump_state_per case35
rename  trump_state_court case36
rename  cfpb_per case37
rename  cfpb_court case38
rename  electoralcollege_per case39
rename  electoralcollege_court case40
rename  contraceptives_per case41
rename  contraceptives_court case42
rename  aca_per case43
rename  aca_court case44

gen forma = rand_ab-1

reshape long case, i(respid) j(cid)

gen wave = 2
gen personal = cid==21|cid==23|cid==25|cid==27|cid==29|cid==31|cid==33|cid==35|cid==37|cid==39|cid==41|cid==43

keep respid cid weight age4 dem rep pid7 gender race educ most_recent_correct justice_term_correct gop_appt_correct justice_selection_correct current_chief_correct last_say_correct total_correct wave personal forma case

save "/Users/gabrielbo/Downloads/summer 24 research/cleaned survey data/supremecourtsurveydata2020_merged.dta", replace

// Set up 2021 wave for merging

use "/Users/gabrielbo/Downloads/summer 24 research/cleaned survey data/supremecourtsurveydata2021_cleaned.dta", clear

gen respid = _n + 3500

gen dem = pid7==1|pid7==2|pid7==3
gen rep = pid7==5|pid7==6|pid7==7


rename gayadoption_per case45
rename gayadoption_court case46 
rename acatax_per case47
rename  acatax_court case48
rename  acasev_per case49
rename  acasev_court case50
rename  azprovballot_per case51
rename  azprovballot_court case52
rename  azcollectballot_per case53
rename  azcollectballot_court case54
rename  donors_per case55 
rename donors_court case56
rename  schoolspeech_per case57
rename  schoolspeech_court case58
rename  juvcrime_per case59
rename  juvcrime_court case60
rename  databases_per case61
rename  databases_court case62
rename  ncaa_per case63
rename  ncaa_court case64
rename  covidchurch_per case65
rename  covidchurch_court case66
rename  unions_per case67
rename  unions_court case68
rename  agencies_per case69
rename  agencies_court case70
rename  warrants_per case71
rename  warrants_court case72

gen forma = rand_ab-1

reshape long case, i(respid) j(cid)

gen wave = 3
gen personal = cid==45|cid==47|cid==49|cid==51|cid==53|cid==55|cid==57|cid==59|cid==61|cid==63|cid==65|cid==67|cid==69|cid==71

keep respid cid weight age4 dem rep pid7 gender race educ most_recent_correct justice_term_correct gop_appt_correct justice_selection_correct current_chief_correct last_say_correct total_correct wave personal forma case

save "/Users/gabrielbo/Downloads/summer 24 research/cleaned survey data/supremecourtsurveydata2021_merged.dta", replace

// Set up 2022 wave for merging

use "/Users/gabrielbo/Downloads/summer 24 research/cleaned survey data/supremecourtsurveydata2022_cleaned.dta", clear

gen respid = _n + 5658

gen dem = pid7==1|pid7==2|pid7==3
gen rep = pid7==5|pid7==6|pid7==7

rename abortion_per case73 
rename abortion_court case74 
rename roe_per case75
rename roe_court case76
rename guncontrol_per case77
rename guncontrol_court case78
rename schoolchoice_per case79
rename schoolchoice_court case80
rename terrorism_per case81
rename terrorism_court case82
rename freespeech_per case83
rename freespeech_court case84
rename clergy_per case85
rename clergy_court case86
rename flag_per case87
rename flag_court case88
rename smallbizvax_per case89
rename smallbizvax_court case90
rename healthcarevax_per case91
rename healthcarevax_court case92
rename epa_per case93
rename epa_court case94
rename execpriv_per case95
rename execpriv_court case96
rename schoolprayer_per case97
rename schoolprayer_court case98
rename immigration_per case99
rename immigration_court case100
rename nativeamer_per case101
rename nativeamer_court case102

gen forma = rand_ab-1

reshape long case, i(respid) j(cid)

gen wave = 4
gen personal = cid==73|cid==75|cid==77|cid==79|cid==81|cid==83|cid==85|cid==87|cid==89|cid==91|cid==93|cid==95|cid==97|cid==99|cid==101

keep respid cid weight age4 dem rep pid7 gender race educ most_recent_correct justice_term_correct gop_appt_correct justice_selection_correct current_chief_correct last_say_correct total_correct wave personal forma case

save "/Users/gabrielbo/Downloads/summer 24 research/cleaned survey data/supremecourtsurveydata2022_merged.dta", replace


// 2023

use "/Users/gabrielbo/Downloads/summer 24 research/cleaned survey data/supremecourtsurveydata2023_cleaned.dta", clear

gen respid = _n

gen dem = pid7==1|pid7==2|pid7==3
gen rep = pid7==5|pid7==6|pid7==7

rename affactionprivate_per case103 
rename affactionprivate_court case104 
rename affactionpublic_per case105
rename affactionpublic_court case106
rename fedelections_per case107
rename fedelections_court case108
rename gaydiscrim_per case109
rename gaydiscrim_court case110
rename gerrymandering_per case111
rename gerrymandering_court case112
rename cleanwater_per case113
rename cleanwater_court case114
rename commerce_per case115
rename commerce_court case116
rename copyright_per case117
rename copyright_court case118
rename algorithm_per case119
rename algorithm_court case120
rename socialmedia_per case121
rename socialmedia_court case122
rename studentloans_per case123
rename studentloans_court case124
rename unions_per case125
rename unions_court case126
rename native_per case127
rename native_court case128
rename religion_per case129
rename religion_court case130
rename contraception_per case131
rename contraception_court case132
rename sodomy_per case133
rename sodomy_court case134
rename gaymarriage_per case135
rename gaymarriage_court case136
rename interracial_per case137
rename interracial_court case138

gen forma = rand_ab-1

reshape long case, i(respid) j(cid)

gen wave = 5
gen personal = cid==103|cid==105|cid==107|cid==109|cid==111|cid==113|cid==115|cid==117|cid==119|cid==121|cid==123|cid==125|cid==127|cid==129|cid==131|cid==133|cid==135|cid==137

keep respid cid weight age4 dem rep pid7 gender race educ most_recent_correct justice_term_correct gop_appt_correct justice_selection_correct current_chief_correct last_say_correct total_correct wave personal forma case

save "/Users/gabrielbo/Downloads/summer 24 research/cleaned survey data/supremecourtsurveydata2023_merged.dta", replace

// 2024
use "/Users/gabrielbo/Downloads/summer 24 research/cleaned survey data/supremecourtsurveydata2024_cleaned.dta", clear

gen respid = _n + 9820

gen dem = pid7==1|pid7==2|pid7==3
gen rep = pid7==5|pid7==6|pid7==7


rename redistricting_per case139
rename redistricting_court case140
rename cfpb_per case141
rename cfpb_court case142
rename abortion_per case143
rename abortion_court case144
rename opioids_per case145
rename opioids_court case146
rename blocking_per case147
rename blocking_court case148
rename chevron_per case149
rename chevron_court case150
rename abortionhosp_per case151
rename abortionhosp_court case152
rename socmedblock_per case153
rename socmedblock_court case154
rename nra_per case155
rename nra_court case156
rename statessocmed_per case157
rename statessocmed_court case158
rename admincourts_per case159
rename admincourts_court case160
rename trumpelig_per case161
rename trumpelig_court case162
rename trumpimmune_per case163
rename trumpimmune_court case164
rename gunrights_per case165
rename gunrights_court case166 
rename trademark_per case167
rename trademark_court case168
rename homeless_per case169
rename homeless_court case170
rename insurrection_per case171
rename insurrection_court case172

gen forma = rand_ab-1

reshape long case, i(respid) j(cid)

gen wave = 6
gen personal = cid==139|cid==141|cid==143|cid==145|cid==147|cid==149|cid==151|cid==153|cid==155|cid==157|cid==159|cid==161|cid==163|cid==165|cid==167|cid==169|cid==171

keep respid cid weight age4 dem rep pid7 gender race educ most_recent_correct justice_term_correct gop_appt_correct justice_selection_correct current_chief_correct last_say_correct total_correct wave personal forma case

save "/Users/gabrielbo/Downloads/summer 24 research/cleaned survey data/supremecourtsurveydata2024_merged.dta", replace


// stacking data

use "/Users/gabrielbo/Downloads/summer 24 research/cleaned survey data/supremecourtsurveydata2020_merged.dta", clear

append using "/Users/gabrielbo/Downloads/summer 24 research/cleaned survey data/supremecourtsurveydata2021_merged.dta"

append using "/Users/gabrielbo/Downloads/summer 24 research/cleaned survey data/supremecourtsurveydata2022_merged.dta"

append using "/Users/gabrielbo/Downloads/summer 24 research/cleaned survey data/supremecourtsurveydata2023_merged.dta"

append using "/Users/gabrielbo/Downloads/summer 24 research/cleaned survey data/supremecourtsurveydata2024_merged.dta"

save "/Users/gabrielbo/Downloads/summer 24 research/cleaned survey data/fullmerge.dta", replace

// Create Individual Case Response Order Effects

mat results = J(102,1,0)
local a =1

forvalues x = 1/102 {
qui: reg case forma if cid==`x'
mat results[`a',1] = _b[forma]
local ++a
}

matrix list results





// Case Meta Data

import delimited response_order_analysis_dataset.csv, clear

rename caseid cid

save casemetadata.dta, replace

use "/Users/gabrielbo/Downloads/summer 24 research/cleaned survey data/fullmerge.dta", replace

merge m:1 cid using casemetadata.dta


// Big Regression


gen knowledge = . 
replace knowledge = (total_correct/3) if wave==1
replace knowledge = (total_correct/6) if wave==2|wave==3|wave==4|wave==5|wave==6



reg case forma i.wave if personal==1&wave!=1, cluster(respid) robust


gen knowledge_forma = knowledge*forma

egen words = rowmean (wordsa wordsb)
egen fklevel = rowmean (fklevela fklevelb)


gen forma_words = forma*words
gen forma_fklevel = forma*fklevel
gen forma_nytfront = forma*nytfront
gen forma_nytmentions = forma*nytmentions

gen forma_godgaysguns = forma*godgaysguns

gen forma_cqkey = forma*cqkey

gen nytmentionscoarse =  nytmentions>=10
gen forma_nytmentionscoarse = forma*nytmentionscoarse

gen lognytmentions = log(nytmentions+1)
gen forma_lognytmentions = forma*lognytmentions

gen nytmentionslow = nytmentions<10 if nytmentions!=.
gen nytmentionsmed = nytmentions>9&nytmentions<100 if nytmentions!=.
gen nytmentionshigh = nytmentions>99 if nytmentions!=.

gen forma_nytmentionslow = nytmentionslow*forma
gen forma_nytmentionsmed = nytmentionsmed*forma
gen forma_nytmentionshigh = nytmentionshigh*forma



replace educ = (educ-1)/5
gen white = race==1
gen male = gender==1
gen age = (age4-1)/3

gen forma_educ = forma*educ
gen forma_white = forma*white
gen forma_male = forma*male
gen forma_age = forma*age



gen case2 = case-1

reg case2 forma knowledge knowledge_forma words forma_words fklevel forma_fklevel nytfront forma_nytfront nytmentions forma_nytmentions godgaysguns forma_godgaysguns i.wave if wave!=1, cluster(respid)
reg case2 forma knowledge knowledge_forma words forma_words fklevel forma_fklevel nytfront forma_nytfront nytmentions forma_nytmentions educ forma_educ white forma_white male forma_male age forma_age godgaysguns forma_godgaysguns i.wave if wave!=1, cluster(respid)


reg case2 forma knowledge knowledge_forma words forma_words fklevel forma_fklevel nytfront forma_nytfront nytmentions forma_nytmentions godgaysguns forma_godgaysguns i.wave if wave!=1&personal==1, cluster(respid)
reg case2 forma knowledge knowledge_forma words forma_words fklevel forma_fklevel nytfront forma_nytfront nytmentions forma_nytmentions educ forma_educ white forma_white male forma_male age forma_age godgaysguns forma_godgaysguns  i.wave if wave!=1&personal==1, cluster(respid)



reg case2 forma words forma_words fklevel forma_fklevel nytfront forma_nytfront nytmentions forma_nytmentions godgaysguns forma_godgaysguns i.wave if wave!=1, cluster(respid)
reg case2 forma words forma_words fklevel forma_fklevel nytfront forma_nytfront nytmentions forma_nytmentions godgaysguns forma_godgaysguns  i.wave if wave!=1&personal==1, cluster(respid)
reg case2 forma words forma_words fklevel forma_fklevel nytfront forma_nytfront nytmentions forma_nytmentions godgaysguns forma_godgaysguns  i.wave if wave!=1&personal==0, cluster(respid)


reg case2 forma knowledge knowledge_forma educ forma_educ white forma_white male forma_male age forma_age  i.wave if wave!=1, cluster(respid)
reg case2 forma knowledge knowledge_forma educ forma_educ white forma_white male forma_male age forma_age  i.wave if wave!=1&personal==1, cluster(respid)
reg case2 forma knowledge knowledge_forma educ forma_educ white forma_white male forma_male age forma_age i.wave if wave!=1&personal==0, cluster(respid)


reg case2 forma words forma_words fklevel forma_fklevel lognytmentions forma_lognytmentions godgaysguns forma_godgaysguns i.wave if wave!=1, cluster(respid)
reg case2 forma words forma_words fklevel forma_fklevel lognytmentions forma_lognytmentions godgaysguns forma_godgaysguns  i.wave if wave!=1&personal==1, cluster(respid)
reg case2 forma words forma_words fklevel forma_fklevel lognytmentions forma_lognytmentions godgaysguns forma_godgaysguns  i.wave if wave!=1&personal==0, cluster(respid)


reg case2 forma words forma_words fklevel forma_fklevel lognytmentions forma_lognytmentions godgaysguns forma_godgaysguns  i.wave, cluster(respid)
reg case2 forma words forma_words fklevel forma_fklevel lognytmentions forma_lognytmentions godgaysguns forma_godgaysguns   i.wave if personal==1, cluster(respid)
reg case2 forma words forma_words fklevel forma_fklevel lognytmentions forma_lognytmentions godgaysguns forma_godgaysguns   i.wave if personal==0, cluster(respid)

reg case2 forma words forma_words fklevel forma_fklevel nytmentionsmed forma_nytmentionsmed nytmentionshigh forma_nytmentionshigh godgaysguns forma_godgaysguns  i.wave, cluster(respid)
reg case2 forma words forma_words fklevel forma_fklevel nytmentionsmed forma_nytmentionsmed nytmentionshigh forma_nytmentionshigh godgaysguns forma_godgaysguns   i.wave if personal==1, cluster(respid)
reg case2 forma words forma_words fklevel forma_fklevel nytmentionsmed forma_nytmentionsmed nytmentionshigh forma_nytmentionshigh godgaysguns forma_godgaysguns   i.wave if personal==0, cluster(respid)

reg case2 forma words forma_words fklevel forma_fklevel nytmentionsmed forma_nytmentionsmed nytmentionshigh forma_nytmentionshigh   i.wave, cluster(respid)
reg case2 forma words forma_words fklevel forma_fklevel nytmentionsmed forma_nytmentionsmed nytmentionshigh forma_nytmentionshigh   i.wave if personal==1, cluster(respid)
reg case2 forma words forma_words fklevel forma_fklevel nytmentionsmed forma_nytmentionsmed nytmentionshigh forma_nytmentionshigh   i.wave if personal==0, cluster(respid)












reg case forma words forma_words fklevel forma_fklevel nytfront forma_nytfront nytmentions  i.wave if personal==1, cluster(respid)


reg case forma fklevel forma_fklevel i.wave if personal==1, cluster(respid)



