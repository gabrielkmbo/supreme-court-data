// Long form data obtained from 2x2 code
use "/Users/grantmoore/Dropbox/src 2024/supreme court response order/2x2 data/combined_2x2.dta"

* Set survey weights
svyset [pweight=weight]

* Initialize percentage_agreement variable with missing values
gen percentage_agreement = .
gen republican_agreement = .
gen democratic_agreement = .

* Exclude instances where per_response is blank
drop if missing(per_response)

* Calculate weighted percentage agreement for all respondents
gen agree = (per_response == court_rule)
bysort year case_q_order: egen weighted_agree_all = total(agree * weight)
bysort year case_q_order: egen total_weight_all = total(weight)
bysort year case_q_order: replace percentage_agreement = round((weighted_agree_all / total_weight_all) * 100, 0.1)

* Calculate weighted percentage agreement for Republicans (pid == 3)
gen agree_rep = (per_response == court_rule) if pid == 3
bysort year case_q_order: egen weighted_agree_rep = total(agree_rep * weight) if pid == 3
bysort year case_q_order: egen total_weight_rep = total(weight) if pid == 3
bysort year case_q_order: replace republican_agreement = round((weighted_agree_rep / total_weight_rep) * 100, 0.1) if pid == 3

* Calculate weighted percentage agreement for Democrats (pid == 1)
gen agree_dem = (per_response == court_rule) if pid == 1
bysort year case_q_order: egen weighted_agree_dem = total(agree_dem * weight) if pid == 1
bysort year case_q_order: egen total_weight_dem = total(weight) if pid == 1
bysort year case_q_order: replace democratic_agreement = round((weighted_agree_dem / total_weight_dem) * 100, 0.1) if pid == 1

* Cleanup intermediate variables
drop weighted_agree_all total_weight_all weighted_agree_dem total_weight_dem weighted_agree_rep total_weight_rep agree agree_dem agree_rep 

* Save the result to a new file
save "combined_2x2_with_agreements.dta", replace

* Calculate the weighted average of percentage_agreement for each year
bysort year: egen weighted_sum_all = total(percentage_agreement * weight)
bysort year: egen total_weight_all = total(weight)
gen avg_percentage_agreement = round((weighted_sum_all / total_weight_all), 0.1)

* Calculate the weighted average of democratic_agreement for each year
bysort year: egen weighted_sum_dem = total(democratic_agreement * weight)
bysort year: egen total_weight_dem = total(weight) if democratic_agreement != .
gen avg_democratic_agreement = round((weighted_sum_dem / total_weight_dem), 0.1)

* Calculate the weighted average of republican_agreement for each year
bysort year: egen weighted_sum_rep = total(republican_agreement * weight)
bysort year: egen total_weight_rep = total(weight) if republican_agreement != .
gen avg_republican_agreement = round((weighted_sum_rep / total_weight_rep), 0.1)

* Drop intermediate variables
drop weighted_sum_all total_weight_all weighted_sum_dem total_weight_dem weighted_sum_rep total_weight_rep

* Ensure each year has one observation
collapse (mean) avg_percentage_agreement avg_democratic_agreement avg_republican_agreement, by(year)

* Display the results
list year avg_percentage_agreement avg_democratic_agreement avg_republican_agreement

clear

use "combined_2x2_with_agreements.dta"
