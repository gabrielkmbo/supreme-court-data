// Long form data obtained from 2x2 code
use "/Users/grantmoore/Dropbox/src 2024/supreme court response order/2x2 data/combined_2x2.dta"

* Set survey weights
svyset [pweight=weight]

* Initialize percentage_correct variable with missing values
gen percentage_correct = .
gen republican_correct = .
gen democratic_correct = .

* Exclude instances where court_response is blank
drop if missing(court_response)

* Calculate weighted percentage correct for all respondents
gen correct = (court_response == court_rule)
bysort year case_q_order: egen weighted_correct_all = total(correct * weight)
bysort year case_q_order: egen total_weight_all = total(weight)
bysort year case_q_order: replace percentage_correct = round((weighted_correct_all / total_weight_all) * 100, 0.1)

* Calculate weighted percentage correct for Republicans (pid == 3)
gen correct_rep = (court_response == court_rule) if pid == 3
bysort year case_q_order: egen weighted_correct_rep = total(correct_rep * weight) if pid == 3
bysort year case_q_order: egen total_weight_rep = total(weight) if pid == 3
bysort year case_q_order: replace republican_correct = round((weighted_correct_rep / total_weight_rep) * 100, 0.1) if pid == 3

* Calculate weighted percentage correct for Democrats (pid == 1)
gen correct_dem = (court_response == court_rule) if pid == 1
bysort year case_q_order: egen weighted_correct_dem = total(correct_dem * weight) if pid == 1
bysort year case_q_order: egen total_weight_dem = total(weight) if pid == 1
bysort year case_q_order: replace democratic_correct = round((weighted_correct_dem / total_weight_dem) * 100, 0.1) if pid == 1

* Cleanup intermediate variables
drop weighted_correct_all total_weight_all weighted_correct_dem total_weight_dem weighted_correct_rep total_weight_rep correct correct_dem correct_rep 

* Save the result to a new file
save "combined_2x2_with_correctness.dta", replace

* Calculate the weighted average of percentage_correct for each year
bysort year: egen weighted_sum_all = total(percentage_correct * weight)
bysort year: egen total_weight_all = total(weight)
gen avg_percentage_corrected = round((weighted_sum_all / total_weight_all), 0.1)

* Calculate the weighted average of democratic_correct for each year
bysort year: egen weighted_sum_dem = total(democratic_correct * weight)
bysort year: egen total_weight_dem = total(weight) if democratic_correct != .
gen avg_democratic_correct = round((weighted_sum_dem / total_weight_dem), 0.1)

* Calculate the weighted average of republican_correct for each year
bysort year: egen weighted_sum_rep = total(republican_correct * weight)
bysort year: egen total_weight_rep = total(weight) if republican_correct != .
gen avg_republican_correct = round((weighted_sum_rep / total_weight_rep), 0.1)

* Drop intermediate variables
drop weighted_sum_all total_weight_all weighted_sum_dem total_weight_dem weighted_sum_rep total_weight_rep

* Ensure each year has one observation
collapse (mean) avg_percentage_correct avg_democratic_correct avg_republican_correct, by(year)

* Display the results
list year avg_percentage_correct avg_democratic_correct avg_republican_correct

clear

use "combined_2x2_with_correctness.dta"
