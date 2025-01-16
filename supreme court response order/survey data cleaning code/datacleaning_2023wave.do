******
** Code to Clean Raw Survey Data from 2023 survey wave
** Author: Neil Malhotra
** Last updated: April 18, 2023
******


cd "C:\Users\neilm\Dropbox\supremecourt\survey data cleaning code\raw survey data"
import delimited using scotus-survey-2023-varcodesvaluescodes.csv, clear
set more off


// Opinions on Cases and Prediction of Court Decisions


egen affactionprivate_per = rowtotal (q1a q1b), missing
label define affactionprivate_per 1 "Private colleges and universities should NOT be able to use race as a factor in admissions" 2 "Private colleges and universities should be able to use race as a factor in admissions"
label values affactionprivate_per affactionprivate_per

egen affactionprivate_court = rowtotal (q2a q2b), missing
label define affactionprivate_court 1 "Private colleges and universities should NOT be able to use race as a factor in admissions" 2 "Private colleges and universities should be able to use race as a factor in admissions"
label values affactionprivate_court affactionprivate_court

egen affactionpublic_per = rowtotal (q3a q3b), missing
label define affactionpublic_per 1 "Public colleges and universities should NOT be able to use race as a factor in admissions" 2 "Public colleges and universities should be able to use race as a factor in admissions"
label values affactionpublic_per affactionpublic_per

egen affactionpublic_court = rowtotal (q4a q4b), missing
label define affactionpublic_court 1 "Public colleges and universities should NOT be able to use race as a factor in admissions" 2 "Public colleges and universities should be able to use race as a factor in admissions"
label values affactionpublic_court affactionpublic_court

egen fedelections_per = rowtotal (q5a q5b), missing
label define fedelections_per 1 "Only state legislatures can regulate federal elections, without oversight from state courts" 2 "State courts can exercise oversight over federal elections just like they do in other areas"
label values fedelections_per fedelections_per

egen fedelections_court = rowtotal (q6a q6b), missing
label define fedelections_court 1 "Only state legislatures can regulate federal elections, without oversight from state courts" 2 "State courts can exercise oversight over federal elections just like they do in other areas"
label values fedelections_court fedelections_court

egen gaydiscrim_per = rowtotal (q7a q7b), missing
label define gaydiscrim_per 1 "Such a law violates business owners rights to free speech" 2 "Such a law does NOT violate business owners rights to free speech"
label values gaydiscrim_per gaydiscrim_per

egen gaydiscrim_court = rowtotal (q8a q8b), missing
label define gaydiscrim_court 1 "Such a law violates business owners rights to free speech" 2 "Such a law does NOT violate business owners rights to free speech"
label values gaydiscrim_court gaydiscrim_court

egen gerrymandering_per = rowtotal (q9a q9b), missing
label define gerrymandering_per 1 "The state should be forced to redraw the district" 2 "The original plan with one majority-Black district is lawful"
label values gerrymandering_per gerrymandering_per

egen gerrymandering_court = rowtotal (q10a q10b), missing
label define gerrymandering_court 1 "The state should be forced to redraw the district" 2 "The original plan with one majority-Black district is lawful"
label values gerrymandering_court gerrymandering_court

egen cleanwater_per = rowtotal (q11a q11b), missing
label define cleanwater_per 1 "The Clean Water Act should be read broadly, to include things like wetlands" 2 "The Clean Water Act should be read narrowly, to not include things like wetlands"
label values cleanwater_per cleanwater_per

egen cleanwater_court = rowtotal (q12a q12b), missing
label define cleanwater_court 1 "The Clean Water Act should be read broadly, to include things like wetlands" 2 "The Clean Water Act should be read narrowly, to not include things like wetlands"
label values cleanwater_court cleanwater_court

egen commerce_per = rowtotal (q13a q13b), missing
label define commerce_per 1 "Such law discriminates against commerce from other states" 2 "Such a law does NOT discriminate against commerce from other states"
label values commerce_per commerce_per

egen commerce_court = rowtotal (q14a q14b), missing
label define commerce_court 1 "Such law discriminates against commerce from other states" 2 "Such a law does NOT discriminate against commerce from other states"
label values commerce_court commerce_court

egen copyright_per = rowtotal (q15a q15b), missing
label define copyright_per 1 "The original creator is NOT entitled to payment" 2 "The original creator is entitled to payment"
label values copyright_per copyright_per

egen copyright_court = rowtotal (q16a q16b), missing
label define copyright_court 1 "The original creator is NOT entitled to payment" 2 "The original creator is entitled to payment"
label values copyright_court copyright_court

egen algorithm_per = rowtotal (q17a q17b), missing
label define algorithm_per 1 "Companies CAN be held responsible when their algorithm recommends content to users" 2 "Companies CANNOT be held responsible when their algorithm recommends content to users"
label values algorithm_per algorithm_per

egen algorithm_court = rowtotal (q18a q18b), missing
label define algorithm_court 1 "Companies CAN be held responsible when their algorithm recommends content to users" 2 "Companies CANNOT be held responsible when their algorithm recommends content to users"
label values algorithm_court algorithm_court

egen socialmedia_per = rowtotal (q19a q19b), missing
label define socialmedia_per 1 "Social media companies CAN be held responsible" 2 "Social media companies CANNOT be held responsible"
label values socialmedia_per socialmedia_per

egen socialmedia_court = rowtotal (q20a q20b), missing
label define socialmedia_court 1 "Social media companies CAN be held responsible" 2 "Social media companies CANNOT be held responsible"
label values socialmedia_court socialmedia_court

egen studentloans_per = rowtotal (q21a q21b), missing
label define studentloans_per 1 "The Biden Administration overstepped its authority with its debt forgiveness plan" 2 "The Biden Administration did NOT overstep its authority with its debt forgiveness plan"
label values studentloans_per studentloans_per

egen studentloans_court = rowtotal (q22a q22b), missing
label define studentloans_court 1 "The Biden Administration overstepped its authority with its debt forgiveness plan" 2 "The Biden Administration did NOT overstep its authority with its debt forgiveness plan"
label values studentloans_court studentloans_court

egen unions_per = rowtotal (q23a q23b), missing
label define unions_per 1 "Union workers CAN be held responsible for such damage" 2 "Union workers CANNOT be held responsible for such damage"
label values unions_per unions_per

egen unions_court = rowtotal (q24a q24b), missing
label define unions_court 1 "Union workers CAN be held responsible for such damage" 2 "Union workers CANNOT be held responsible for such damage"
label values unions_court unions_court

egen native_per = rowtotal (q25a q25b), missing
label define native_per 1 "This law discriminates on the basis of race" 2 "This law does NOT discriminate on the basis of race"
label values native_per native_per

egen native_court = rowtotal (q26a q26b), missing
label define native_court 1 "This law discriminates on the basis of race" 2 "This law does NOT discriminate on the basis of race"
label values native_court native_court

egen religion_per = rowtotal (q27a q27b), missing
label define religion_per 1 "This is NOT religious discrimination" 2 "This is religious discrimination"
label values religion_per religion_per

egen religion_court = rowtotal (q28a q28b), missing
label define religion_court 1 "This is NOT religious discrimination" 2 "This is religious discrimination"
label values religion_court religion_court

// Case Recall

gen case_recall = q39
label define case_recall 1 "Yes" 2 "No"
label values case_recall case_recall

forvalues i = 1(1)10 {
gen case_remembered_`i' = q40_`i'_1
}



// Dobbs and Other Old Cases

gen dobbs = qdobbs
label define dobbs 1 "I AGREE with the Court overturning Roe and eliminating the constitutional right to an abortion" 2 "I DISAGREE with the Court overturning Roe and eliminating the constitutional right to an abortion"
label values dobbs dobbs

gen contraception_per = q29
label define contraception_per 1 "The right of couples to use contraception should be eliminated" 2 "The right of couples to use contraception should be upheld"
label values contraception_per contraception_per

gen contraception_court = q30
label define contraception_court 1 "The Supreme Court will eliminate the right of couples to use contraception" 2 "The Supreme Court will uphold the right of couples to use contraception"
label values contraception_court contraception_court

gen sodomy_per = q31
label define sodomy_per 1 "States should be allowed to punish people for engaging in homosexual conduct" 2 "States should NOT be allowed to punish people for engaging in homosexual conduct"
label values sodomy_per sodomy_per

gen sodomy_court = q32
label define sodomy_court 1 "The Supreme Court will allow states to punish people for engaging in homosexual conduct" 2 "The Supreme Court will NOT allow states to punish people for engaging in homosexual conduct"
label values sodomy_court sodomy_court

gen gaymarriage_per = q33
label define gaymarriage_per 1 "States should be allowed refuse to recognize same-sex marriages" 2 "States must continue to recognize same-sex marriages"
label values gaymarriage_per gaymarriage_per

gen gaymarriage_court = q34
label define gaymarriage_court 1 "The Supreme Court will allow states to refuse to recognize same-sex marriages" 2 "The Supreme Court will say that states must continue to recognize same-sex marriages"
label values gaymarriage_court gaymarriage_court

gen interracial_per = q35
label define interracial_per 1 "States should be allowed to prevent two people from different races from marrying" 2 "States should NOT be allowed to prevent two people from different races from marrying"
label values interracial_per interracial_per

gen interracial_court = q36
label define interracial_court 1 "The Supreme Court will say that states are allowed to prevent two people from different races from marrying" 2 "The Supreme Court will say states should NOT be allowed to prevent two people from different races from marrying"
label values interracial_court interracial_court


foreach var of varlist contraception_per sodomy_per gaymarriage_per interracial_per  {
svy: tab `var' pid3_recoded, col
}


// Party ID Recapture

gen pid3_recoded = pid3 
recode pid3_recoded (4=3) (5=3)
label define pid3_recoded 1 "Democrat" 2 "Republican" 3 "Independent/Other"
label values pid3_recoded pid3_recoded

gen pid7_recoded = pid7
label define pid7_recoded 1 "Strong Democrat" 2 "Not very strong Democrat" 3 "Lean Democrat" 4 "Independent" 5 "Lean Republican" 6 "Not very strong Republican" 7 "Strong Republican" 8 "Not sure" 
label values pid7_recoded pid7_recoded 

// Party Communication on Court

gen leaders_mention = q37
label define leaders_mention 1 "Always" 2 "Often" 3 "Sometimes" 4 "Rarely" 5 "Never"
label values leaders_mention leaders_mention

gen leaders_important = q38
label define leaders_important 1 "Extremely Important" 2 "Very Important" 3 "Somewhat Important" 4 "Slightly Important" 5 "Not Important at All"
label values leaders_important leaders_important

gen court_reputation = q41 

gen leaders_criticize = q43
label define leaders_criticize 1 "Strongly Agree" 2 "Somewhat Agree" 3 "Neither Agree nor Disagree" 4 "Somewhat Disagree" 5 "Strongly Disagree"
label values leaders_criticize leaders_criticize


// Qualities of Justices

gen justices_interpret = q42_1 
label define justices_interpret 1 "Extremely Important" 2 "Very Important" 3 "Somewhat Important" 4 "Slightly Important" 5 "Not Important at All"
label values justices_interpret justices_interpret  

gen justices_education = q42_2
label define justices_education 1 "Extremely Important" 2 "Very Important" 3 "Somewhat Important" 4 "Slightly Important" 5 "Not Important at All"
label values justices_education justices_education  

gen justices_agree = q42_3
label define justices_agree 1 "Extremely Important" 2 "Very Important" 3 "Somewhat Important" 4 "Slightly Important" 5 "Not Important at All"
label values justices_agree justices_agree  

gen justices_sameparty = q42_4
label define justices_sameparty 1 "Extremely Important" 2 "Very Important" 3 "Somewhat Important" 4 "Slightly Important" 5 "Not Important at All"
label values justices_sameparty justices_sameparty  



// Supreme Court Knowledge 
 
gen justice_selection = q47
label define justice_selection 1 "Elected to the bench" 2 "Appointed to the bench" 3 "Neither"
label values justice_selection justice_selection

gen justice_selection_correct = justice_selection==2

gen justice_term = q45
label define justice_term 1 "Set number of years" 2 "Life term" 3 "Neither"
label values justice_term justice_term

gen justice_term_correct = justice_term==2

gen last_say = q46
label define last_say 1 "U.S. Congress" 2 "U.S. Supreme Court" 3 "The President"
label values last_say last_say

gen last_say_correct = last_say==2

gen current_chief = q48
label define current_chief 1 "Stephen Breyer" 2 "Samuel Alito" 3 "Elena Kagan" 4 "John Roberts" 5 "Neil Gorsuch"
label values current_chief current_chief

gen current_chief_correct = current_chief==4

gen most_recent = q49
label define most_recent 1 "Sonia Sotomayor" 2 "Ketanji Brown Jackson" 3 "John Roberts" 4 "Brett Kavanaugh" 5 "Amy Coney Barrett"
label values most_recent most_recent

gen most_recent_correct = most_recent==2

gen gop_appt = q50
label define gop_appt 10 "9 out of 9" 8 "8 out of 9" 7 "7 out of 9" 6 "6 out of 9" 5 "5 out of 9" 4 "4 out of 9" 3 "3 out of 9" 2 "2 out of 9" 1 "1 out of 9" 10 "0 out of 9"
label values gop_appt gop_appt

gen gop_appt_correct = gop_appt==6

egen total_correct = rowtotal (justice_selection_correct justice_term_correct last_say_correct current_chief_correct most_recent_correct gop_appt_correct), missing


// Perceptions of Court Partisanship

gen typical_votes = q44
label define typical_votes 5 "9-0" 4 "8-1" 3 "7-2" 2 "6-3" 1 "5-4"
label values typical_votes typical_votes

gen partisan_effect = q51
label define partisan_effect 1 "A great deal" 2 "A lot" 3 "A moderate amount" 4 "A little" 5 "Not at all" 
label values partisan_effect partisan_effect


// Court Approval

gen approval = q52
label define approval 1 "Strongly Approve" 2 "Somewhat Approve" 3 "Neither Approve nor Disapprove" 4 "Somewhat Disapprove" 5 "Strongly Disapprove"
label values approval approval

// Overall Court Assessments


gen diffuse2 = q53_3
label var diffuse2 "The U.S. Supreme Court can usually be trusted"
label define diffuse2 1 "Strongly Agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly Disagree"
label values diffuse2 diffuse2

gen diffuse3 = q53_5
label var diffuse3 "The U.S. Supreme Court gets too mixed up in politics."
label define diffuse3 1 "Strongly Agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly Disagree"
label values diffuse3 diffuse3

// Countermajoritarianism


gen diffuse1 = q53_4
label var diffuse1 "If the U.S. Supreme Court started making a lot of decisions that most people disagree with"
label define diffuse1 1 "Strongly Agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly Disagree"
label values diffuse1 diffuse1

gen diffuse4 = q53_2
label var diffuse4 "Judges on the U.S. Supreme Court who consistently make decisions at odds"
label define diffuse4 1 "Strongly Agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly Disagree"
label values diffuse4 diffuse4

gen diffuse5 = q53_1
label var diffuse5 "The U.S. Supreme Court has become too independent"
label define diffuse5 1 "Strongly Agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly Disagree"
label values diffuse5 diffuse5

// Self-Ideological Placement and Court-Ideological Placement

gen ideology_personal = q54

gen ideology_court = q55


// Court Reforms

gen courtexpand = q56
label define courtexpand 1 "Strongly Agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly Disagree"
label values courtexpand courtexpand

gen courttermlimits = q57
label define courttermlimits 1 "Strongly Agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly Disagree"
label values courttermlimits courttermlimits

// YouGov Profile variables

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

label define votereg2 1 "Yes" 2 "No"
label values votereg2 votereg2

label define turnout20post 1 "Yes" 2 "No"
label values turnout20post turnout20post

// new variables in this wave: housevote22, votemethod22

label define turnout22post 1 "Yes" 2 "No"
label values turnout22post turnout22post

label define presvote20post 1 "Joe Biden" 2 "Donald Trump" 3 "Jo Jorgensen" 4 "Howie Hawkins" 5 "Other" 6 "Did not vote"
label values presvote20post presvote20post

label define acsownrent 1 "Own" 2 "Rent" 3 "Other"
label values acsownrent acsownrent 

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

save "C:\Users\neilm\Dropbox\supremecourt\survey data cleaning code\cleaned survey data\supremecourtsurveydata2023_cleaned.dta", replace





svyset [pweight=weight]

// Recode so that 1 is always conservative positions




foreach var of varlist affactionprivate_per - religion_court {
svy: tab `var' pid3_recoded, col
}

foreach var of varlist affactionprivate_per affactionpublic_per fedelections_per gaydiscrim_per gerrymandering_per cleanwater_per commerce_per copyright_per algorithm_per socialmedia_per studentloans_per unions_per native_per religion_per {
svy: tab `var' pid3_recoded, col
}







