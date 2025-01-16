******
** Code to Clean Raw Survey Data from 2010 survey wave
** Author: Neil Malhotra
** Last updated: July 2, 2021
******


use "C:\Users\neilm\Dropbox\supremecourt\survey data cleaning code\raw survey data\CCES10_SBB_OUTPUT.DTA", clear 
set more off


// Opinions on Cases and Prediction of Court Decisions


recode SBB300B (1=2) (2=1)
egen citizensunited_per = rowtotal (SBB300A SBB300B), missing
label define citizensunited_per 1 "Prohibiting corporations from contributing to political campaigns is a violation of the right to free speech" 2 "Prohibiting corporations from contributing to political campaigns is a legitimate restriction that promotes more democratic elections"
label values citizensunited_per citizensunited_per

recode SBB301B (1=2) (2=1)
egen citizensunited_court = rowtotal (SBB301A SBB301B), missing
label define citizensunited_court 1 "Prohibiting corporations from contributing to political campaigns is a violation of the right to free speech" 2 "Prohibiting corporations from contributing to political campaigns is a legitimate restriction that promotes more democratic elections"
label values citizensunited_court citizensunited_court

recode SBB302B (1=2) (2=1)
egen sexoffenders_per = rowtotal (SBB302A SBB302B), missing
label define sexoffenders_per 1 "The federal government should be able to involuntarily put sex offenders in mental institutions after their prison sentences have ended" 2 "The federal government must release sex offenders after their prison sentences have ended" 
label values sexoffenders_per sexoffenders_per

recode SBB303B (1=2) (2=1)
egen sexoffenders_court = rowtotal (SBB303A SBB303B), missing
label define sexoffenders_court 1 "The federal government should be able to involuntarily put sex offenders in mental institutions after their prison sentences have ended" 2 "The federal government must release sex offenders after their prison sentences have ended" 
label values sexoffenders_court sexoffenders_court

recode SBB304B (1=2) (2=1)
egen guncontrol_per = rowtotal (SBB304A SBB304B), missing
label define guncontrol_per 1 "state and local government should be able to ban the possession of handguns" 2 "the right of individual citizens to possess handguns is protected under the Second Amendment" 
label values guncontrol_per guncontrol_per

recode SBB305B (1=2) (2=1)
egen guncontrol_court = rowtotal (SBB305A SBB305B), missing
label define guncontrol_court 1 "state and local government should be able to ban the possession of handguns" 2 "the right of individual citizens to possess handguns is protected under the Second Amendment" 
label values guncontrol_court guncontrol_court

recode SBB306B (1=2) (2=1)
egen religoussymbols_per = rowtotal (SBB306A SBB306B), missing
label define religoussymbols_per 1 "religious symbols should be allowed to be placed on public land" 2 "placing religious symbols on public land violates the separation of church and state" 
label values religoussymbols_per religoussymbols_per

recode SBB307B (1=2) (2=1)
egen religoussymbols_court = rowtotal (SBB307A SBB307B), missing
label define religoussymbols_court 1 "religious symbols should be allowed to be placed on public land" 2 "placing religious symbols on public land violates the separation of church and state" 
label values religoussymbols_court religoussymbols_court

recode SBB308B (1=2) (2=1)
egen affaction_per = rowtotal (SBB308A SBB308B), missing
label define affaction_per 1 "“the city should be allowed to deny the promotion of the white firefighters" 2 "the city must abide by the results of the test and promote the white firefighters" 
label values affaction_per affaction_per

recode SBB309B (1=2) (2=1)
egen affaction_court = rowtotal (SBB309A SBB309B), missing
label define affaction_court 1 "the city should be allowed to deny the promotion of the white firefighters" 2 "the city must abide by the results of the test and promote the white firefighters" 
label values affaction_court affaction_court

recode SBB310B (1=2) (2=1)
egen voterid_per = rowtotal (SBB310A SBB310B), missing
label define voterid_per 1 "states can require voters to show photo identification" 2 "requiring voters to show photo identification violates voting rights" 
label values voterid_per voterid_per

recode SBB311B (1=2) (2=1)
egen voterid_court = rowtotal (SBB311A SBB311B), missing
label define voterid_court 1 "states can require voters to show photo identification" 2 "requiring voters to show photo identification violates voting rights" 
label values voterid_court voterid_court

recode SBB312B (1=2) (2=1)
egen cappunish_per = rowtotal (SBB312A SBB312B), missing
label define cappunish_per 1 "lethal injection should be allowed" 2 "lethal injection is cruel and unusual punishment" 
label values cappunish_per cappunish_per

recode SBB313B (1=2) (2=1)
egen cappunish_court = rowtotal (SBB313A SBB313B), missing
label define cappunish_court 1 "lethal injection should be allowed" 2 "lethal injection is cruel and unusual punishment" 
label values cappunish_court cappunish_court

recode SBB314B (1=2) (2=1)
egen raceschools_per = rowtotal (SBB314A SBB314B), missing
label define raceschools_per 1 "school districts should be allowed to use race to promote diversity" 2 "race should not be used to assign students to school" 
label values raceschools_per raceschools_per

recode SBB315B (1=2) (2=1)
egen raceschools_court = rowtotal (SBB315A SBB315B), missing
label define raceschools_court 1 "school districts should be allowed to use race to promote diversity" 2 "race should not be used to assign students to school" 
label values raceschools_court raceschools_court

recode SBB316B (1=2) (2=1)
egen pbabortion_per = rowtotal (SBB316A SBB316B), missing
label define pbabortion_per 1 "the federal government should be allowed to ban partial birth abortions" 2 "banning partial birth abortions violates women’s rights" 
label values pbabortion_per pbabortion_per

recode SBB317B (1=2) (2=1)
egen pbabortion_court = rowtotal (SBB317A SBB317B), missing
label define pbabortion_court 1 "the federal government should be allowed to ban partial birth abortions" 2 "banning partial birth abortions violates women’s rights" 
label values pbabortion_court pbabortion_court

recode SBB318B (1=2) (2=1)
egen guantanamo_per = rowtotal (SBB318A SBB318B), missing
label define guantanamo_per 1 "the federal government should be allowed to conduct military trials of suspected terrorists" 2 "suspected terrorists have the right to be tried in the American court system" 
label values guantanamo_per guantanamo_per

recode SBB319B (1=2) (2=1)
egen guantanamo_court = rowtotal (SBB319A SBB319B), missing
label define guantanamo_court 1 "the federal government should be allowed to conduct military trials of suspected terrorists" 2 "suspected terrorists have the right to be tried in the American court system" 
label values guantanamo_court guantanamo_court


// Self-Ideological Placement and Court-Ideological Placement

rename SBB320 ideology_court

rename CC334A ideology7_personal

rename V243 ideology5_personal

// Countermajoritarianism

rename SBB321 countermajoritarianism1

rename SBB323  countermajoritarianism2

// Overall Court Assessments

rename SBB322 trust

rename SBB324 approval

// Supreme Court Knowledge

rename SBB325 number_justices
gen number_justices_correct = number_justices==3

rename SBB326 justice_selection
gen justice_selection_correct = justice_selection==2

rename SBB327 current_chief
gen current_chief_correct = current_chief==3

egen total_correct = rowtotal (number_justices_correct justice_selection_correct current_chief_correct), missing

// YouGov Profile variables

rename V208 gender

rename V211 race

rename V212a pid3_profile

rename V212c pid3_branch_profile

rename V212d pid7_profile

rename V213 educ

rename V207 age

rename CC421a pid3_recapture
rename CC421_dem pid3_recapture_demstrength
rename CC421_rep pid3_recapture_repstrength
rename CC421b pid3_recapture_lean

gen pid7_recapture = .
recode pid7_recapture (.=1) if pid3_recapture_demstrength==1
recode pid7_recapture (.=2) if pid3_recapture_demstrength==2
recode pid7_recapture (.=3) if pid3_recapture_lean==1
recode pid7_recapture (.=5) if pid3_recapture_lean==2
recode pid7_recapture (.=6) if pid3_recapture_repstrength==2
recode pid7_recapture (.=7) if pid3_recapture_repstrength==1
recode pid7_recapture (.=4)

                                                                  

save "C:\Users\neilm\Dropbox\supremecourt\survey data cleaning code\cleaned survey data\supremecourtsurveydata2010_cleaned.dta", replace
