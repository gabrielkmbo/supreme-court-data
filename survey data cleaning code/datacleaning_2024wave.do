******
** Code to Clean Raw Survey Data from 2024 survey wave
** Author: Neil Malhotra
** Last updated: March 31, 2024
******


cd "C:\Users\neilm\Dropbox\supremecourt\survey data cleaning code\raw survey data"
import delimited using scotus-survey-2024-varcodesvaluescodes.csv, clear
set more off


// Opinions on Cases and Prediction of Court Decisions


egen redistricting_per = rowtotal (q1a q1b), missing
label define redistricting_per 1 "These changes to the districts are unconstitutional" 2 "These changes to the districts are constitutional"
label values redistricting_per redistricting_per

egen redistricting_court = rowtotal (q2a q2b), missing
label define redistricting_court 1 "These changes to the districts are unconstitutional" 2 "These changes to the districts are constitutional"
label values redistricting_court redistricting_court

egen cfpb_per = rowtotal (q3a q3b), missing
label define cfpb_per 1 "This funding structure is unconstitutional" 2 "This funding structure is constitutional"
label values cfpb_per cfpb_per

egen cfpb_court = rowtotal (q4a q4b), missing
label define cfpb_court 1 "This funding structure is unconstitutional" 2 "This funding structure is constitutional"
label values cfpb_court cfpb_court

egen abortion_per = rowtotal (q5a q5b), missing
label define abortion_per 1 "The Food and Drug Administration's approval of mifepristone should be revoked" 2 "The Food and Drug Administration's approval of mifepristone should NOT be revoked"
label values abortion_per abortion_per

egen abortion_court = rowtotal (q6a q6b), missing
label define abortion_court 1 "The Food and Drug Administration's approval of mifepristone should be revoked" 2 "The Food and Drug Administration's approval of mifepristone should NOT be revoked"
label values abortion_court abortion_court

egen opioids_per = rowtotal (q7a q7b), missing
label define opioids_per 1 "The Sackler family should NOT keep their immunity from future lawsuits" 2 "The Sackler family should keep their immunity from future lawsuits"
label values opioids_per opioids_per

egen opioids_court = rowtotal (q8a q8b), missing
label define opioids_court 1 "The Sackler family should NOT keep their immunity from future lawsuits" 2 "The Sackler family should keep their immunity from future lawsuits"
label values opioids_court opioids_court

egen blocking_per = rowtotal (q9a q9b), missing
label define blocking_per 1 "Public officials are allowed to block people from private social media accounts used to conduct government business" 2 "Public officials are NOT allowed to block people from private social media accounts used to conduct government business"
label values blocking_per blocking_per

egen blocking_court = rowtotal (q10a q10b), missing
label define blocking_court 1 "Public officials are allowed to block people from private social media accounts used to conduct government business" 2 "Public officials are NOT allowed to block people from private social media accounts used to conduct government business"
label values blocking_court blocking_court

egen chevron_per = rowtotal (q11a q11b), missing
label define chevron_per 1 "Courts should NOT defer to administrative agencies when laws are unclear" 2 "Courts should defer to administrative agencies when laws are unclear"
label values chevron_per chevron_per

egen chevron_court = rowtotal (q12a q12b), missing
label define chevron_court 1 "Courts should NOT defer to administrative agencies when laws are unclear" 2 "Courts should defer to administrative agencies when laws are unclear"
label values chevron_court chevron_court

egen abortionhosp_per = rowtotal (q13a q13b), missing
label define abortionhosp_per 1 "Idaho hospitals are not allowed to provide abortions in medical emergencies" 2 "Idaho hospitals must provide abortions in medical emergencies"
label values abortionhosp_per abortionhosp_per

egen abortionhosp_court = rowtotal (q13a q13b), missing
label define abortionhosp_court 1 "Idaho hospitals are not allowed to provide abortions in medical emergencies" 2 "Idaho hospitals must provide abortions in medical emergencies"
label values abortionhosp_court abortionhosp_court

egen socmedblock_per = rowtotal (q15a q15b), missing
label define socmedblock_per 1 "Federal officials urging private social media companies to block, delete, or remove users violates users' First Amendment rights" 2 "Federal officials urging private social media companies to block, delete, or remove users does NOT violate users' First Amendment rights"
label values socmedblock_per socmedblock_per

egen socmedblock_court = rowtotal (q16a q16b), missing
label define socmedblock_court 1 "Federal officials urging private social media companies to block, delete, or remove users violates users' First Amendment rights" 2 "Federal officials urging private social media companies to block, delete, or remove users does NOT violate users' First Amendment rights"
label values socmedblock_court socmedblock_court

egen nra_per = rowtotal (q17a q17b), missing
label define nra_per 1 "The state regulator's behavior violates the NRA's First Amendment Rights" 2 "The state regulator's behavior DOES NOT violate the NRA's First Amendment Rights"
label values nra_per nra_per

egen nra_court = rowtotal (q18a q18b), missing
label define nra_court 1 "The state regulator's behavior violates the NRA's First Amendment Rights" 2 "The state regulator's behavior DOES NOT violate the NRA's First Amendment Rights"
label values nra_court nra_court

egen statessocmed_per = rowtotal (q19a q19b), missing
label define statessocmed_per 1 "States should be allowed to prevent social media companies from censoring speech" 2 "States cannot prevent social media companies from censoring speech"
label values statessocmed_per statessocmed_per

egen statessocmed_court = rowtotal (q20a q20b), missing
label define statessocmed_court 1 "States should be allowed to prevent social media companies from censoring speech" 2 "States cannot prevent social media companies from censoring speech"
label values statessocmed_court statessocmed_court

egen admincourts_per = rowtotal (q21a q21b), missing
label define admincourts_per 1 "Federal agencies bringing actions in administrative proceedings rather than in federal courts is NOT constitutional" 2 "Federal agencies bringing actions in administrative proceedings rather than in federal courts is constitutional"
label values admincourts_per admincourts_per

egen admincourts_court = rowtotal (q22a q22b), missing
label define admincourts_court 1 "Federal agencies bringing actions in administrative proceedings rather than in federal courts is NOT constitutional" 2 "Federal agencies bringing actions in administrative proceedings rather than in federal courts is constitutional"
label values admincourts_court admincourts_court

egen trumpelig_per = rowtotal (q23a q23b), missing
label define trumpelig_per 1 "President Donald Trump is NOT eligible to run for president in 2024" 2 "President Donald Trump is eligible to run for president in 2024"
label values trumpelig_per trumpelig_per

egen trumpelig_court = rowtotal (q24a q24b), missing
label define trumpelig_court 1 "President Donald Trump is NOT eligible to run for president in 2024" 2 "President Donald Trump is eligible to run for president in 2024"
label values trumpelig_court trumpelig_court

egen trumpimmune_per = rowtotal (q25a q25b), missing
label define trumpimmune_per 1 "Former presidents are immune from criminal prosecution for actions they took while president" 2 "Former presidents are NOT immune from criminal prosecution for actions they took while president"
label values trumpimmune_per trumpimmune_per

egen trumpimmune_court = rowtotal (q26a q26b), missing
label define trumpimmune_court 1 "Former presidents are immune from criminal prosecution for actions they took while president" 2 "Former presidents are NOT immune from criminal prosecution for actions they took while president"
label values trumpimmune_court trumpimmune_court

egen gunrights_per = rowtotal (q27a q27b), missing
label define gunrights_per 1 "Barring domestic abusers from possessing firearms violates their Second Amendment rights" 2 "Barring domestic abusers from possessing firearms DOES NOT violate their Second Amendment rights"
label values gunrights_per gunrights_per

egen gunrights_court = rowtotal (q28a q28b), missing
label define gunrights_court 1 "Barring domestic abusers from possessing firearms violates their Second Amendment rights" 2 "Barring domestic abusers from possessing firearms DOES NOT violate their Second Amendment rights"
label values gunrights_court gunrights_court

egen trademark_per = rowtotal (q29a q29b), missing
label define trademark_per 1 "Forbidding trademarks that include individual names, including politicians' names, does violate the First Amendment" 2 "Forbidding trademarks that include individual names, including politicians' names, does NOT violate the First Amendment"
label values trademark_per trademark_per

egen trademark_court = rowtotal (q30a q30b), missing
label define trademark_court 1 "Forbidding trademarks that include individual names, including politicians' names, does violate the First Amendment" 2 "Forbidding trademarks that include individual names, including politicians' names, does NOT violate the First Amendment"
label values trademark_court trademark_court

egen homeless_per = rowtotal (q31a q31b), missing
label define homeless_per 1 "Banning homeless people from camping outside even when local shelters are full violates the Constitution" 2 "Banning homeless people from camping outside even when local shelters are full DOES NOT violate the Constitution"
label values homeless_per homeless_per

egen homeless_court = rowtotal (q32a q32b), missing
label define homeless_court 1 "Banning homeless people from camping outside even when local shelters are full violates the Constitution" 2 "Banning homeless people from camping outside even when local shelters are full DOES NOT violate the Constitution"
label values homeless_court homeless_court

egen insurrection_per = rowtotal (q33a q33b), missing
label define insurrection_per 1 "The events at the U.S. Capitol Building on January 6, 2021 were NOT criminal" 2 "The events at the U.S. Capitol Building on January 6, 2021 were criminal"
label values insurrection_per insurrection_per

egen insurrection_court = rowtotal (q34a q34b), missing
label define insurrection_court 1 "The events at the U.S. Capitol Building on January 6, 2021 were NOT criminal" 2 "The events at the U.S. Capitol Building on January 6, 2021 were criminal"
label values insurrection_court insurrection_court



// Supreme Court Vacancies

gen sc_presvote = q35
label define sc_presvote 1 "Extremely Important" 2 "Very Important" 3 "Moderately Important" 4 "Slightly Important" 5 "Not Important at All"
label values sc_presvote sc_presvote

gen sc_congressvote = q36
label define sc_congressvote 1 "Extremely Important" 2 "Very Important" 3 "Moderately Important" 4 "Slightly Important" 5 "Not Important at All"
label values sc_congressvote sc_congressvote



// Qualities of Justices

gen justices_interpret = q37_3 
label define justices_interpret 1 "Extremely Important" 2 "Very Important" 3 "Somewhat Important" 4 "Slightly Important" 5 "Not Important at All"
label values justices_interpret justices_interpret  

gen justices_education = q37_1
label define justices_education 1 "Extremely Important" 2 "Very Important" 3 "Somewhat Important" 4 "Slightly Important" 5 "Not Important at All"
label values justices_education justices_education  

gen justices_agree = q37_2
label define justices_agree 1 "Extremely Important" 2 "Very Important" 3 "Somewhat Important" 4 "Slightly Important" 5 "Not Important at All"
label values justices_agree justices_agree  

gen justices_sameideo = q37_4
label define justices_sameideo 1 "Extremely Important" 2 "Very Important" 3 "Somewhat Important" 4 "Slightly Important" 5 "Not Important at All"
label values justices_sameideo justices_sameideo  

// Party Communication on Court


gen leaders_criticize = q38
label define leaders_criticize 1 "Strongly Agree" 2 "Somewhat Agree" 3 "Neither Agree nor Disagree" 4 "Somewhat Disagree" 5 "Strongly Disagree"
label values leaders_criticize leaders_criticize






// Supreme Court Knowledge 
 
gen justice_selection = q42
label define justice_selection 1 "Elected to the bench" 2 "Appointed to the bench" 3 "Neither"
label values justice_selection justice_selection

gen justice_selection_correct = justice_selection==2

gen justice_term = q40
label define justice_term 1 "Set number of years" 2 "Life term" 3 "Neither"
label values justice_term justice_term

gen justice_term_correct = justice_term==2

gen last_say = q41
label define last_say 1 "U.S. Congress" 2 "U.S. Supreme Court" 3 "The President"
label values last_say last_say

gen last_say_correct = last_say==2

gen current_chief = q43
label define current_chief 1 "Stephen Breyer" 2 "Samuel Alito" 3 "Elena Kagan" 4 "John Roberts" 5 "Neil Gorsuch"
label values current_chief current_chief

gen current_chief_correct = current_chief==4

gen most_recent = q44
label define most_recent 1 "Sonia Sotomayor" 2 "Ketanji Brown Jackson" 3 "John Roberts" 4 "Brett Kavanaugh" 5 "Amy Coney Barrett"
label values most_recent most_recent

gen most_recent_correct = most_recent==2

gen gop_appt = q45
label define gop_appt 10 "9 out of 9" 8 "8 out of 9" 7 "7 out of 9" 6 "6 out of 9" 5 "5 out of 9" 4 "4 out of 9" 3 "3 out of 9" 2 "2 out of 9" 1 "1 out of 9" 10 "0 out of 9"
label values gop_appt gop_appt

gen gop_appt_correct = gop_appt==6

egen total_correct = rowtotal (justice_selection_correct justice_term_correct last_say_correct current_chief_correct most_recent_correct gop_appt_correct), missing


// Perceptions of Court Partisanship

gen typical_votes = q39
label define typical_votes 5 "9-0" 4 "8-1" 3 "7-2" 2 "6-3" 1 "5-4"
label values typical_votes typical_votes

gen partisan_effect = q46
label define partisan_effect 1 "A great deal" 2 "A lot" 3 "A moderate amount" 4 "A little" 5 "Not at all" 
label values partisan_effect partisan_effect


// Court Approval

gen approval = q47
label define approval 1 "Strongly Approve" 2 "Somewhat Approve" 3 "Neither Approve nor Disapprove" 4 "Somewhat Disapprove" 5 "Strongly Disapprove"
label values approval approval

// Overall Court Assessments


gen diffuse2 = q48_5
label var diffuse2 "The U.S. Supreme Court can usually be trusted"
label define diffuse2 1 "Strongly Agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly Disagree"
label values diffuse2 diffuse2

gen diffuse3 = q48_4
label var diffuse3 "The U.S. Supreme Court gets too mixed up in politics."
label define diffuse3 1 "Strongly Agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly Disagree"
label values diffuse3 diffuse3

// Countermajoritarianism


gen diffuse1 = q48_3
label var diffuse1 "If the U.S. Supreme Court started making a lot of decisions that most people disagree with"
label define diffuse1 1 "Strongly Agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly Disagree"
label values diffuse1 diffuse1

gen diffuse4 = q48_1
label var diffuse4 "Judges on the U.S. Supreme Court who consistently make decisions at odds"
label define diffuse4 1 "Strongly Agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly Disagree"
label values diffuse4 diffuse4

gen diffuse5 = q48_2
label var diffuse5 "The U.S. Supreme Court has become too independent"
label define diffuse5 1 "Strongly Agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly Disagree"
label values diffuse5 diffuse5

// Self-Ideological Placement and Court-Ideological Placement

gen ideology_personal = q49

gen ideology_court = q50


// Court Reforms

gen courtexpand = q51
label define courtexpand 1 "Strongly Agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly Disagree"
label values courtexpand courtexpand

gen courttermlimits = q52
label define courttermlimits 1 "Strongly Agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly Disagree"
label values courttermlimits courttermlimits

// YouGov Profile variables



gen pid3_recoded = pid3 
recode pid3_recoded (4=3) (5=3)
label define pid3_recoded 1 "Democrat" 2 "Republican" 3 "Independent/Other"
label values pid3_recoded pid3_recoded

gen pid7_recoded = pid7
label define pid7_recoded 1 "Strong Democrat" 2 "Not very strong Democrat" 3 "Lean Democrat" 4 "Independent" 5 "Lean Republican" 6 "Not very strong Republican" 7 "Strong Republican" 8 "Not sure" 
label values pid7_recoded pid7_recoded 

gen polinterest = newsint
label define polinterest 1 "Most of the time" 2 "Some of the time" 3 "Only now and then" 4 "Hardly at all" 5 "Don't know" 
label values polinterest polinterest


label define cablenews 1 "CNN" 2 "Fox News" 3 "MSNBC" 4 "Other" 5 "Don't watch"
label values cablenews cablenews

gen ideology3 = ideo3
label define ideology3 1 "Liberal" 2 "Moderate" 3 "Conservative" 4 "Not sure"
label values ideology3 ideology3

gen ideology5 = ideo5
label define ideology5 1 "Very liberal" 2 "Liberal" 3 "Moderate" 4 "Conservative" 5 "Very conservative" 6 "Not sure" 
label values ideology5 ideology5

label define votereg 1 "Yes" 2 "No" 3 "Don't know"
label values votereg votereg


label define turnout20 1 "Yes" 2 "No"
label values turnout20 turnout20

// some additional variables: house vote 2022, method of voting 2022

label define turnout22post 1 "Yes" 2 "No"
label values turnout22post turnout22post

label define presvote20post 1 "Joe Biden" 2 "Donald Trump" 3 "Jo Jorgensen" 4 "Howie Hawkins" 5 "Other" 6 "Did not vote"
label values presvote20post presvote20post

label define ownrent 1 "Own" 2 "Rent" 3 "Other"
label values ownrent ownrent 

label define gender 1 "Male" 2 "Female"
label values gender gender

label define age4 1 "Under 30" 2 "30-44" 3 "34-64" 4 "65+"
label values age4 age4

label define race 1 "White" 2 "Black" 3 "Hispanic" 4 "Asian" 5 "Native American" 6 "Middle Eastern" 7 "Mixed" 8 "Other"
label values race race 

label define race4 1 "White" 2 "Black" 3 "Hispanic" 4 "Other"
label values race4 race4

label define educ 1 "No HS" 2 "High school graduate" 3 "Some college" 4 "2-year" 5 "4-year" 6 "Post-grad"
label values educ educ

label define educ4 1 "HS or less" 2 "Some college" 3 "College grad" 4 "Postgrad"
label values educ4 educ4

label define marstat 1 "Married" 2 "Separated" 3 "Divorced" 4 "Widowed" 5 "Never married" 6 "Domestic / civil partnership" 
label values marstat marstat

label define child18 1 "Yes" 2 "No"
label values child18 child18

label define inputstate 1 "Alabama" 2 "Alaska" 4 "Arizona" 5  "Arkansas" 6 "California" 8 "Colorado" 9 "Connecticut" 10 "Delaware" 11 "District of Columbia" 12 "Florida" 13 "Georgia" 15 "Hawaii" 16 "Idaho" 17 "Illinois" 18 "Indiana" 19 "Iowa" 20 "Kansas" 21 "Kentucky" 22 "Louisiana" 23 "Maine" 24 "Maryland" 25 "Massachusetts" 26 "Michigan" 27 "Minnesota" 28 "Mississippi" 29 "Missouri" 30 "Montana" 31 "Nebraska" 32 "Nevada" 33 "New Hampshire" 34 "New Jersey" 35 "New Mexico" 36 "New York" 37 "North Carolina" 38 "North Dakota" 39 "Ohio" 40 "Oklahoma" 41 "Oregon" 42 "Pennsylvania" 44 "Rhode Island" 45 "South Carolina" 46 "South Dakota" 47 "Tennessee" 48 "Texas" 49 "Utah" 50 "Vermont" 51 "Virginia" 53 "Washington" 54 "West Virginia" 55 "Wisconsin" 56 "Wyoming"
label values inputstate inputstate

label define region 1 "Northeast" 2 "Midwest" 3 "South" 4 "West"
label values region region

label define urbancity 1 "City" 2 "Suburb" 3 "Town" 4 "Rural area" 5 "Other"
label values urbancity urbancity

label define employstat2 1  "Full-time"	7 "Homemaker"	9 "Other"	2 "Part-time" 6	"Permanently disabled" 5 	"Retired" 8	"Student" 3	"Temporarily laid off" 4	"Unemployed"
label values employstat2 employstat2

label define faminc 2 "$10,000 - $19,999"	10 "$100,000 - $119,999" 11	"$120,000 - $149,999"	12 "$150,000 - $199,999"	3 "$20,000 - $29,999"	13 "$200,000 - $249,999" 14	"$250,000 - $349,999"	4 "$30,000 - $39,999"	15 "$350,000 - $499,999"	5 "$40,000 - $49,999"	6 "$50,000 - $59,999"	16 "$500,000 or more"	7 "$60,000 - $69,999"	8 "$70,000 - $79,999"	9 "$80,000 - $99,999"	1 "Less than $10,000"	97 "Prefer not to say"
label values faminc faminc

label define income3 1 "under $50k" 2 "$50k=$100k" 3 "$100k or more" 4 "Prefer not to say"
label values income3 income3

label define milstat 1 "selected" 2 "not selected"
label values milstat_1 milstat
label values milstat_2 milstat
label values milstat_3 milstat
label values milstat_4 milstat
label values milstat_5 milstat

label define union 1 "selected" 2 "not selected"
label values union_hhold_1 union
label values union_hhold_2 union
label values union_hhold_3 union

label define pew_religimp 1 "Very importnant" 2 "Somewhat important" 3 "Not too important" 4 "Not at all important"
label values pew_religimp pew_religimp

label define pew_churatd 1 "More than once a week" 2 "Once a week" 3 "Once or twice a month" 4 "A few times a year" 5 "Seldom" 6 "Never" 7 "Don't know"
label values pew_churatd pew_churatd 

label define pew_bornagain 1 "Yes" 2 "No"
label values pew_bornagain pew_bornagain

label define pew_prayer 1 "Several times a day" 2 "Once a day" 3 "A few times a week" 4 "Once a week" 5 "A few times a month" 6 "Seldom" 7 "Never" 8 "Don't Know"
label values  pew_prayer pew_prayer

label define religpew 10 "Agnostic"	9 "Atheist"	7 "Buddhist"	4 "Eastern or Greek Orthodox" 8 "Hindu" 5	"Jewish" 3	"Mormon"	6 "Muslim"	11 "Nothing in particular" 1	"Protestant"	2 "Roman Catholic"	12 "Something else"
label values religpew religpew

save "C:\Users\neilm\Dropbox\supremecourt\survey data cleaning code\cleaned survey data\supremecourtsurveydata2024_cleaned.dta", replace





svyset [pweight=weight]

// Recode so that 1 is always conservative positions



foreach var of varlist redistricting_per cfpb_per abortion_per opioids_per blocking_per chevron_per abortionhosp_per socmedblock_per nra_per statessocmed_per admincourts_per trumpelig_per trumpimmune_per gunrights_per trademark_per homeless_per insurrection_per {
svy: tab `var' pid3_recoded, col
}







