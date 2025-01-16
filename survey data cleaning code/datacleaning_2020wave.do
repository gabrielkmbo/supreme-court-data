******
** Code to Clean Raw Survey Data from 2020 survey wave
** Author: Neil Malhotra
** Last updated: July 2, 2021
******



cd "/Users/gabrielbo/Downloads/summer 24 research/raw survey data"
import delimited using SCOTUS-Survey-May-12-2020.csv, clear
set more off


// Opinions on Cases and Prediction of Court Decisions

egen fire_gays_per = rowtotal (q1a q1b), missing
label define fire_gays_per 1 "It should be ILLEGAL for employees to be fired based on their sexual orientation" 2 "It should be LEGAL for employers to fire people based on their sexual orientation"
label values fire_gays_per fire_gays_per

egen fire_gays_court = rowtotal (q2a q2b), missing
label define fire_gays_court 1 "It should be ILLEGAL for employees to be fired based on their sexual orientation" 2 "It should be LEGAL for employers to fire people based on their sexual orientation"
label values fire_gays_court fire_gays_court

egen fire_trans_per = rowtotal (q3a q3b), missing
label define fire_trans_per 1 "It should be ILLEGAL for employees to be fired for being transgender." 2 "It should be LEGAL for employees to be fired for being transgender."
label values fire_trans_per fire_trans_per

egen fire_trans_court = rowtotal (q4a q4b), missing
label define fire_trans_court 1 "It should be ILLEGAL for employees to be fired for being transgender." 2 "It should be LEGAL for employees to be fired for being transgender."
label values fire_trans_court fire_trans_court

egen daca_per = rowtotal (q5a q5b), missing
label define daca_per 1 "DACA should remain." 2 "DACA should be ended."
label values daca_per daca_per

egen daca_court = rowtotal (q6a q6b), missing
label define daca_court 1 "DACA should remain." 2 "DACA should be ended."
label values daca_court daca_court

egen handguns_per = rowtotal (q7a q7b), missing
label define handguns_per 1 "Cities SHOULD be allowed to ban transport of handguns outside of their city limits." 2 "Cities SHOULD NOT be allowed to ban transport of handguns outside of their city limits."
label values handguns_per handguns_per

egen handguns_court = rowtotal (q8a q8b), missing
label define handguns_court 1 "Cities SHOULD be allowed to ban transport of handguns outside of their city limits." 2 "Cities SHOULD NOT be allowed to ban transport of handguns outside of their city limits."
label values handguns_court handguns_court

egen scholarships_per = rowtotal (q9a q9b), missing
label define scholarships_per 1 "States SHOULD be allowed to ban students from using taxpayer-subsidized scholarships to attend religious schools" 2 "States SHOULD NOT be allowed to ban students from using taxpayer-subsidized scholarships to attend religious schools"
label values scholarships_per scholarships_per

egen scholarships_court = rowtotal (q10a q10b), missing
label define scholarships_court 1 "States SHOULD be allowed to ban students from using taxpayer-subsidized scholarships to attend religious schools" 2 "States SHOULD NOT be allowed to ban students from using taxpayer-subsidized scholarships to attend religious schools"
label values scholarships_court scholarships_court

egen abortion_per = rowtotal (q11a q11b), missing
label define abortion_per 1 "States requiring abortion providers to have admitting privileges DOES violate women's constitutional rights" 2 "States requiring abortion providers to have admitting privileges DOES NOT violate women's constitutional rights"
label values abortion_per abortion_per

egen abortion_court = rowtotal (q12a q12b), missing
label define abortion_court 1 "States requiring abortion providers to have admitting privileges DOES violate women's constitutional rights" 2 "States requiring abortion providers to have admitting privileges DOES NOT violate women's constitutional rights"
label values abortion_court abortion_court

egen trump_congress_per = rowtotal (q13a q13b), missing
label define trump_congress_per  1 "A president SHOULD be able to block turning over his financial records to Congress" 2 "A president SHOULD NOT be able to block turning over his financial records to Congress"
label values trump_congress_per trump_congress_per

egen trump_congress_court = rowtotal (q14a q14b), missing
label define trump_congress_court 1 "A president SHOULD be able to block turning over his financial records to Congress" 2 "A president SHOULD NOT be able to block turning over his financial records to Congress" 
label values trump_congress_court trump_congress_court

egen trump_state_per = rowtotal (q15a q15b), missing
label define trump_state_per 1 "New York state prosecutors have the right to obtain a president's tax records" 2 "A president does not have to turn over his tax records to state prosecutors"
label values trump_state_per trump_state_per

egen trump_state_court = rowtotal (q16a q16b), missing
label define trump_state_court 1 "New York state prosecutors have the right to obtain a president's tax records" 2 "A president does not have to turn over his tax records to state prosecutors"
label values trump_state_court trump_state_court

egen cfpb_per = rowtotal (q17a q17b), missing
label define cfpb_per 1 "The structure of the CFPB is appropriate" 2 "The CFPB has too much independent power"
label values cfpb_per cfpb_per

egen cfpb_court = rowtotal (q18a q18b), missing
label define cfpb_court 1 "The structure of the CFPB is appropriate" 2 "The CFPB has too much independent power"
label values cfpb_court cfpb_court

egen electoralcollege_per = rowtotal (q19a q19b), missing
label define electoralcollege_per 1 "States SHOULD be able to require their electors to vote for the candidate who won their state" 2 "States SHOULD NOT be able to require their electors to vote for the candidate who won their state"
label values electoralcollege_per electoralcollege_per

egen electoralcollege_court = rowtotal (q20a q20b), missing
label define electoralcollege_court 1 "States SHOULD be able to require their electors to vote for the candidate who won their state" 2 "States SHOULD NOT be able to require their electors to vote for the candidate who won their state"
label values electoralcollege_court electoralcollege_court

egen contraceptives_per = rowtotal (q21a q21b), missing
label define contraceptives_per 1 "Employers SHOULD NOT be forced to cover contraceptives" 2 "Employers SHOULD be forced to cover contraceptives" 
label values contraceptives_per contraceptives_per

egen contraceptives_court = rowtotal (q22a q22b), missing
label define contraceptives_court 1 "Employers SHOULD NOT be forced to cover contraceptives" 2 "Employers SHOULD be forced to cover contraceptives" 
label values contraceptives_court contraceptives_court

egen aca_per = rowtotal (q23a q23b), missing
label define aca_per 1 "The Affordable Care Act SHOULD be struck down" 2 "The Affordable Care Act SHOULD NOT be struck down" 
label values aca_per aca_per

egen aca_court = rowtotal (q24a q24b), missing
label define aca_court 1 "The Affordable Care Act SHOULD be struck down" 2 "The Affordable Care Act SHOULD NOT be struck down" 
label values aca_court aca_court


// Supreme Court Knowledge

gen justice_selection = q25
label define justice_selection 1 "Elected to the bench" 2 "Appointed to the bench" 3 "Neither"
label values justice_selection justice_selection

gen justice_selection_correct = justice_selection==2

gen justice_term = q26
label define justice_term 1 "Set number of years" 2 "Life term" 3 "Neither"
label values justice_term justice_term

gen justice_term_correct = justice_term==2

gen last_say = q27
label define last_say 1 "U.S. Congress" 2 "U.S. Supreme Court" 3 "The President"
label values last_say last_say

gen last_say_correct = last_say==2

gen current_chief = q28
label define current_chief 1 "Neil Gorsuch" 2 "Stephen Breyer" 3 "Samuel Alito" 4 "John Roberts" 5 "Elena Kagan"
label values current_chief current_chief

gen current_chief_correct = current_chief==4

gen most_recent = q29
label define most_recent 1 "Brett Kavanaugh" 2 "Elena Kagan" 3 "Sonia Sotomayor" 4 "Neil Gorsuch" 5 "John Roberts"
label values most_recent most_recent

gen most_recent_correct = most_recent==1

gen gop_appt = q39
label define gop_appt 1 "9 out of 9" 2 "8 out of 9" 3 "7 out of 9" 4 "6 out of 9" 5 "5 out of 9" 6 "4 out of 9" 7 "3 out of 9" 8 "2 out of 9" 9 "1 out of 9" 10 "0 out of 9"
label values gop_appt gop_appt

gen gop_appt_correct = gop_appt==5

egen total_correct = rowtotal (justice_selection_correct justice_term_correct last_say_correct current_chief_correct most_recent_correct gop_appt_correct), missing


// Perceptions of Court Partisanship

gen typical_votes = q38
label define typical_votes 1 "9-0" 2 "8-1" 3 "7-2" 4 "6-3" 5 "5-4"
label values typical_votes typical_votes

gen partisan_effect = q40
label define partisan_effect 1 "A great deal" 2 "A lot" 3 "A moderate amount" 4 "A little" 5 "Not at all" 
label values partisan_effect partisan_effect

// Overall Court Assessments

gen diffuse2 = q31
label var diffuse2 "The U.S. Supreme Court can usually be trusted"
label define diffuse2 1 "Strongly Agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly Disagree"
label values diffuse2 diffuse2

gen diffuse3 = q32
label var diffuse3 "The U.S. Supreme Court gets too mixed up in politics."
label define diffuse3 1 "Strongly Agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly Disagree"
label values diffuse3 diffuse3

gen approval = q37
label define approval 1 "Strongly Approve" 2 "Somewhat Approve" 3 "Neither Approve nor Disapprove" 4 "Somewhat Disapprove" 5 "Strongly Disapprove"
label values approval approval

// Countermajoritarianism


gen diffuse1 = q30
label var diffuse1 "If the U.S. Supreme Court started making a lot of decisions that most people disagree with"
label define diffuse1 1 "Strongly Agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly Disagree"
label values diffuse1 diffuse1

gen diffuse4 = q33
label var diffuse4 "Judges on the U.S. Supreme Court who consistently make decisions at odds"
label define diffuse4 1 "Strongly Agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly Disagree"
label values diffuse4 diffuse4

gen diffuse5 = q34
label var diffuse5 "The U.S. Supreme Court has become too independent"
label define diffuse5 1 "Strongly Agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly Disagree"
label values diffuse5 diffuse5

// Self-Ideological Placement and Court-Ideological Placement

gen ideology_personal = q35

gen ideology_court = q36


// YouGov Profile variables

gen polinterest = newsint
label define polinterest 1 "Most of the time" 2 "Some of the time" 3 "Only now and then" 4 "Hardly at all" 5 "Don't know" 
label values polinterest polinterest

gen ideology3 = ideo3
label define ideology3 1 "Liberal" 2 "Moderate" 3 "Conservative" 4 "Not sure"
label values ideology3 ideology3

gen ideology5 = ideo5
label define ideology5 1 "Very liberal" 2 "Liberal" 3 "Moderate" 4 "Conservative" 5 "Very conservative" 6 "Not sure" 
label values ideology5 ideology5

label define votereg 1 "Yes" 2 "No" 3 "Don't know"
label values votereg votereg

label define votereg2 1 "Yes" 2 "No"
label values votereg2 votereg2

label define presvote16x 1 "Hillary Clinton" 2 "Donald Trump" 3 "Someone else" 4 "Non-voter"
label values presvote16x presvote16x

label define pid3 1 "Democrat" 2 "Republican" 3 "Independent" 4 "Other" 5 "Not sure"
label values pid3 pid3 

gen pid3_recoded = pid3 
recode pid3_recoded (4=3) (5=3)
label define pid3_recoded 1 "Democrat" 2 "Republican" 3 "Independent/Other"
label values pid3_recoded pid3_recoded

label define pid7 1 "Strong Democrat" 2 "Not very strong Democrat" 3 "Lean Democrat" 4 "Independent" 5 "Lean Republican" 6 "Not very strong Republican" 7 "Strong Republican" 8 "Not sure" 
label values pid7 pid7 

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

label define employ 1  "Full-time"	7 "Homemaker"	9 "Other"	2 "Part-time" 6	"Permanently disabled" 5 	"Retired" 8	"Student" 3	"Temporarily laid off" 4	"Unemployed"
label values employ employ

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

save "C:\Users\neilm\Dropbox\supremecourt\survey data cleaning code\cleaned survey data\supremecourtsurveydata2020_cleaned.dta", replace






































 







































 
 
 
 
 






















































































