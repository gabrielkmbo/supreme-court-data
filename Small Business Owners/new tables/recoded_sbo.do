clear all
set type double
set varabbrev on, perm

*** change path if need to re-run ***
global dropbox "/Users/overlordspensieve/Dropbox/Entrepreneur_Conservatism"

global folder "$dropbox/_0_analysis"
global in "$folder/in"
global out "$folder/out"
global proc "$folder/proc"

global graph "$out/graph"
global table "$out/table"
global temp "`c(tmpdir)'"

********
u "/Users/gabrielbo/Dropbox/src 2024/Small Business Owners/new tables/survey_reg_base.dta", clear
drop if mi(small_biz)

g count = 1

g age =2023-birth_year2

g age_group = 1 if inrange(age, 18,34)
replace age_group = 2 if inrange(age, 35, 54)
replace age_group = 3 if age > 54
label define age_labels 1 "18 to 34" 2 "35 to 54" 3 "55 and above" 
label values age_group age_labels

g race_cat = 1 if race2_1 == 1
replace race_cat = 2 if race2_2 == 1
replace race_cat = 3 if mi(race_cat) & !mi(race2_1)
label define race_labels 1 "White" 2 "Black" 3 "Other" 
label values race_cat race_labels

statastates, name(state_of_residence)
drop if _merge == 2 //DC
drop _merge 

ren state_abbrev borrowerstate
g region= "Midwest" if inlist(borrowerstate, "IA", "IL","IN","KS","MI","MN","MO")
replace region = "Midwest" if inlist(borrowerstate,"ND","NE","OH","SD","WI")
replace region ="Northeast" if inlist(borrowerstate, "CT","MA","ME","NH","NY","RI","VT", "NJ", "PA")
replace region="South" if inlist(borrowerstate, "AL","AR","DC","DE","FL","GA","KY", "OK")
replace region="South" if inlist(borrowerstate,"LA","MD","NC","SC","TX","VA","WV", "MS", "TN")
replace region="West" if inlist(borrowerstate, "AK","AZ","CO","HI","ID","NM","NV")
replace region="West" if inlist(borrowerstate,"OR","UT","WA","WY", "CA", "MT")
replace region ="Territories" if inlist(borrowerstate,"AS","GU","MP","PR","VI")

encode region, g(region_)
drop region

*** party ***
replace pid = (pid-1)/5

replace liberal_or = (liberal_or-1)/6

g trump = biden_or == 2 if !mi(biden_or)
replace biden_or = 4 if biden_or == 2
replace biden_or = 2 if biden_or == 3
replace biden_or = 3 if biden_or == 4
replace biden_or = (biden_or-1)/2

*** scale logic: 0 = pro regulation 1= anti regulation; 0 = less tax burden, 1 = lots of burden ***
foreach v of varlist dis_agree_regulate_1 dis_agree_regulate_2 small_b_regulate regulations_work regulations_life gov_spending* universal_income irs_funding raise_taxes{
	replace `v' = (`v'-1)/4
}

replace unions_private = unions_private-1

replace income_tax_return = income_tax_return -1

** CHECK: how to classify filing type? more costly, or more effort?  For now i'm doing 0 = file by myself, 1 = CPA
replace filing_type = 2 if filing_type == 3
replace filing_type = 3 if filing_type == 4
replace filing_type = (filing_type-1)/2

foreach v of varlist attention_to_taxes tax_stress audited_worry fire_employees{
	replace `v' = 1- (`v'-1)/4
}

g pay_tax = 1 if pay_or_refund == 2 & refund_feeling == 1 //got refund + feel happy
replace pay_tax = 2 if pay_or_refund == 2 & refund_feeling == 2
replace pay_tax = 3 if pay_or_refund == 3 
replace pay_tax = 4 if pay_or_refund == 1
replace pay_tax = (pay_tax-1)/3


*** index ***
egen regulation_exp = rowmean(regulations_work regulations_life)
egen regulation_sub = rowmean(dis_agree_regulate_1 dis_agree_regulate_2 small_b_regulate fire_employees)
egen regulation = rowmean(dis_agree_regulate_1 dis_agree_regulate_2 small_b_regulate fire_employees unions_private regulations_work regulations_life unions_private)

egen tax_exp = rowmean(income_tax_return filing_type attention_to_taxes tax_stress audited_worry pay_tax)
egen tax_sub = rowmean(gov_spending* universal_income irs_funding raise_taxes)
egen tax = rowmean(income_tax_return filing_type attention_to_taxes tax_stress audited_worry pay_tax gov_spending* universal_income irs_funding raise_taxes)


********
foreach v of varlist gay_marriage work_ethic_1_3 individuality_2{
	replace `v' = (`v'-1)/4
}

foreach v of varlist death_penalty work_ethic_1_1 work_ethic_1_2 individuality_1{
	replace `v' = 1- (`v'-1)/4
}

*** socially conservative = 1 ***
replace gun_rights = 2-gun_rights
replace trans_rights = 2-trans_rights
replace abortion = 1-(abortion-1)/3

egen social = rowmean(gay_marriage death_penalty gun_rights trans_rights abortion)

*** risk-seeking = 1 ***
replace slider_risk = slider_risk/10
replace others_risk = (others_risk-1)/9
egen risk = rowmean(*_risk*)

*** high work ethics = 1 ***
egen workethic = rowmean(work_ethic_*)

*** individualistic = 1 ***
egen individual = rowmean(individuality_*)

*** controls ***
* egen state = group(state_of_residence)

replace weight = 1 if sample == "prolific"

foreach v of varlist region race_cat /*state*/ hispanic_latino gender2 total_income education_level2{
	assert `v' != 0
	replace `v' = 0 if mi(`v')
}
sa "$temp/clean", replace

*****************************************************
*** table 1: PID & Vote choice, split by SBO employer vs non-employer ***
g single = JobsReported == 1
g employer = JobsReported > 1
g employee = employment_status2 == 1 | 2
g nonlaborer = employment_status1 == 2
replace nonlaborer = 0 if small_biz == 1
g gigworker = employment_status2 == 4


g single_SBO = single*small_biz
g employer_SBO = employer*small_biz

label var single_SBO "Non-Employer SBO"
label var employer_SBO "Employer SBO"
label var employee "Non-SBO Employee"
label var nonlaborer "Not In Labor Force Non-SBO"
label var gigworker "Gig Workers Non-SBO"

label var regulation "Regulation Index"
label var tax "Taxation Index"
label var social "Social Attitude"
label var risk "Risk Taking"
label var individual "Individualism"
label var workethic "Protestant Work Ethic"
label var regulation "Regulation"
sa "$proc/survey_reg_base.dta", replace

* Employee used as baseline
eststo A: reg pid employer_SBO single_SBO nonlaborer gigworker [pweight = weight]

eststo B: reghdfe pid employer_SBO single_SBO nonlaborer gigworker [pweight = weight], absorb(i.age_group i.race_cat i.hispanic_latino i.gender2 i.total_income i.education_level2 i.region) 
 estadd local control = "X"
 
eststo C: reg biden_or employer_SBO single_SBO nonlaborer gigworker [pweight = weight]

eststo D: reghdfe biden_or employer_SBO single_SBO nonlaborer gigworker [pweight = weight], absorb(i.age_group i.race_cat i.hispanic_latino i.gender2 i.total_income i.education_level2 i.region) 
 estadd local control = "X"
 
**** table 4 ****
eststo A: reg pid regulation employer_SBO single_SBO nonlaborer gigworker [pweight = weight]

eststo B: reghdfe pid regulation employer_SBO single_SBO nonlaborer gigworker [pweight = weight], absorb(i.age_group i.race_cat i.hispanic_latino i.gender2 i.total_income i.education_level2 i.region) 
 estadd local control = "X"
 
eststo C: reg biden_or regulation employer_SBO single_SBO nonlaborer gigworker [pweight = weight]

eststo D: reghdfe biden_or regulation employer_SBO single_SBO nonlaborer gigworker [pweight = weight], absorb(i.age_group i.race_cat i.hispanic_latino i.gender2 i.total_income i.education_level2 i.region) 
 estadd local control = "X"

******* 

eststo clear

eststo A: reg pid single_SBO employer_SBO [pweight = weight]

eststo B: reghdfe pid single_SBO employer_SBO [pweight = weight], absorb(i.age_group i.race_cat i.hispanic_latino i.gender2 i.total_income i.education_level2 i.region) 
 estadd local control = "X"
 
eststo C: reg biden_or single_SBO employer_SBO [pweight = weight]

eststo D: reghdfe biden_or single_SBO employer_SBO [pweight = weight], absorb(i.age_group i.race_cat i.hispanic_latino i.gender2 i.total_income i.education_level2 i.region) 
 estadd local control = "X"
 
esttab A B C D using "/Users/gabrielbo/Dropbox/src 2024/Small Business Owners/new tables/new_table4.tex", replace ///
		cells(b(fmt(%-10.3fc) star) se(par fmt(%-10.3fc))) ///
		stats(control N r2, fmt( 0 0 2)	///
		labels("Controls" "Observations" "R-squared"))	///
		mgroups("PID (6-point)" "Trump or Biden (3-point)",	///		
		pattern(1 0 1 0 )		///		
		prefix(\multicolumn{@span}{c}{) suffix(}) span	) ///
		collabels(none) mlabels(none) label 
 
**********
*** table 2: take over or not, current or former ***
g start = takeover == 1
g tookover = takeover == 2

eststo clear
eststo A: reg pid start tookover gigworker nonlaborer [pweight = weight]

eststo B: reghdfe pid start tookover gigworker nonlaborer [pweight = weight], absorb(i.age_group i.race_cat i.hispanic_latino i.gender2 i.total_income i.education_level2 i.region) 
 estadd local control = "X"
 
eststo C: reg biden_or start tookover gigworker nonlaborer [pweight = weight]

eststo D: reghdfe biden_or start tookover gigworker nonlaborer [pweight = weight], absorb(i.age_group i.race_cat i.hispanic_latino i.gender2 i.total_income i.education_level2 i.region) 
 estadd local control = "X"
 
*** ever vs current ***
replace smallbiz_ever = 0 if mi(smallbiz_ever) & small_biz == 1

g current = smallbiz_ever == 0
g previous = smallbiz_ever == 1

eststo a: reg pid current previous gigworker nonlaborer [pweight = weight]

eststo b: reghdfe pid current previous gigworker nonlaborer [pweight = weight], absorb(i.age_group i.race_cat i.hispanic_latino i.gender2 i.total_income i.education_level2 i.region) 
 estadd local control = "X"
 
eststo c: reg biden_or current previous gigworker nonlaborer [pweight = weight]

eststo d: reghdfe biden_or current previous gigworker nonlaborer [pweight = weight], absorb(i.age_group i.race_cat i.hispanic_latino i.gender2 i.total_income i.education_level2 i.region) 
 estadd local control = "X"

label var start "Started Business"
label var tookover "Took Over Business"
label var previous "Former SBO"
label var current "Current SBO"

esttab A B a b C D c d using "/Users/gabrielbo/Dropbox/src 2024/Small Business Owners/new tables/new_table2.tex", replace ///
		cells(b(fmt(%-10.3fc) star) se(par fmt(%-10.3fc))) ///
		stats(control N r2, fmt( 0 0 2)	///
		labels("Controls" "Observations" "R-squared"))	///
		mgroups("PID (6-point)" "Trump or Biden (3-point)",	///		
		pattern(1 0 0 0 1 0 0 0)		///		
		prefix(\multicolumn{@span}{c}{) suffix(}) span	) ///
		collabels(none) mlabels(none) label 
 
*********
foreach v of varlist single_SBO employer_SBO{
	g start_`v' = start*`v'
	g tookover_`v' = tookover*`v'
	g current_`v' = current*`v'
	g previous_`v' = previous*`v'
}

eststo clear
eststo A: reg pid start_single_SBO tookover_single_SBO start_employer_SBO tookover_employer_SBO nonlaborer gigworker [pweight = weight]

eststo B: reghdfe pid start_single_SBO tookover_single_SBO start_employer_SBO tookover_employer_SBO nonlaborer gigworker [pweight = weight], absorb(i.age_group i.race_cat i.hispanic_latino i.gender2 i.total_income i.education_level2 i.region) 
 estadd local control = "X"
 
eststo C: reg biden_or start_single_SBO tookover_single_SBO start_employer_SBO tookover_employer_SBO nonlaborer gigworker [pweight = weight]

eststo D: reghdfe biden_or start_single_SBO tookover_single_SBO start_employer_SBO tookover_employer_SBO nonlaborer gigworker [pweight = weight], absorb(i.age_group i.race_cat i.hispanic_latino i.gender2 i.total_income i.education_level2 i.region) 
 estadd local control = "X"

***********
eststo a: reg pid current_single_SBO previous_single_SBO current_employer_SBO previous_employer_SBO nonlaborer gigworker [pweight = weight]

eststo b: reghdfe pid current_single_SBO previous_single_SBO current_employer_SBO previous_employer_SBO nonlaborer gigworker [pweight = weight], absorb(i.age_group i.race_cat i.hispanic_latino i.gender2 i.total_income i.education_level2 i.region) 
 estadd local control = "X"
 
eststo c: reg biden_or current_single_SBO previous_single_SBO current_employer_SBO previous_employer_SBO nonlaborer gigworker [pweight = weight]

eststo d: reghdfe biden_or current_single_SBO previous_single_SBO current_employer_SBO previous_employer_SBO nonlaborer gigworker [pweight = weight], absorb(i.age_group i.race_cat i.hispanic_latino i.gender2 i.total_income i.education_level2 i.region) 
 estadd local control = "X"

label var start_employer_SBO "Started X Employer"
label var tookover_employer_SBO "Tookover X Employer"
label var start_single_SBO "Started X Non-Employer"
label var tookover_single_SBO "Tookover X Non-Employer"

label var current_employer_SBO "Current X Employer"
label var previous_employer_SBO "Former X Employer"
label var current_single_SBO "Current X Non-Employer"
label var previous_single_SBO "Former X Non-Employer"

esttab A B a b C D c d using "/Users/gabrielbo/Dropbox/src 2024/Small Business Owners/new tables/new_table3.tex", replace ///
		cells(b(fmt(%-10.3fc) star) se(par fmt(%-10.3fc))) ///
		stats(control N r2, fmt( 0 0 2)	///
		labels("Controls" "Observations" "R-squared"))	///
		mgroups("PID (6-point)" "Trump or Biden (3-point)",	///		
		pattern(1 0 0 0 1 0 0 0)		///		
		prefix(\multicolumn{@span}{c}{) suffix(}) span	) ///
		collabels(none) mlabels(none) label 
