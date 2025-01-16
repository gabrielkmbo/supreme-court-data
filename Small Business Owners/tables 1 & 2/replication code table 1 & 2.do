use "/Users/gabrielbo/Dropbox/src 2024/Small Business Owners/tables 1 & 2/2024.08.10 Small Business Owner Survey (Valid Responses).dta" 

keep if pass_quality_checks==1

recode sbo_partisan_share_rep (.=0) if sbo_partisan_share_total==100&sbo_partisan_share_rep==.

** TABLE 1 **
* Row 1-3, Column 1, SBO: Party Identification *
sum sbo_partisan_share_dem sbo_partisan_share_rep sbo_partisan_share_other sbo_partisan_share_total if sbo_partisan_share_total==100

* Row 1-3, Column 2, Non-SBO: Party Identification *
sum not_sbo_partisan_share_dem not_sbo_partisan_share_rep not_sbo_partisan_share_other not_sbo_partisan_share_total if not_sbo_partisan_share_total==100


* Filling in blank ideologies and setting to 0 *
recode sbo_ideo_share_mod (.=0) if sbo_ideo_share_total==100&sbo_ideo_share_mod==.

* Row 4-6, Column 1, SBO: Political Ideology *
sum sbo_ideo_share_lib sbo_ideo_share_mod sbo_ideo_share_con sbo_ideo_share_total if sbo_ideo_share_total==100

* Filling in blank ideologies and setting to 0 *
recode not_sbo_ideo_share_lib (.=0) if not_sbo_ideo_share_total==100&not_sbo_ideo_share_lib==.
recode not_sbo_ideo_share_con (.=0) if not_sbo_ideo_share_total==100&not_sbo_ideo_share_con==.


* Row 4-6, Column 2, Non-SBO: Political Ideology *
sum not_sbo_ideo_share_lib not_sbo_ideo_share_mod not_sbo_ideo_share_con not_sbo_ideo_share_total if not_sbo_ideo_share_total==100

* Row 7 & 8, Column 1, SBO: Presidential Vote <Subtract 100 to get row 8> *
sum sbo_share_trump
* Row 7 & 8, Column 2, Non-SBO: Presidential Vote <Subtract 100 to get row 8> *
sum not_sbo_share_trump


** TABLE 1 COLUMNS 3-6 **
** Create Republican and Democrat Leanings **
gen lean_republican = party_id_6pt > 0.5
gen lean_democrat = party_id_6pt < 0.5

* Row 1-3, Column 3, Republican SBO: Party Identification *
sum sbo_partisan_share_dem sbo_partisan_share_rep sbo_partisan_share_other sbo_partisan_share_total if sbo_partisan_share_total==100 & lean_republican==1

* Row 1-3, Column 4, Republican Non-SBO: Party Identification *
sum not_sbo_partisan_share_dem not_sbo_partisan_share_rep not_sbo_partisan_share_other not_sbo_partisan_share_total if not_sbo_partisan_share_total==100 & lean_republican==1

* Row 1-3, Column 5, SBO: Party Identification *
sum sbo_partisan_share_dem sbo_partisan_share_rep sbo_partisan_share_other sbo_partisan_share_total if sbo_partisan_share_total==100 & lean_democrat==1

* Row 1-3, Column 6, Non-SBO: Party Identification *
sum not_sbo_partisan_share_dem not_sbo_partisan_share_rep not_sbo_partisan_share_other not_sbo_partisan_share_total if not_sbo_partisan_share_total==100 & lean_democrat==1

* Row 4-6, Column 3, Republican SBO: Political Ideology *
sum sbo_ideo_share_lib sbo_ideo_share_mod sbo_ideo_share_con sbo_ideo_share_total if sbo_ideo_share_total==100 & lean_republican==1

* Row 4-6, Column 4, Republican Non-SBO: Political Ideology *
sum not_sbo_ideo_share_lib not_sbo_ideo_share_mod not_sbo_ideo_share_con not_sbo_ideo_share_total if not_sbo_ideo_share_total==100 & lean_republican==1

* Row 4-6, Column 5, Democrat SBO: Political Ideology *
sum sbo_ideo_share_lib sbo_ideo_share_mod sbo_ideo_share_con sbo_ideo_share_total if sbo_ideo_share_total==100 & lean_democrat==1

* Row 4-6, Column 6, Democrat Non-SBO: Political Ideology *
sum not_sbo_ideo_share_lib not_sbo_ideo_share_mod not_sbo_ideo_share_con not_sbo_ideo_share_total if not_sbo_ideo_share_total==100 & lean_democrat==1

* Row 7 & 8, Column 3, Republican SBO: Presidential Vote <Subtract 100 to get row 8> *
sum sbo_share_trump if lean_republican == 1

* Row 7 & 8, Column 4, Republican Non-SBO: Presidential Vote <Subtract 100 to get row 8> *
sum not_sbo_share_trump if lean_republican == 1

* Row 7 & 8, Column 5, Democrat SBO: Presidential Vote <Subtract 100 to get row 8> *
sum sbo_share_trump if lean_democrat == 1

* Row 7 & 8, Column 6, Democrat Non-SBO: Presidential Vote <Subtract 100 to get row 8> *
sum not_sbo_share_trump if lean_democrat == 1


** TABLE 2 **
* no need to run *
sum share_working_age_sbo share_working_age_manuf share_working_age_union share_working_age_unempl share_working_age_100K

* Religious People *
sum religious_rep_bc_income religious_rep_bc_red_tape religious_rep_bc_social_con religious_rep_bc_older religious_rep_bc_harder_worker religious_rep_bc_take_risks religious_rep_bc_more_indep religious_rep_bc_more_white religious_rep_bc_suburbs religious_rep_no_explanation

* SBOs *
sum sbo_rep_bc_income sbo_rep_bc_red_tape sbo_rep_bc_social_con sbo_rep_bc_older sbo_rep_bc_harder_worker sbo_rep_bc_take_risks sbo_rep_bc_more_indep sbo_rep_bc_more_white sbo_rep_bc_suburbs sbo_rep_no_explanation 

* Republican Religious People *
sum religious_rep_bc_income religious_rep_bc_red_tape religious_rep_bc_social_con religious_rep_bc_older religious_rep_bc_harder_worker religious_rep_bc_take_risks religious_rep_bc_more_indep religious_rep_bc_more_white religious_rep_bc_suburbs religious_rep_no_explanation if lean_republican == 1

* Republican SBOs *
sum sbo_rep_bc_income sbo_rep_bc_red_tape sbo_rep_bc_social_con sbo_rep_bc_older sbo_rep_bc_harder_worker sbo_rep_bc_take_risks sbo_rep_bc_more_indep sbo_rep_bc_more_white sbo_rep_bc_suburbs sbo_rep_no_explanation if lean_republican == 1

* Democrats Religious People *
sum religious_rep_bc_income religious_rep_bc_red_tape religious_rep_bc_social_con religious_rep_bc_older religious_rep_bc_harder_worker religious_rep_bc_take_risks religious_rep_bc_more_indep religious_rep_bc_more_white religious_rep_bc_suburbs religious_rep_no_explanation if lean_democrat == 1

* Democrats SBOs *
sum sbo_rep_bc_income sbo_rep_bc_red_tape sbo_rep_bc_social_con sbo_rep_bc_older sbo_rep_bc_harder_worker sbo_rep_bc_take_risks sbo_rep_bc_more_indep sbo_rep_bc_more_white sbo_rep_bc_suburbs sbo_rep_no_explanation if lean_democrat == 1
