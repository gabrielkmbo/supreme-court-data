*** This file cleans the data for analysis***
*** Neil Malhotra ***
*** 4/20/21 ****



cd "C:\Users\neilm\Dropbox\supremecourt\2021 survey\survey data"
import delimited using scotus-survey-april-16-2021-variablecodesvaluescodes.csv, clear
set more off


/* Recode/Label Data */


egen gayadoption_per = rowtotal (q1a q1b), missing
label define gayadoption_per 1 "Prohibiting religious agencies from participating in the foster care system unless they allow children to be placed with same-sex couples DOES NOT VIOLATE agencies' First Amendment rights to religious freedom" 2 "Prohibiting religious agencies from participating in the foster care system unless they allow children to be placed with same-sex couples DOES VIOLATE agencies' First Amendment rights to religious freedom"
label values gayadoption_per gayadoption_per

egen gayadoption_court = rowtotal (q2a q2b), missing
label define gayadoption_court 1 "Prohibiting religious agencies from participating in the foster care system unless they allow children to be placed with same-sex couples DOES NOT VIOLATE agencies' First Amendment rights to religious freedom" 2 "Prohibiting religious agencies from participating in the foster care system unless they allow children to be placed with same-sex couples DOES VIOLATE agencies' First Amendment rights to religious freedom"
label values gayadoption_court gayadoption_court

egen acatax_per = rowtotal (q3a q3b), missing
label define acatax_per 1 "The individual mandate provision is not a tax and is UNCONSTITUTIONAL because it  exceeds the federal government's power" 2 "The individual mandate provision is a tax and is CONSTITUTIONAL because it does not exceed the federal government's power"
label values acatax_per aca_per

egen acatax_court = rowtotal (q4a q4b), missing
label define acatax_court 1 "The individual mandate provision is not a tax and is UNCONSTITUTIONAL because it  exceeds the federal government's power" 2 "The individual mandate provision is a tax and is CONSTITUTIONAL because it does not exceed the federal government's power"
label values acatax_court acatax_court

egen acasev_per = rowtotal (q5a q5b), missing
label define acasev_per 1 "If the individual mandate is unconstitutional, then the ENTIRE LAW SHOULD BE STRUCK DOWN" 2 "If the individual mandate is unconstitutional, that should NOT AFFECT THE REST OF THE LAW"
label values acasev_per acasev_per

egen acasev_court = rowtotal (q6a q6b), missing
label define acasev_court 1 "If the individual mandate is unconstitutional, then the ENTIRE LAW SHOULD BE STRUCK DOWN" 2 "If the individual mandate is unconstitutional, that should NOT AFFECT THE REST OF THE LAW"
label values acasev_court acasev_court

egen azprovballot_per = rowtotal (q7a q7b), missing
label define azprovballot_per 1 "Discarding entire ballots from voters who voted outside of their precinct IS UNLAWFUL" 2 "Discarding entire ballots from voters who voted outside of their precinct IS LAWFUL"
label values azprovballot_per azprovballot_per

egen azprovballot_court = rowtotal (q8a q8b), missing
label define azprovballot_court 1 "Discarding entire ballots from voters who voted outside of their precinct IS UNLAWFUL" 2 "Discarding entire ballots from voters who voted outside of their precinct IS LAWFUL"
label values azprovballot_court azprovballot_court

egen azcollectballot_per = rowtotal (q9a q9b), missing
label define azcollectballot_per 1 "Voters SHOULD BE ABLE to rely on another person or third party to collect and drop off ballots" 2 "STATES CAN FORBID voters from relying on another person or third party to collect and drop off ballots"
label values azcollectballot_per azcollectballot_per

egen azcollectballot_court = rowtotal (q10a q10b), missing
label define azcollectballot_court 1 "Voters SHOULD BE ABLE to rely on another person or third party to collect and drop off ballots" 2 "STATES CAN FORBID voters from relying on another person or third party to collect and drop off ballots"
label values azcollectballot_court azcollectballot_court

egen donors_per = rowtotal (q11a q11b), missing
label define donors_per 1 "Requiring nonprofit organizations to report information to the state about their major donors VIOLATES their First Amendment rights" 2 "Requiring nonprofit organizations to report information to the state about their major donors DOES NOT VIOLATE their First Amendment rights"
label values donors_per donors_per

egen donors_court = rowtotal (q12a q12b), missing
label define donors_court 1 "Requiring nonprofit organizations to report information to the state about their major donors VIOLATES their First Amendment rights" 2 "Requiring nonprofit organizations to report information to the state about their major donors DOES NOT VIOLATE their First Amendment rights"
label values donors_court donors_court

egen schoolspeech_per = rowtotal (q13a q13b), missing
label define schoolspeech_per 1 "Public school officials CAN punish students for things they say or write off campus" 2 "Public school officials CANNOT punish students for things they say or write off campus"
label values schoolspeech_per schoolspeech_per

egen schoolspeech_court = rowtotal (q14a q14b), missing
label define schoolspeech_court 1 "Public school officials CAN punish students for things they say or write off campus" 2 "Public school officials CANNOT punish students for things they say or write off campus"
label values schoolspeech_court schoolspeech_court

egen juvcrime_per = rowtotal (q15a q15b), missing
label define juvcrime_per 1 "Juvenile defendants MUST BE FOUND to be incorrigible before being sentenced to a life sentence without parole" 2 "Juvenile defendants NEED NOT BE FOUND to be incorrigible before being sentenced to a life sentence without parole"
label values juvcrime_per juvcrime_per

egen juvcrime_court = rowtotal (q16a q16b), missing
label define juvcrime_court 1 "Juvenile defendants MUST BE FOUND to be incorrigible before being sentenced to a life sentence without parole" 2 "Juvenile defendants NEED NOT BE FOUND to be incorrigible before being sentenced to a life sentence without parole"
label values juvcrime_court juvcrime_court

egen databases_per = rowtotal (q17a q17b), missing
label define databases_per 1 "Using government databases for uses not explicitly authorized SHOULD BE PUNISHED" 2 "Using government databases for uses not explicitly authorized SHOULD NOT BE PUNISHED"
label values databases_per databases_per

egen databases_court = rowtotal (q18a q18b), missing
label define databases_court 1 "Using government databases for uses not explicitly authorized SHOULD BE PUNISHED" 2 "Using government databases for uses not explicitly authorized SHOULD NOT BE PUNISHED"
label values databases_court databases_court

egen ncaa_per = rowtotal (q19a q19b), missing
label define ncaa_per 1 "The NCAA SHOULD BE ABLE TO strictly limit paid compensation to college athletes." 2 "The NCAA SHOULD NOT BE ABLE TO strictly limit paid compensation to college athletes."
label values ncaa_per ncaa_per

egen ncaa_court = rowtotal (q20a q20b), missing
label define ncaa_court 1 "The NCAA SHOULD BE ABLE TO strictly limit paid compensation to college athletes." 2 "The NCAA SHOULD NOT BE ABLE TO strictly limit paid compensation to college athletes."
label values ncaa_court ncaa_court

egen covidchurch_per = rowtotal (q21a q21b), missing
label define covidchurch_per 1 "States CANNOT prohibit in-person religious gatherings because of the First Amendment right to free exercise of religion" 2 "States CAN prohibit in-person religious gatherings despite the First Amendment right to free exercise of religion"
label values covidchurch_per covidchurch_per

egen covidchurch_court = rowtotal (q22a q22b), missing
label define covidchurch_court 1 "States CANNOT prohibit in-person religious gatherings because of the First Amendment right to free exercise of religion" 2 "States CAN prohibit in-person religious gatherings despite the First Amendment right to free exercise of religion"
label values covidchurch_court covidchurch_court

egen unions_per = rowtotal (q23a q23b), missing
label define unions_per 1 "States CAN require that employers allow union representatives to enter a company's private property" 2 "States CANNOT require that employers allow union representatives to enter a company's private property"
label values unions_per unions_per

egen unions_court = rowtotal (q24a q24b), missing
label define unions_court 1 "States CAN require that employers allow union representatives to enter a company's private property" 2 "States CANNOT require that employers allow union representatives to enter a company's private property"
label values unions_court unions_court

egen agencies_per = rowtotal (q41a q41b), missing
label define agencies_per 1 "Limiting the president to only firing agency heads for a specific reason INFRINGES on the president's authority" 2 "Limiting the president to only firing agency heads for a specific reason DOES NOT INFRINGE on the president's authority"
label values agencies_per agencies_per

egen agencies_court = rowtotal (q42a q42b), missing
label define agencies_court 1 "Limiting the president to only firing agency heads for a specific reason INFRINGES on the president's authority" 2 "Limiting the president to only firing agency heads for a specific reason DOES NOT INFRINGE on the president's authority"
label values agencies_court agencies_court

egen warrants_per = rowtotal (q43a q43b), missing
label define warrants_per 1 "Police SHOULD be able to enter someone's house without a warrant if they are in pursuit of them when that person enters their home" 2 "Police SHOULD NOT be able to enter someone's house without a warrant if they are in pursuit of them when that person enters their home"
label values warrants_per warrants_per

egen warrants_court = rowtotal (q44a q44b), missing
label define warrants_court 1 "Police SHOULD be able to enter someone's house without a warrant if they are in pursuit of them when that person enters their home" 2 "Police SHOULD NOT be able to enter someone's house without a warrant if they are in pursuit of them when that person enters their home"
label values warrants_court warrants_court

gen typical_votes = q38
label define typical_votes 1 "9-0" 2 "8-1" 3 "7-2" 4 "6-3" 5 "5-4"
label values typical_votes typical_votes
 
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
label define current_chief 1 "Stephen Breyer" 2 "Samuel Alito" 3 "Elena Kagan" 4 "John Roberts" 5 "Neil Gorsuch"
label values current_chief current_chief

gen current_chief_correct = current_chief==4

gen most_recent = q29
label define most_recent 1 "Sonia Sotomayor" 2 "Neil Gorsuch" 3 "John Roberts" 4 "Brett Kavanaugh" 5 "Amy Coney Barrett"
label values most_recent most_recent

gen most_recent_correct = most_recent==5

gen gop_appt = q39
label define gop_appt 1 "9 out of 9" 2 "8 out of 9" 3 "7 out of 9" 4 "6 out of 9" 5 "5 out of 9" 6 "4 out of 9" 7 "3 out of 9" 8 "2 out of 9" 9 "1 out of 9" 10 "0 out of 9"
label values gop_appt gop_appt

gen gop_appt_correct = gop_appt==4

egen total_correct = rowtotal (justice_selection_correct justice_term_correct last_say_correct current_chief_correct most_recent_correct gop_appt_correct), missing

gen partisan_effect = q40
label define partisan_effect 1 "A great deal" 2 "A lot" 3 "A moderate amount" 4 "A little" 5 "Not at all" 
label values partisan_effect partisan_effect

gen diffuse1 = q30
label var diffuse1 "If the U.S. Supreme Court started making a lot of decisions that most people disagree with"
label define diffuse1 1 "Strongly Agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly Disagree"
label values diffuse1 diffuse1

gen diffuse2 = q31
label var diffuse2 "The U.S. Supreme Court can usually be trusted"
label define diffuse2 1 "Strongly Agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly Disagree"
label values diffuse2 diffuse2

gen diffuse3 = q32
label var diffuse3 "The U.S. Supreme Court gets too mixed up in politics."
label define diffuse3 1 "Strongly Agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly Disagree"
label values diffuse3 diffuse3

gen diffuse4 = q33
label var diffuse4 "Judges on the U.S. Supreme Court who consistently make decisions at odds"
label define diffuse4 1 "Strongly Agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly Disagree"
label values diffuse4 diffuse4

gen diffuse5 = q34
label var diffuse5 "The U.S. Supreme Court has become too independent"
label define diffuse5 1 "Strongly Agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly Disagree"
label values diffuse5 diffuse5

gen ideology_personal = q35

gen ideology_court = q36


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


label define pid3 1 "Democrat" 2 "Republican" 3 "Independent" 4 "Other" 5 "Not sure"
label values pid3 pid3 

gen pid3_recoded = pid3 
recode pid3_recoded (4=3) (5=3)
label define pid3_recoded 1 "Democrat" 2 "Republican" 3 "Independent/Other"
label values pid3_recoded pid3_recoded

label define pid7 1 "Strong Democrat" 2 "Not very strong Democrat" 3 "Lean Democrat" 4 "Independent" 5 "Lean Republican" 6 "Not very strong Republican" 7 "Strong Republican" 8 "Not sure" 
label values pid7 pid7 

label define turnout20post 1 "Yes" 2 "No"
label values turnout20post turnout20post

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

save supremecourtdata2021_cleaned, replace
