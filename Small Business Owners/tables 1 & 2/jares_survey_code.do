use "C:\Users\neilm\Dropbox\Entrepreneur_Conservatism\jares_survey\2024.08.10 Small Business Owner Survey (Valid Responses).dta" 

keep if pass_quality_checks==1

recode sbo_partisan_share_rep (.=0) if sbo_partisan_share_total==100&sbo_partisan_share_rep==.

sum sbo_partisan_share_dem sbo_partisan_share_rep sbo_partisan_share_other sbo_partisan_share_total if sbo_partisan_share_total==100

sum not_sbo_partisan_share_dem not_sbo_partisan_share_rep not_sbo_partisan_share_other not_sbo_partisan_share_total if not_sbo_partisan_share_total==100


recode sbo_ideo_share_mod (.=0) if sbo_ideo_share_total==100&sbo_ideo_share_mod==.

sum sbo_ideo_share_lib sbo_ideo_share_mod sbo_ideo_share_con sbo_ideo_share_total if sbo_ideo_share_total==100


recode not_sbo_ideo_share_lib (.=0) if not_sbo_ideo_share_total==100&not_sbo_ideo_share_lib==.
recode not_sbo_ideo_share_con (.=0) if not_sbo_ideo_share_total==100&not_sbo_ideo_share_con==.

sum not_sbo_ideo_share_lib not_sbo_ideo_share_mod not_sbo_ideo_share_con not_sbo_ideo_share_total if not_sbo_ideo_share_total==100

sum sbo_share_trump
sum not_sbo_share_trump

sum share_working_age_sbo share_working_age_manuf share_working_age_union share_working_age_unempl share_working_age_100K

sum religious_rep_bc_income religious_rep_bc_red_tape religious_rep_bc_social_con religious_rep_bc_older religious_rep_bc_harder_worker religious_rep_bc_take_risks religious_rep_bc_more_indep religious_rep_bc_more_white religious_rep_bc_suburbs religious_rep_no_explanation

sum sbo_rep_bc_income sbo_rep_bc_red_tape sbo_rep_bc_social_con sbo_rep_bc_older sbo_rep_bc_harder_worker sbo_rep_bc_take_risks sbo_rep_bc_more_indep sbo_rep_bc_more_white sbo_rep_bc_suburbs sbo_rep_no_explanation
