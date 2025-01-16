******
** Code to Clean Raw Survey Data from 2022 survey wave
** Author: Neil Malhotra
** Last updated: April 11, 2022
******


cd "C:\Users\neilm\Dropbox\supremecourt\survey data cleaning code\raw survey data"
import delimited using scotus-survey-april-6-2022-variablecodesvaluescodes.csv, clear
set more off


// Opinions on Cases and Prediction of Court Decisions


egen abortion_per = rowtotal (q1a q1b), missing
label define abortion_per 1 "Banning nearly all abortions after 15 weeks of pregnancy is unconstitutional" 2 "Banning nearly all abortions after 15 weeks of pregnancy is constitutional"
label values abortion_per abortion_per

egen abortion_court = rowtotal (q2a q2b), missing
label define abortion_court 1 "Banning nearly all abortions after 15 weeks of pregnancy is unconstitutional" 2 "Banning nearly all abortions after 15 weeks of pregnancy is constitutional"
label values abortion_court abortion_court

egen roe_per = rowtotal (q3), missing
label define roe_per 1 "Yes, Roe v. Wade should be overturned" 2 "No, Roe v. Wade should NOT be overturned"
label values roe_per roe_per

egen roe_court = rowtotal (q4), missing
label define roe_court 1 "Yes, Roe v. Wade should be overturned" 2 "No, Roe v. Wade should NOT be overturned"
label values roe_court roe_court

egen guncontrol_per = rowtotal (q5a q5b), missing
label define guncontrol_per 1 "New York requiring a person to show a need for self-protection to receive a license to carry a concealed firearm outside the home violates people's Second Amendment rights" 2 "New York requiring a person to show a need for self-protection to receive a license to carry a concealed firearm outside the home does NOT violate people's Second Amendment rights"
label values guncontrol_per guncontrol_per

egen guncontrol_court = rowtotal (q6a q6b), missing
label define guncontrol_court 1 "New York requiring a person to show a need for self-protection to receive a license to carry a concealed firearm outside the home violates people's Second Amendment rights" 2 "New York requiring a person to show a need for self-protection to receive a license to carry a concealed firearm outside the home does NOT violate people's Second Amendment rights"
label values guncontrol_court guncontrol_court

egen schoolchoice_per = rowtotal (q7a q7b), missing
label define schoolchoice_per 1 "Maine prohibiting state funds from being used at religious schools is a violation of the First Amendment protections of the free exercise of religion" 2 "Maine prohibiting state funds from being used at religious schools is a valid policy to maintain the separation between church and state"
label values schoolchoice_per schoolchoice_per

egen schoolchoice_court = rowtotal (q8a q8b), missing
label define schoolchoice_court 1 "Maine prohibiting state funds from being used at religious schools is a violation of the First Amendment protections of the free exercise of religion" 2 "Maine prohibiting state funds from being used at religious schools is a valid policy to maintain the separation between church and state"
label values schoolchoice_court schoolchoice_court

egen terrorism_per = rowtotal (q9a q9b), missing
label define terrorism_per 1 "The government has a right to protect state secrets in the name of national security and is not compelled to provide evidence" 2 "The government must provide evidence in such situations"
label values terrorism_per terrorism_per

egen terrorism_court = rowtotal (q10a q10b), missing
label define terrorism_court 1 "The government has a right to protect state secrets in the name of national security and is not compelled to provide evidence" 2 "The government must provide evidence in such situations"
label values terrorism_court terrorism_court

egen freespeech_per = rowtotal (q11a q11b), missing
label define freespeech_per 1 "An elected body censuring the speech of an elected member violates the First Amendment" 2 "An elected body censuring the speech of an elected member does NOT violate the First Amendment"
label values freespeech_per freespeech_per

egen freespeech_court = rowtotal (q12a q12b), missing
label define freespeech_court 1 "An elected body censuring the speech of an elected member violates the First Amendment" 2 "An elected body censuring the speech of an elected member does NOT violate the First Amendment"
label values freespeech_court freespeech_court

egen clergy_per = rowtotal (q13a q13b), missing
label define clergy_per 1 "Barring religious clergy from entering the execution chamber and touching death row inmates violates the First Amendment protections of the free exercise of religion" 2 "Barring religious clergy from entering the execution chamber and touching death row inmates does NOT violate the First Amendment protections of the free exercise of religion"
label values clergy_per clergy_per

egen clergy_court = rowtotal (q14a q14b), missing
label define clergy_court 1 "Barring religious clergy from entering the execution chamber and touching death row inmates violates the First Amendment protections of the free exercise of religion" 2 "Barring religious clergy from entering the execution chamber and touching death row inmates does NOT violate the First Amendment protections of the free exercise of religion"
label values clergy_court clergy_court

egen flag_per = rowtotal (q15a q15b), missing
label define flag_per 1 "Boston's refusal to fly a private religious organization's flag violated the organization's First Amendment rights" 2 "Boston's refusal to fly a private religious organization's flag did NOT violate the organization's First Amendment rights"
label values flag_per flag_per

egen flag_court = rowtotal (q16a q16b), missing
label define flag_court 1 "Boston's refusal to fly a private religious organization's flag violated the organization's First Amendment rights" 2 "Boston's refusal to fly a private religious organization's flag did NOT violate the organization's First Amendment rights"
label values flag_court flag_court

egen smallbizvax_per = rowtotal (q17a q17b), missing
label define smallbizvax_per 1 "OSHA's vaccination or testing mandate is NOT lawful" 2 "OSHA's vaccination or testing mandate is lawful"
label values smallbizvax_per smallbizvax_per

egen smallbizvax_court = rowtotal (q18a q18b), missing
label define smallbizvax_court 1 "OSHA's vaccination or testing mandate is NOT lawful" 2 "OSHA's vaccination or testing mandate is lawful"
label values smallbizvax_court smallbizvax_court

egen healthcarevax_per = rowtotal (q19a q19b), missing
label define healthcarevax_per 1 "HHS's vaccination mandate is NOT lawful" 2 "HHS's vaccination mandate is lawful"
label values healthcarevax_per healthcarevax_per

egen healthcarevax_court = rowtotal (q20a q20b), missing
label define healthcarevax_court 1 "HHS's vaccination mandate is NOT lawful" 2 "HHS's vaccination mandate is lawful"
label values healthcarevax_court healthcarevax_court

egen epa_per = rowtotal (q23a q23b), missing
label define epa_per 1 "The EPA can set emissions limits on individual power plants and CAN also more broadly regulate emissions across the entire energy sector" 2 "The EPA can set limits on individual power plants but CANNOT more broadly regulate emissions across the entire energy sector"
label values epa_per epa_per

egen epa_court = rowtotal (q24a q24b), missing
label define epa_court 1 "The EPA can set emissions limits on individual power plants and CAN also more broadly regulate emissions across the entire energy sector" 2 "The EPA can set limits on individual power plants but CANNOT more broadly regulate emissions across the entire energy sector"
label values epa_court epa_court

egen execpriv_per = rowtotal (q25a q25b), missing
label define execpriv_per 1 "A former president CAN block the release of White House records" 2 "A former president CANNOT block the release of White House records"
label values execpriv_per execpriv_per

egen execpriv_court = rowtotal (q26a q26b), missing
label define execpriv_court 1 "A former president CAN block the release of White House records" 2 "A former president CANNOT block the release of White House records"
label values execpriv_court execpriv_court

egen schoolprayer_per = rowtotal (q27a q27b), missing
label define schoolprayer_per 1 "The school district was right to suspend the coach" 2 "The school district was NOT right to suspend the coach"
label values schoolprayer_per schoolprayer_per

egen schoolprayer_court = rowtotal (q28a q28b), missing
label define schoolprayer_court 1 "The school district was right to suspend the coach" 2 "The school district was NOT right to suspend the coach"
label values schoolprayer_court schoolprayer_court

egen immigration_per = rowtotal (q29a q29b), missing
label define immigration_per 1 "The Biden Administration should be able to end the remain in Mexico program" 2 "The Biden Administration should NOT be able to end the remain in Mexico program"
label values immigration_per immigration_per

egen immigration_court = rowtotal (q30a q30b), missing
label define immigration_court 1 "The Biden Administration should be able to end the remain in Mexico program" 2 "The Biden Administration should NOT be able to end the remain in Mexico program"
label values immigration_court immigration_court

egen nativeamer_per = rowtotal (q31a q31b), missing
label define nativeamer_per 1 "States should NOT be able to prosecute non-Native Americans who commit crimes against Native Americans on Native American land" 2 "States should be able to prosecute non-Native Americans who commit crimes against Native Americans on Native American land"
label values nativeamer_per nativeamer_per

egen nativeamer_court = rowtotal (q32a q32b), missing
label define nativeamer_court 1 "States should NOT be able to prosecute non-Native Americans who commit crimes against Native Americans on Native American land" 2 "States should be able to prosecute non-Native Americans who commit crimes against Native Americans on Native American land"
label values nativeamer_court nativeamer_court

// Supreme Court Knowledge 
 
gen justice_selection = q36
label define justice_selection 1 "Elected to the bench" 2 "Appointed to the bench" 3 "Neither"
label values justice_selection justice_selection

gen justice_selection_correct = justice_selection==2

gen justice_term = q34
label define justice_term 1 "Set number of years" 2 "Life term" 3 "Neither"
label values justice_term justice_term

gen justice_term_correct = justice_term==2

gen last_say = q35
label define last_say 1 "U.S. Congress" 2 "U.S. Supreme Court" 3 "The President"
label values last_say last_say

gen last_say_correct = last_say==2

gen current_chief = q37
label define current_chief 1 "Stephen Breyer" 2 "Samuel Alito" 3 "Elena Kagan" 4 "John Roberts" 5 "Neil Gorsuch"
label values current_chief current_chief

gen current_chief_correct = current_chief==4

gen most_recent = q38
label define most_recent 1 "Sonia Sotomayor" 2 "Neil Gorsuch" 3 "John Roberts" 4 "Brett Kavanaugh" 5 "Amy Coney Barrett"
label values most_recent most_recent

gen most_recent_correct = most_recent==5

gen gop_appt = q39
label define gop_appt 10 "9 out of 9" 8 "8 out of 9" 7 "7 out of 9" 6 "6 out of 9" 5 "5 out of 9" 4 "4 out of 9" 3 "3 out of 9" 2 "2 out of 9" 1 "1 out of 9" 10 "0 out of 9"
label values gop_appt gop_appt

gen gop_appt_correct = gop_appt==6

egen total_correct = rowtotal (justice_selection_correct justice_term_correct last_say_correct current_chief_correct most_recent_correct gop_appt_correct), missing


// Perceptions of Court Partisanship

gen typical_votes = q33
label define typical_votes 5 "9-0" 4 "8-1" 3 "7-2" 2 "6-3" 1 "5-4"
label values typical_votes typical_votes

gen partisan_effect = q40
label define partisan_effect 1 "A great deal" 2 "A lot" 3 "A moderate amount" 4 "A little" 5 "Not at all" 
label values partisan_effect partisan_effect


// Court Approval

gen approval = q41
label define approval 1 "Strongly Approve" 2 "Somewhat Approve" 3 "Neither Approve nor Disapprove" 4 "Somewhat Disapprove" 5 "Strongly Disapprove"
label values approval approval

// Overall Court Assessments


gen diffuse2 = q46
label var diffuse2 "The U.S. Supreme Court can usually be trusted"
label define diffuse2 1 "Strongly Agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly Disagree"
label values diffuse2 diffuse2

gen diffuse3 = q45
label var diffuse3 "The U.S. Supreme Court gets too mixed up in politics."
label define diffuse3 1 "Strongly Agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly Disagree"
label values diffuse3 diffuse3

// Countermajoritarianism


gen diffuse1 = q44
label var diffuse1 "If the U.S. Supreme Court started making a lot of decisions that most people disagree with"
label define diffuse1 1 "Strongly Agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly Disagree"
label values diffuse1 diffuse1

gen diffuse4 = q42
label var diffuse4 "Judges on the U.S. Supreme Court who consistently make decisions at odds"
label define diffuse4 1 "Strongly Agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly Disagree"
label values diffuse4 diffuse4

gen diffuse5 = q43
label var diffuse5 "The U.S. Supreme Court has become too independent"
label define diffuse5 1 "Strongly Agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly Disagree"
label values diffuse5 diffuse5

// Self-Ideological Placement and Court-Ideological Placement

gen ideology_personal = q47

gen ideology_court = q48


// Court Reforms

gen courtexpand = q49
label define courtexpand 1 "Strongly Agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly Disagree"
label values courtexpand courtexpand

gen courttermlimits = q50
label define courttermlimits 1 "Strongly Agree" 2 "Agree" 3 "Neither Agree nor Disagree" 4 "Disagree" 5 "Strongly Disagree"
label values courttermlimits courttermlimits

// Extra Questions

gen browneffect = q51
label define browneffect 1 "Closer to my views" 2 "Further from my views" 3 "Make no difference"
label values browneffect browneffect

gen senateconsider = q52
label define senateconsider 1 "The Senate should give serious consideration" 2 "It is appropriate for the Senate"
label values senateconsider senateconsider

gen brownconfirm = q53
label define brownconfirm 1 "Judge Jackson should be confirmed" 2 "Judge Jackson should not be confirmed"
label values brownconfirm brownconfirm

gen shadowdocket = q54
label define shadowdocket 1 "These rules are an appropriate" 2 "The Court should give all cases"
label values shadowdocket  shadowdocket 


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

save "C:\Users\neilm\Dropbox\supremecourt\survey data cleaning code\cleaned survey data\supremecourtsurveydata2022_cleaned.dta", replace





svyset [pweight=weight]

// Recode so that 1 is always conservative positions

recode abortion_per (1=2) (2=1)
recode epa_per (1=2) (2=1)
recode schoolprayer_per (1=2) (2=1)
recode immigration_per (1=2) (2=1)
recode nativeamer_per (1=2) (2=1)


foreach var of varlist abortion_per roe_per guncontrol_per schoolchoice_per terrorism_per freespeech_per clergy_per flag_per smallbizvax_per healthcarevax_per epa_per execpriv_per schoolprayer_per immigration_per nativeamer_per {
svy: tab `var' pid3_recoded, col
}









