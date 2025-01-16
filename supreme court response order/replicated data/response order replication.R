library(rio)
library(estimatr)
library(ggplot2)
library(ggeffects)

# loading survey data
FULLMERGE <- import("fullmerge.dta")

# loading case metadata
CASEDATA <- import("casemetadata.dta")
CASEDATA$casename[CASEDATA$casename=="abortion_per" & CASEDATA$wave==4] <- "abortion_per2"

# merging datasets
DAT <- merge(FULLMERGE, CASEDATA, by="cid")
DAT$respid <- as.factor(DAT$resp)
DAT$cid <- as.factor(DAT$cid)
DAT$wave <- as.factor(DAT$wave.x)
DAT <- subset(DAT, wave!=1 & personal==1 & cid!=75)

# generating knowledge variable (proportion of items correct)
DAT$knowledge <- ifelse(DAT$wave==1, 
                        DAT$total_correct/3, # note only 3 items in first wave
                        DAT$total_correct/6) # 6 items in subsequent waves

# generating question-specific language variables
DAT$words <- rowMeans(cbind(DAT$wordsa,DAT$wordsb), na.rm=TRUE)
DAT$logwords <- log(DAT$words)
DAT$verbs <- rowMeans(cbind(DAT$verbsaub,DAT$verbsbub), na.rm=TRUE)
DAT$sentences <- rowMeans(cbind(DAT$sentencesa, DAT$sentencesb), na.rm=TRUE)
DAT$verbs.persent <- DAT$verbs /DAT$sentences
DAT$subclause <- rowMeans(cbind(DAT$subclausea,DAT$subclauseb), na.rm=TRUE)
DAT$subclause.persent <- DAT$subclause / DAT$sentences
DAT$complexwords <- rowMeans(cbind(DAT$complexwordsa,DAT$complexwordsb), na.rm=TRUE)
DAT$complexwords.persent <- DAT$complexwords / DAT$sentences
DAT$fkscore <- rowMeans(cbind(DAT$fkscorea,DAT$fkscoreb), na.rm=TRUE)
DAT$fkgrade <- rowMeans(cbind(DAT$fkgradea,DAT$fkgradeb), na.rm=TRUE)
DAT$fogindex <- rowMeans(cbind(DAT$fogindexa,DAT$fogindexb), na.rm=TRUE)

# number of characters (including spaces)
DAT$characters <- rowMeans(cbind(DAT$chara, DAT$charb))

# creating reverse-coded case2 var
# so 1 is option that was listed on top in form A
DAT$case2 <- DAT$case - 1

# creating 0 to 1 control variables
DAT$age01 <- (DAT$age4 - 1)/3
DAT$educ01 <- (DAT$educ-1)/5
DAT$pid01 <- (DAT$pid7-1)/6
DAT$pid01[DAT$pid01>1] <- NA

# creating standardized control variables for big regression
# age
DAT$age.std <- scale(DAT$age4)
# race (converting to 4 point first
# 1=white, 2=black, 3=hispanic, 4= other)
DAT$white <- DAT$race==1
DAT$white.std <- scale(DAT$white)
# gender
DAT$male.std <- scale(DAT$gender==1)
# educ
DAT$educ.std <- scale(DAT$educ)
# pid
DAT$pid.std <- scale(ifelse(DAT$pid7==8, 4, DAT$pid7))
# fkscore
DAT$fkscore.std <- scale(DAT$fkscore)
# nytfront
DAT$nytfront.std <- scale(DAT$nytfront)
# godgaysguns
DAT$godgaysguns.std <- scale(DAT$godgaysguns)



### CREATING QUESTION COMPLEXITY INDEX
# as first principal component of: fkscore, verbs per sentence,
#                                  complex words per sentence, subclauses per sentence
# pca.complexity <- princomp(~ scale(fkscore) + scale(verbs.persent) + 
#                              scale(complexwords.persent) + scale(subclause.persent),
#                            data=DAT)
# DAT$complexity <- pca.complexity$scores[,1]

#############
#############
## TABLE 1 ##
#############
#############

## T1 Model 1: Regressing response on form A dummy (and wave FEs)

reg.bivar <- lm_robust(case2 ~ forma + as.factor(wave),
                       data=DAT, weights=weight,
                       clusters=respid, se_type="stata")
summary(reg.bivar)

# ## T1 Model 2: interacting `forma` with `words` (with wave FEs)
# 
# reg.iwords <- lm_robust(case2 ~ forma*words + forma*fkscore + as.factor(wave),
#                         data=DAT, weights=weight,
#                         clusters=respid, se_type="stata")
# summary(reg.iwords)
# 
# ## Figure 1
# pdf("Figure1.pdf",
#      height=4, width=4)
# pred.iwords <- ggpredict(reg.iwords, terms=c("words", "forma"))
# plot(pred.iwords, limits=c(.3, .6), colors="bw") + 
#   labs(
#     x = "words",
#     y = "Prob(Selecting First Choice in Form A)",
#     title = NULL
#   ) +
#   scale_linetype_discrete(
#     guide = guide_legend(reverse = TRUE),
#     name = "Form", 
#     labels=c("B", "A")
#     )
# dev.off()

## T1 Model 3: interacting `forma` with `knowledge` (with wave FEs)
reg.iknowledge <- lm_robust(case2 ~ forma*knowledge + forma*educ + as.factor(wave),
                            data=DAT, weights=weight,
                            clusters=respid, se_type="stata")
summary(reg.iknowledge)

# Figure 2: primacy effects by knowledge
pdf("Figure2.pdf",
    height=4, width=4)
pred.iknowledge <- ggpredict(reg.iknowledge, terms=c("knowledge", "forma"))
plot(pred.iknowledge, limits=c(.3, .6), colors="bw") + 
  labs(
    x = "knowledge",
    y = "Prob(Selecting First Choice in Form A)",
    title = NULL
  ) +
  scale_linetype_discrete(
    guide = guide_legend(reverse = TRUE),
    name = "Form", 
    labels=c("B", "A")
  ) #+
  #geom_rug(sides="b")
dev.off()

## T1 Model 4: Interacting with court knowledge (including wave FEs)
reg.knowinteract <- lm_robust(case2 ~ forma*words*knowledge + as.factor(wave),
                              data=subset(DAT, wave!=1 & personal==1),
                              weights=weight,
                              clusters=respid, se_type="stata")
summary(reg.knowinteract)


# figure 3: primacy effects by knowledge separated by words
# predictions holding words at min, mean, max and varying words
pred.knowinteract.words <- ggpredict(reg.knowinteract, 
                                    terms=c("knowledge", "forma", "words[53, 99, 131]"))

# Plots holding holding words at min, mean, max and varying words
pdf("Figure3.pdf",
    height=5*.7, width=10*.7)
plot(pred.knowinteract.words, 
     limits=c(.3, .6), colors="bw") + 
  labs(
    x = "knowledge",
    y = "Prob(Selecting First Choice in Form A)",
    title = NULL
  ) +
  scale_linetype_discrete(
    guide = guide_legend(reverse = TRUE),
    name = "Form", 
    labels=c("B", "A")
  ) #+
  #geom_rug(sides="b")
dev.off()


## calculating maximal effect estimate basted on Model 4
## setting words to max(words)=131 and knowledge to min(knowledge)=0
coef(reg.knowinteract)['forma'] + 
  coef(reg.knowinteract)['forma:words']*131 + 
  coef(reg.knowinteract)['forma:knowledge']*0 + 
  coef(reg.knowinteract)['forma:words:knowledge']*131*0

##############################
## TABLE 2                  ##
## LOGIT VERSIONS OF MODELS ##
## FROM TABLE 1             ##
##############################
# with clustered SEs (HC0)
# load libraries
library(sandwich)
library(lmtest)
library(pscl)

# T2 Model 1: just form
logit.bivar <- glm(case2 ~ forma + as.factor(wave),
                   weights=weight,
                   data=DAT, family=binomial(link="logit"))
#summary(logit.bivar)
coeftest(logit.bivar, vcov. = vcovCL(logit.bivar, cluster=DAT$respid, type="HC0"))

# T2 Model 2: question characteristics
logit.iwords <- glm(case2 ~ forma*words + forma*fkscore + as.factor(wave),
                        weights=weight,
                    data=DAT, family=binomial(link="logit"))
#summary(logit.iwords)
coeftest(logit.iwords, vcov. = vcovCL(logit.iwords, cluster=DAT$respid, type="HC0"))

## T2 Model 3: respondent characteristics
logit.iknowledge <- glm(case2 ~ forma*knowledge + forma*educ + as.factor(wave),
                        weights=weight,
                        data=DAT, family=binomial(link="logit"))
#summary(logit.iknowledge)
coeftest(logit.iknowledge, vcov. = vcovCL(logit.iknowledge, cluster=DAT$respid, type="HC0"))

## T2 Model 4: question and respondent characteristics
logit.knowinteract <- glm(case2 ~ forma*words*knowledge + as.factor(wave),
                          weights=weight,
                          data=DAT, family=binomial(link="logit"))
#summary(logit.knowinteract)
coeftest(logit.knowinteract, vcov. = vcovCL(logit.knowinteract, cluster=DAT$respid, type="HC0"))


#################################
#################################
## APPENDIX TABLES AND FIGURES ##
#################################
#################################

## Figure A1
## USING LOGGED WORDS INSTEAD OF WORDS
## Replicating some T1 results using logged words instead of words
reg.ilogwords <- lm_robust(case2 ~ forma*logwords + forma*fkscore + as.factor(wave),
                           data=DAT, weights=weight,
                           clusters=respid, se_type="stata")
summary(reg.ilogwords)
# fig A1: replicating T1 Model 2 using logged words
pdf("FigureA1.pdf",
    height=4, width=4)
pred.ilogwords <- ggpredict(reg.ilogwords, terms=c("logwords", "forma"))
plot(pred.ilogwords, limits=c(.3, .6), colors="bw") + 
  labs(
    x = "log(words)",
    y = "Prob(Selecting First Choice in Form A)",
    title = NULL
  ) +
  scale_linetype_discrete(
    guide = guide_legend(reverse = TRUE),
    name = "Form", 
    labels=c("B", "A")
  )
dev.off()

## replicating T1 Model 4 with logged words instead of words
reg.knowinteract.logwords <- lm_robust(case2 ~ forma*logwords*knowledge + as.factor(wave),
                                       data=subset(DAT, wave!=1 & personal==1),
                                       weights=weight,
                                       clusters=respid, se_type="stata")
summary(reg.knowinteract.logwords)

# figure A2: primacy effects by knowledge separated by logged words
# predictions holding characters at min, mean, max and varying logged words
pred.knowinteract.logwords <- ggpredict(reg.knowinteract.logwords, 
                                        terms=c("knowledge", "forma", "logwords[3.850148, 4.564937, 4.875197]"))

# Plots holding holding words at min, mean, max and varying logged words
pdf("FigureA2.pdf",
    height=5*.7, width=10*.7)
plot(pred.knowinteract.logwords, 
     limits=c(.3, .61), colors="bw") + 
  labs(
    x = "knowledge",
    y = "Prob(Selecting First Choice in Form A)",
    title = NULL
  ) +
  scale_linetype_discrete(
    guide = guide_legend(reverse = TRUE),
    name = "Form", 
    labels=c("B", "A")
  ) #+
#geom_rug(sides="b")
dev.off()


##########
## Regression models using characters instead of words
##########
## Replicating some T1 results using characters instead of words
reg.ichar <- lm_robust(case2 ~ forma*characters + forma*fkscore + as.factor(wave),
                       data=DAT, weights=weight,
                       clusters=respid, se_type="stata")
summary(reg.ichar)

# fig A3: replicating T1 Model 2 using characters
pdf("FigureA3.pdf",
    height=4, width=4)
pred.ichar <- ggpredict(reg.ichar, terms=c("characters", "forma"))
plot(pred.ichar, limits=c(.3, .6), colors="bw") + 
  labs(
    x = "characters",
    y = "Prob(Selecting First Choice in Form A)",
    title = NULL
  ) +
  scale_linetype_discrete(
    guide = guide_legend(reverse = TRUE),
    name = "Form", 
    labels=c("B", "A")
  )
dev.off()

## replicating T1 Model 4 with characters instead of words
reg.knowinteract.char <- lm_robust(case2 ~ forma*characters*knowledge + as.factor(wave),
                                   data=subset(DAT, wave!=1 & personal==1),
                                   weights=weight,
                                   clusters=respid, se_type="stata")
summary(reg.knowinteract.char)
# figure A4: primacy effects by knowledge separated by characters
# predictions holding characters at min, mean, max and varying words
pred.knowinteract.characters <- ggpredict(reg.knowinteract.char, 
                                          terms=c("knowledge", "forma", "characters[305, 624, 896]"))

# Plots holding holding words at min, mean, max and varying words
pdf("FigureA4.pdf",
    height=5*.7, width=10*.7)
plot(pred.knowinteract.characters, 
     limits=c(.3, .61), colors="bw") + 
  labs(
    x = "knowledge",
    y = "Prob(Selecting First Choice in Form A)",
    title = NULL
  ) +
  scale_linetype_discrete(
    guide = guide_legend(reverse = TRUE),
    name = "Form", 
    labels=c("B", "A")
  ) #+
#geom_rug(sides="b")
dev.off()


## Figures of logit model predictions
## Figure A5
pdf("FigureA5.pdf",
    height=4, width=4)
pred.logit.iwords <- ggpredict(logit.iwords, terms=c("words", "forma"))
plot(pred.logit.iwords, limits=c(.3, .6), colors="bw") + 
  labs(
    x = "words",
    y = "Prob(Selecting First Choice in Form A)",
    title = NULL
  ) +
  scale_linetype_discrete(
    guide = guide_legend(reverse = TRUE),
    name = "Form", 
    labels=c("B", "A")
  )
dev.off()


## Figure A6
pdf("FigureA6.pdf",
    height=4, width=4)
pred.logit.iknowledge <- ggpredict(logit.iknowledge, terms=c("knowledge", "forma"))
plot(pred.logit.iknowledge, limits=c(.3, .6), colors="bw") + 
  labs(
    x = "knowledge",
    y = "Prob(Selecting First Choice in Form A)",
    title = NULL
  ) +
  scale_linetype_discrete(
    guide = guide_legend(reverse = TRUE),
    name = "Form", 
    labels=c("B", "A")
  ) #+
#geom_rug(sides="b")
dev.off()

# Figure A7: primacy effects by knowledge separated by words
# predictions holding words at min, mean, max and varying words
pred.logit.knowinteract.words <- ggpredict(logit.knowinteract, 
                                     terms=c("knowledge", "forma", "words[53, 99, 131]"))
# Plots holding holding words at min, mean, max and varying words
pdf("FigureA7.pdf",
    height=5*.7, width=10*.7)
plot(pred.logit.knowinteract.words, 
     limits=c(.3, .6), colors="bw") + 
  labs(
    x = "knowledge",
    y = "Prob(Selecting First Choice in Form A)",
    title = NULL
  ) +
  scale_linetype_discrete(
    guide = guide_legend(reverse = TRUE),
    name = "Form", 
    labels=c("B", "A")
  ) #+
#geom_rug(sides="b")
dev.off()


## Figure A8
## SIMPLE LOESS SMOOTHS OF RELATIONSHIPS
pdf("FigureA8.pdf",
height=5, width=5)
plot(DAT$case2 ~ DAT$words, ylim=c(.3,.6), bty="n",
     xlab="Words", ylab="Prob(First choice in Form A)")
lines(loess.smooth(DAT$words[DAT$forma==1], DAT$case2[DAT$forma==1]), lwd=2, lty=2)
lines(loess.smooth(DAT$words[DAT$forma==0], DAT$case2[DAT$forma==0]), lwd=2)
legend('bottomright', c("Form A", "Form B"), lwd=2, lty=2:1)
dev.off()

## Figure A9
pdf("FigureA9.pdf",
    height=5, width=5)
plot(DAT$case2 ~ DAT$knowledge, ylim=c(.3,.6), bty="n", bty="n",
     xlab="Knowledge", ylab="Prob(First choice in Form A)")
lines(loess.smooth(DAT$knowledge[DAT$forma==1], DAT$case2[DAT$forma==1]), lwd=2, lty=2)
lines(loess.smooth(DAT$knowledge[DAT$forma==0], DAT$case2[DAT$forma==0]), lwd=2)
legend('bottomright', c("Form A", "Form B"), lwd=2, lty=2:1)
dev.off()

# creating trichotomized words variable
DAT$words.tri <- ifelse(DAT$words < sort(DAT$words)[floor(length(DAT$words)/3)], 1,
                        ifelse(DAT$words > sort(DAT$words)[ceiling(length(DAT$words)*2/3)], 3, 2))
# creating trichotomized knowledge variable
DAT$knowledge.tri <- ifelse(DAT$knowledge < sort(DAT$knowledge)[floor(length(DAT$knowledge)/3)], 1,
                        ifelse(DAT$knowledge > sort(DAT$knowledge)[ceiling(length(DAT$knowledge)*2/3)], 3, 2))

## Figure A10
pdf("FigureA10.pdf",
    height=3.5, width=10)
par(mfrow=c(1,3))
plot(999, xlim=c(0,1), ylim=c(.3,.6), bty="n",
     xlab="Knowlege", ylab="Prob(First choice in Form A)", main="Short Questions")
lines(loess.smooth(DAT$knowledge[DAT$forma==1 & DAT$words.tri==1], 
                   DAT$case2[DAT$forma==1 & DAT$words.tri==1]), 
      lwd=2, lty=2)
lines(loess.smooth(DAT$knowledge[DAT$forma==0 & DAT$words.tri==1], 
                   DAT$case2[DAT$forma==0 & DAT$words.tri==1]), 
      lwd=2)
#
plot(999, xlim=c(0,1), ylim=c(.3,.6), bty="n",
     xlab="Knowledge", ylab="Prob(First choice in Form A)", main="Medium Questions")
lines(loess.smooth(DAT$knowledge[DAT$forma==1 & DAT$words.tri==2], 
                   DAT$case2[DAT$forma==1 & DAT$words.tri==2]), 
      lwd=2, lty=2)
lines(loess.smooth(DAT$knowledge[DAT$forma==0 & DAT$words.tri==2], 
                   DAT$case2[DAT$forma==0 & DAT$words.tri==2]), 
      lwd=2)
#
plot(999, xlim=c(0,1), ylim=c(.3,.6), bty="n",
     xlab="Knowledge", ylab="Prob(First choice in Form A)", main="Long Questions")
lines(loess.smooth(DAT$knowledge[DAT$forma==1 & DAT$words.tri==3], 
                   DAT$case2[DAT$forma==1 & DAT$words.tri==3]), 
      lwd=2, lty=2)
lines(loess.smooth(DAT$knowledge[DAT$forma==0 & DAT$words.tri==3], 
                   DAT$case2[DAT$forma==0 & DAT$words.tri==3]), 
      lwd=2)
legend('bottomright', c("Form A", "Form B"), lwd=2, lty=2:1)
dev.off()


## Table A2
## CORRELATION MATRIX BETWEEN ALL RHS VARS
attach(DAT)
RHS.COR <- 
  cor(cbind(words, fkscore, knowledge, educ,
            gender, white.std, age.std, pid.std, 
            nytfront.std, godgaysguns.std, forma), 
      use="p")
colnames(RHS.COR)[6:10] <- c("white.std", "age.std", "pid.std", 
                             "nytfront.std", "godgaysguns.std")
rownames(RHS.COR)[6:10] <- c("white.std", "age.std", "pid.std", 
                             "nytfront.std", "godgaysguns.std")
detach(DAT)
# Table A2:
round(RHS.COR, 2)


##############
##############
## Table A4 ##
## Re-doing Table 1 Model 2: interacting `forma` with `words` (with wave FEs)
## but here using PCA COMPLEXITY MEASURE instead of FKscore
reg.iwords.complexity <- lm_robust(case2 ~ forma*words + forma*complexity + as.factor(wave),
                                   data=DAT, weights=weight,
                                   clusters=respid, se_type="stata")
summary(reg.iwords.complexity)


##############
##############
## TABLE A5 ##
## replicating Table 1, adding control variables
## Table A5 Model 1: Regressing response on form A dummy (and wave FEs)
## with control variables
reg.bivar.controls <- lm_robust(case2 ~ forma + as.factor(wave) +
                                  age.std + white.std +
                                  male.std + pid.std +
                                  nytfront.std + godgaysguns.std,
                                data=DAT, weights=weight,
                                clusters=respid, se_type="stata")
summary(reg.bivar.controls)

## Table A5 Model 2: interacting `forma` with `words` (with wave FEs)
## with control variables
reg.iwords.controls <- lm_robust(case2 ~ forma*words + forma*fkscore + as.factor(wave) +
                                   age.std + white.std +
                                   male.std + pid.std +
                                   nytfront.std + godgaysguns.std,
                                 data=DAT, weights=weight,
                                 clusters=respid, se_type="stata")
summary(reg.iwords.controls)

## Table A5 Model 3: interacting `forma` with `knowledge` (with wave FEs)
## with controls
reg.iknowledge.controls <- lm_robust(case2 ~ forma*knowledge + forma*educ + as.factor(wave) +
                                       age.std + white.std +
                                       male.std + pid.std +
                                       nytfront.std + godgaysguns.std,
                                     data=DAT, weights=weight,
                                     clusters=respid, se_type="stata")
summary(reg.iknowledge.controls)


## Table A5 Model 4: Interacting with court knowledge (including wave FEs)
## with controls
reg.knowinteract.controls <- lm_robust(case2 ~ forma*words*knowledge + as.factor(wave) +
                                         age.std + white.std +
                                         male.std + pid.std +
                                         nytfront.std + godgaysguns.std,
                                       data=subset(DAT, wave!=1 & personal==1),
                                       weights=weight,
                                       clusters=respid, se_type="stata")
summary(reg.knowinteract.controls)


##############
##############
## TABLE A6 ##
## replicating Table 1, adding control variables
## Table A6 Model 1: Regressing response on form A dummy (and wave FEs)
## with control variables AND INTERACTIONS b/t controls and forma
reg.bivar.icontrols <- lm_robust(case2 ~ forma + as.factor(wave) +
                                   age.std*forma + white.std*forma +
                                   male.std*forma + pid.std*forma +
                                   nytfront.std*forma + godgaysguns.std*forma,
                                 data=DAT, weights=weight,
                                 clusters=respid, se_type="stata")
summary(reg.bivar.icontrols)

## Table A6 Model 2: interacting `forma` with `words` (with wave FEs)
## with control variables and interactions with forma
reg.iwords.icontrols <- lm_robust(case2 ~ forma*words + forma*fkscore + as.factor(wave) +
                                    age.std*forma + white.std*forma +
                                    male.std*forma + pid.std*forma +
                                    nytfront.std*forma + godgaysguns.std*forma,
                                  data=DAT, weights=weight,
                                  clusters=respid, se_type="stata")
summary(reg.iwords.icontrols)

## Table A6 Model 3: interacting `forma` with `knowledge` (with wave FEs)
## with controls and interactions with forma
reg.iknowledge.icontrols <- lm_robust(case2 ~ forma*knowledge + forma*educ + as.factor(wave) +
                                        age.std*forma + white.std*forma +
                                        male.std*forma + pid.std*forma +
                                        nytfront.std*forma + godgaysguns.std*forma,
                                      data=DAT, weights=weight,
                                      clusters=respid, se_type="stata")
summary(reg.iknowledge.icontrols)


## Table A6 Model 4: Interacting with court knowledge (including wave FEs)
## with controls and interactions with forma
reg.knowinteract.icontrols <- lm_robust(case2 ~ forma*words*knowledge + as.factor(wave) +
                                          age.std*forma + white.std*forma +
                                          male.std*forma + pid.std*forma +
                                          nytfront.std*forma + godgaysguns.std*forma,
                                        data=subset(DAT, wave!=1 & personal==1),
                                        weights=weight,
                                        clusters=respid, se_type="stata")
summary(reg.knowinteract.icontrols)


## Table A7 (Hierarchical Logit Models)
library(lme4)
# Model 1: just form
lmer.logit.bivar <- glmer(case2 ~ (1|respid) + forma  + as.factor(wave),
                          family=binomial, data=DAT)
summary(lmer.logit.bivar)
# Model 2: question characteristics
lmer.logit.iwords <- glmer(case2 ~ (1|respid) + forma*words + forma*fkscore + as.factor(wave),
                           data=DAT, family=binomial,
                           control=glmerControl(optimizer="bobyqa",optCtrl=list(maxfun=1000000))
)
summary(lmer.logit.iwords)
## Model 3: respondent characteristics
lmer.logit.iknowledge <- glmer(case2 ~ (1|respid) + forma*knowledge + forma*educ + as.factor(wave),
                               data=DAT, family=binomial)
summary(lmer.logit.iknowledge)
## Model 4: question and respondent characteristics
lmer.logit.knowinteract <- glmer(case2 ~ (1|respid) + forma*words*knowledge + as.factor(wave),
                                 data=DAT, family=binomial,
                                 control=glmerControl(optimizer="bobyqa",optCtrl=list(maxfun=1000000)))
summary(lmer.logit.knowinteract)


## Table A8
## Running Simple OLS for F-tests of Nested Models

# Model 1
lm.bivar <- lm(case2 ~ forma + as.factor(wave),
               data=DAT, weights=weight)
# Model 2
lm.iwords <- lm(case2 ~ forma*words + forma*fkscore + as.factor(wave),
                data=DAT, weights=weight)
# Model 2' (excludes FK score)
lm.iwords.noFK <- lm(case2 ~ forma*words + as.factor(wave),
                     data=DAT, weights=weight)
# Model 3
lm.iknowledge <- lm(case2 ~ forma*knowledge + forma*educ + as.factor(wave),
                    data=DAT, weights=weight)
# Model 3' (excludes education)
lm.iknowledge.noeduc <- lm(case2 ~ forma*knowledge + as.factor(wave),
                           data=DAT, weights=weight)
# Model 4
lm.knowinteract <- lm(case2 ~ forma*words*knowledge + as.factor(wave),
                      data=DAT, weights=weight)

# M1 vs M2
anova(lm.bivar, lm.iwords, test='F')

# M2 vs M2'
anova(lm.iwords, lm.iwords.noFK, test='F')

# M1 vs M3
anova(lm.bivar, lm.iknowledge, test='F')

# M3 vs M3'
anova(lm.iknowledge, lm.iknowledge.noeduc, test='F')

# M4 vs M2'
anova(lm.knowinteract, lm.iwords.noFK, test='F')

# M4 vs M3'
anova(lm.knowinteract, lm.iknowledge, test='F')



## Misc. calculations referenced in paper:

## calculating by diff in means for least informed on longest question
## to get non-model-based value

weighted.mean(DAT$case2[DAT$total_correct==0 & DAT$words==max(DAT$words) & DAT$forma==1], 
              w=DAT$weight[DAT$total_correct==0 & DAT$words==max(DAT$words) & DAT$forma==1]) - 
  weighted.mean(DAT$case2[DAT$total_correct==0 & DAT$words==max(DAT$words) & DAT$forma==0],
                w=DAT$weight[DAT$total_correct==0 & DAT$words==max(DAT$words) & DAT$forma==0])


mean(DAT$case2[DAT$total_correct==0 & DAT$words==max(DAT$words) & DAT$forma==1]) - 
  mean(DAT$case2[DAT$total_correct==0 & DAT$words==max(DAT$words) & DAT$forma==0])


## calculations for discussion examples 
## (Biden v. Texas)
# all respondents
weighted.mean(DAT$case2[DAT$words==113 & DAT$forma==1], 
              w=DAT$weight[DAT$words==113 & DAT$forma==1], na.rm=TRUE) - 
  weighted.mean(DAT$case2[DAT$words==113 & DAT$forma==0],
                w=DAT$weight[DAT$words==113 & DAT$forma==0], na.rm=TRUE)
# below median knowledge respondents
weighted.mean(DAT$case2[DAT$total_correct<median(DAT$total_correct) & DAT$words==113 & DAT$forma==1], 
              w=DAT$weight[DAT$total_correct<median(DAT$total_correct) & DAT$words==113 & DAT$forma==1], na.rm=TRUE) - 
  weighted.mean(DAT$case2[DAT$total_correct<median(DAT$total_correct) & DAT$words==113 & DAT$forma==0],
                w=DAT$weight[DAT$total_correct<median(DAT$total_correct) & DAT$words==113 & DAT$forma==0], na.rm=TRUE)

## (Brnovich)
# all respondents
weighted.mean(DAT$case2[DAT$words==129 & DAT$forma==1], 
              w=DAT$weight[DAT$words==129 & DAT$forma==1], na.rm=TRUE) - 
  weighted.mean(DAT$case2[DAT$words==129 & DAT$forma==0],
                w=DAT$weight[DAT$words==129 & DAT$forma==0], na.rm=TRUE)
# below median knowledge respondents
weighted.mean(DAT$case2[DAT$total_correct<median(DAT$total_correct) & DAT$words==129 & DAT$forma==1], 
              w=DAT$weight[DAT$total_correct<median(DAT$total_correct) & DAT$words==129 & DAT$forma==1], na.rm=TRUE) - 
  weighted.mean(DAT$case2[DAT$total_correct<median(DAT$total_correct) & DAT$words==129 & DAT$forma==0],
                w=DAT$weight[DAT$total_correct<median(DAT$total_correct) & DAT$words==129 & DAT$forma==0], na.rm=TRUE)

## Saving Data for VIF Analyses to be done in Stata

library(foreign)
write.dta(DAT, "vif.dta")

