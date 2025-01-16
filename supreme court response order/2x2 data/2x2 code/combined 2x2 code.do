use "/Users/grantmoore/Dropbox/src 2024/supreme court response order/2x2 data/reshaped_2020.dta", clear
append using "/Users/grantmoore/Dropbox/src 2024/supreme court response order/2x2 data/reshaped_2021.dta"
append using "/Users/grantmoore/Dropbox/src 2024/supreme court response order/2x2 data/reshaped_2022.dta"
append using "/Users/grantmoore/Dropbox/src 2024/supreme court response order/2x2 data/reshaped_2023.dta"
append using "/Users/grantmoore/Dropbox/src 2024/supreme court response order/2x2 data/reshaped_2024.dta"
tab per_ideo court_ideo, cell
save "/Users/grantmoore/Dropbox/src 2024/supreme court response order/2x2 data/combined_2x2.dta", replace
