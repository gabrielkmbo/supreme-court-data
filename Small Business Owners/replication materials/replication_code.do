// Import data
import excel "/Users/liamcuster/Dropbox/src 2024/small business owners survey/replication materials/final_job_info_codings.xlsx", sheet("Simplified") firstrow clear

// Preserve dataset to revert changes used in calculation
preserve

// Exclude entries not listing a political party
drop if missing(political_party)

// Create dummy variable for Republicans to be able to count all Republicans
gen is_republican = (political_party == "Republican" | independent_type == "Republican Party")

// Calculate counts for each category and for Republicans within each category
bysort category: gen category_count = _N
bysort category: egen republican_sum = total(is_republican)

// Keep only the first line of each category to act as a representative of each category
bysort category: keep if _n == 1

// Calculate percentage of Republican owners
gen republican_pct = (republican_sum / category_count) * 100

// Place each category into one of five groups based on % Republican
gen group = ""
replace group = "Very Democratic" if republican_pct <= 20
replace group = "Somewhat Democratic" if republican_pct > 20 & republican_pct <= 40
replace group = "Neutral" if republican_pct > 40 & republican_pct <= 60
replace group = "Somewhat Republican" if republican_pct > 60 & republican_pct <= 80
replace group = "Very Republican" if republican_pct > 80

// Format output as "category (republican/total)"
gen formatted_output = category + " (" + string(republican_sum) + "/" + string(category_count) + ")"

// Sort by group
sort group

// Exclude 'other'category and categories that are size of 1 from output
keep if category != "other"
keep if category_count > 1



***** File Print *****
// Close the file to be written if it is already open
capture file close myfile

// Open a text file to write the output
file open myfile using "output.txt", write replace

// Declare a local to keep track of the current group
local current_group ""

// Sort the dataset by group to ensure proper grouping
sort group

// Loop through the dataset
forvalues i = 1/`=_N' {
    // Get the current group and formatted_output
    local new_group = group[`i']
    local output = formatted_output[`i']
    
    // Check if the group has changed
    if "`new_group'" != "`current_group'" {
        // If this is not the first group, print a new line for separation
        if "`current_group'" != "" {
            file write myfile _newline
        }
        
        // Update the current group
        local current_group = "`new_group'"
        
        // Print the new group
        file write myfile "`current_group'"
        file write myfile _newline
    }
    
    // Print the formatted_output (category) with spacing
	file write myfile "    "
	file write myfile "`output'"
    file write myfile _newline

}

// Close the text file
file close myfile


// Restore dataset
restore
