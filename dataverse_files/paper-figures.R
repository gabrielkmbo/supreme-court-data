## Replication code for:
## A decade-long longitudinal survey 
##   shows that the Supreme Court is 
##   now much more conservative than 
##   the public
## by Jessee, Malhotra and Sen
## in Proceedings of the National 
## Academy of Sciences

# reading in data
# (NOTE: make sure data file is in R's working directory)

# this code requires the package "scales"
# if not already installed on your machine, type: 
# install.packages("scales")
# to install it before running code below

# loading SCOTUSpoll datasets with ideal point estimates
load("2010SCOTUSpoll.RData") # loaded as SURVEY.2010
load("2020SCOTUSpoll.RData") # loaded as SURVEY.2020
load("2021SCOTUSpoll.RData") # loaded as SURVEY.2021

# recoding PID into 3 categories
SURVEY.2010$pid3_recoded <- c(1,1,1,2, 3,3,3, rep(NA, 999))[SURVEY.2010$pid7_recapture]
SURVEY.2020$pid3_recoded <- c(1,1,1,2, 3,3,3, rep(NA, 999))[SURVEY.2020$pid7]
SURVEY.2021$pid3_recoded <- c(1,1,1,2, 3,3,3, rep(NA, 999))[SURVEY.2021$pid7]

# Creating vectors of (weighted) mean ideology
# for respondents, and for Dems and Reps
year.vec <- c(2010, 2020, 2021)
D.av.idealg.by.year <- c(weighted.mean(SURVEY.2010$idealg[SURVEY.2010$pid3_recoded==1],
                                       w=SURVEY.2010$weight[SURVEY.2010$pid3_recoded==1],
                                       na.rm=TRUE),
                         weighted.mean(SURVEY.2020$idealg[SURVEY.2020$pid3_recoded==1],
                                       w=SURVEY.2020$weight[SURVEY.2020$pid3_recoded==1],
                                       na.rm=TRUE),
                         weighted.mean(SURVEY.2021$idealg[SURVEY.2021$pid3_recoded==1],
                                       w=SURVEY.2021$weight[SURVEY.2021$pid3_recoded==1],
                                       na.rm=TRUE))
R.av.idealg.by.year <- c(weighted.mean(SURVEY.2010$idealg[SURVEY.2010$pid3_recoded==3],
                                       w=SURVEY.2010$weight[SURVEY.2010$pid3_recoded==3],
                                       na.rm=TRUE),
                         weighted.mean(SURVEY.2020$idealg[SURVEY.2020$pid3_recoded==3],
                                       w=SURVEY.2020$weight[SURVEY.2020$pid3_recoded==3],
                                       na.rm=TRUE),
                         weighted.mean(SURVEY.2021$idealg[SURVEY.2021$pid3_recoded==3],
                                       w=SURVEY.2021$weight[SURVEY.2021$pid3_recoded==3],
                                       na.rm=TRUE))
I.av.idealg.by.year <- c(weighted.mean(SURVEY.2010$idealg[SURVEY.2010$pid3_recoded==2],
                                       w=SURVEY.2010$weight[SURVEY.2010$pid3_recoded==2],
                                       na.rm=TRUE),
                         weighted.mean(SURVEY.2020$idealg[SURVEY.2020$pid3_recoded==2],
                                       w=SURVEY.2020$weight[SURVEY.2020$pid3_recoded==2],
                                       na.rm=TRUE),
                         weighted.mean(SURVEY.2021$idealg[SURVEY.2021$pid3_recoded==2],
                                       w=SURVEY.2021$weight[SURVEY.2021$pid3_recoded==2],
                                       na.rm=TRUE))
ALL.av.idealg.by.year <- c(weighted.mean(SURVEY.2010$idealg,
                                         w=SURVEY.2010$weight,
                                         na.rm=TRUE),
                           weighted.mean(SURVEY.2020$idealg,
                                         w=SURVEY.2020$weight,
                                         na.rm=TRUE),
                           weighted.mean(SURVEY.2021$idealg,
                                         w=SURVEY.2021$weight,
                                         na.rm=TRUE))

##############
## FIGURE 1 ##
##############
# NOTE: does not include credible intervals
#       (see readme for more info)
plot(D.av.idealg.by.year ~ c((1:3)+.05), 
     ylim=c(-1.6,1.6), xlim=c(.9, 3.1),
     xaxt="n", col="blue", pch=19,
     bty="n", xlab="Survey Wave", ylab="Ideology")
axis(side=1, at=1:3, labels=c("2010", "2020", "2021"))
abline(h=0, col="gray", lwd=2, lty=3)
points(1:3, rep(0,3), pch=19, col="gray")
points(R.av.idealg.by.year ~ c((1:3)+.1), col="red", pch=19)
points(c(SURVEY.2010$idealg_courtmajority[1], 
         SURVEY.2020$idealg_courtmajority[1], 
         SURVEY.2021$idealg_courtmajority[1]) ~
         I(c(1:3)-.1), pch=19)
legend('bottomleft', 
       c("Court", "Av. Resp Ideol", "Av. D Resp. Ideol", "Av. R Resp. Ideol"),
       pch=19, #lty=c(1,1,2,3), 
       col=c("black", "gray", "blue", "red"))


# Creating vectors of (weighted) mean 
# of respondent and Dem, Rep perceptions over time
year.vec <- c(2010, 2020, 2021)
D.av.percep.by.year <- c(weighted.mean(SURVEY.2010$perception[SURVEY.2010$pid3_recoded==1],
                                       w=SURVEY.2010$weight[SURVEY.2010$pid3_recoded==1],
                                       na.rm=TRUE),
                         weighted.mean(SURVEY.2020$perception[SURVEY.2020$pid3_recoded==1],
                                       w=SURVEY.2020$weight[SURVEY.2020$pid3_recoded==1],
                                       na.rm=TRUE),
                         weighted.mean(SURVEY.2021$perception[SURVEY.2021$pid3_recoded==1],
                                       w=SURVEY.2021$weight[SURVEY.2021$pid3_recoded==1],
                                       na.rm=TRUE))
R.av.percep.by.year <- c(weighted.mean(SURVEY.2010$perception[SURVEY.2010$pid3_recoded==3],
                                       w=SURVEY.2010$weight[SURVEY.2010$pid3_recoded==3],
                                       na.rm=TRUE),
                         weighted.mean(SURVEY.2020$perception[SURVEY.2020$pid3_recoded==3],
                                       w=SURVEY.2020$weight[SURVEY.2020$pid3_recoded==3],
                                       na.rm=TRUE),
                         weighted.mean(SURVEY.2021$perception[SURVEY.2021$pid3_recoded==3],
                                       w=SURVEY.2021$weight[SURVEY.2021$pid3_recoded==3],
                                       na.rm=TRUE))
I.av.percep.by.year <- c(weighted.mean(SURVEY.2010$perception[SURVEY.2010$pid3_recoded==2],
                                       w=SURVEY.2010$weight[SURVEY.2010$pid3_recoded==2],
                                       na.rm=TRUE),
                         weighted.mean(SURVEY.2020$perception[SURVEY.2020$pid3_recoded==2],
                                       w=SURVEY.2020$weight[SURVEY.2020$pid3_recoded==2],
                                       na.rm=TRUE),
                         weighted.mean(SURVEY.2021$perception[SURVEY.2021$pid3_recoded==2],
                                       w=SURVEY.2021$weight[SURVEY.2021$pid3_recoded==2],
                                       na.rm=TRUE))
ALL.av.percep.by.year <- c(weighted.mean(SURVEY.2010$perception,
                                         w=SURVEY.2010$weight,
                                         na.rm=TRUE),
                           weighted.mean(SURVEY.2020$perception,
                                         w=SURVEY.2020$weight,
                                         na.rm=TRUE),
                           weighted.mean(SURVEY.2021$perception,
                                         w=SURVEY.2021$weight,
                                         na.rm=TRUE))

##############
## FIGURE 2 ##
##############
# Note: Does not include credible intervals
#       (see readme for more info)
plot(D.av.percep.by.year ~ c((1:3)+.05), 
     ylim=c(-1.6,1.6), xlim=c(.9, 3.1),
     xaxt="n", col="blue", pch=19,
     bty="n", xlab="Survey Wave", ylab="Ideology")
abline(h=0, lty=3, lwd=2, col="gray")
axis(side=1, at=1:3, labels=c("2010", "2020", "2021"))
#
points(ALL.av.percep.by.year ~ c((1:3)), col="gray", pch=19)
#
points(R.av.percep.by.year ~ c((1:3)+.1), col="red", pch=19)
#
points(c(SURVEY.2010$idealg_courtmajority[1], 
         SURVEY.2020$idealg_courtmajority[1], 
         SURVEY.2021$idealg_courtmajority[1]) ~
         I(c(1:3)-.1), pch=19)
legend('bottomleft', 
       c("Court", "Av. Resp. Perception", "Av. D Resp. Perception", "Av. R Resp. Perception"),
       pch=19, #lty=c(1,1,2,3), 
       col=c("black", "gray", "blue", "red"))


##########################################
## REGRESSIONS PREDICTING COURT REFORMS ##
##########################################

# note: courtexpand and courttermlimits
# are coded backwards 
# so that 1 = strongly agree
# and 5 = strongly disagree

# creating recoded variables 
# that range from 0 to 1
# with higher values indicating more support
# for the proposal
SURVEY.2021$ExpandCourt <- (5-SURVEY.2021$courtexpand) / 4
SURVEY.2021$TermLimits <- (5-SURVEY.2021$courttermlimits) / 4
SURVEY.2021$AbsDist <- abs(SURVEY.2021$idealg - SURVEY.2021$idealg_courtmajority)
SURVEY.2021$AbsPerceivedDist <- abs(SURVEY.2021$idealg - SURVEY.2021$perception)
SURVEY.2021$SignedPerceivedDist <- SURVEY.2021$perception - SURVEY.2021$idealg
SURVEY.2021$SignedActualDist <- SURVEY.2021$idealg_courtmajority - SURVEY.2021$idealg

# regression predicting court expansion 
reg.expansion <- lm(ExpandCourt ~ SignedPerceivedDist,
                    data=SURVEY.2021)
summary(reg.expansion)
# for Democrats
reg.expansion.D <- lm(ExpandCourt ~ SignedPerceivedDist,
                      data=subset(SURVEY.2021, pid3_recoded==1))
summary(reg.expansion.D)
# for Republicans
reg.expansion.R <- lm(ExpandCourt ~ SignedPerceivedDist,
                      data=subset(SURVEY.2021, pid3_recoded==3))
summary(reg.expansion.R)


# regression predicting term limits
reg.termlimits <- lm(TermLimits ~ SignedPerceivedDist,
                     data=SURVEY.2021)
summary(reg.termlimits)
# for Democrats
reg.termlimits.D <- lm(TermLimits ~ SignedPerceivedDist,
                       data=subset(SURVEY.2021, pid3_recoded==1))
summary(reg.termlimits.D)
# for Republicans
reg.termlimits.R <- lm(TermLimits ~ SignedPerceivedDist,
                       data=subset(SURVEY.2021, pid3_recoded==3))
summary(reg.termlimits.R)


##############
## FIGURE 3 ##
##############
library(scales) # to get alpha for transparent points
par(mfrow=c(2,1))
set.seed(12345) # so jitter will stay same
plot(jitter(SURVEY.2021$ExpandCourt, factor=2) ~ SURVEY.2021$SignedPerceivedDist,
     col=alpha(c("lightsteelblue", "lightgray", "indianred1")[SURVEY.2021$pid3_recoded], .4),
     pch=19, cex=.5, bty="n",
     xlab="Perception of Court Minus Own Ideology", ylab="Support for Court Expansion (Jittered)")
abline(reg.expansion, lwd=3)
abline(reg.expansion.D, col="blue", lty=3, lwd=3)
abline(reg.expansion.R, col="red", lty=2, lwd=3)
#
plot(jitter(SURVEY.2021$TermLimits, factor=2) ~ SURVEY.2021$SignedPerceivedDist,
     col=alpha(c("lightsteelblue", "lightgray", "indianred1")[SURVEY.2021$pid3_recoded], .4),
     pch=19, cex=.5, bty="n",
     xlab="Perception of Court Minus Own Ideology", ylab="Support for Term Limits (Jittered)")
abline(reg.termlimits, lwd=3)
abline(reg.termlimits.D, col="blue", lty=3, lwd=3)
abline(reg.termlimits.R, col="red", lty=2, lwd=3)
legend('bottomright', c("all respondents", "Democrats", "Republicans"),
       lty=c(1,3,2), col=c("black", "blue", "red"), lwd=3)



##############
## TABLE S1 ##
##############
# NOTE: does not include credible (HPD) intervals
#       (see readme for more info)
TABLE.S1 <- c(apply(SURVEY.2010[, c("idealg_stevens", "idealg_sotomayor",
                                  "idealg_ginsburg", "idealg_breyer",
                                  "idealg_kennedy", "idealg_roberts",
                                  "idealg_alito", "idealg_scalia",
                                  "idealg_thomas", "idealg_courtmajority")],
                  2, mean),
              ALL.av.idealg.by.year[1],
              D.av.idealg.by.year[1],
              R.av.idealg.by.year[1],
              ALL.av.percep.by.year[1],
              D.av.percep.by.year[1],
              R.av.percep.by.year[1])
names(TABLE.S1) <- c("Stevens", "Sotomayor",
                     "Ginsburg", "Breyer",
                     "Kennedy", "Roberts",
                     "Alito", "Scalia",
                     "Thomas", "Court Majority",
                     "Av. Ideol (all)", 
                     "Av. Ideol (Dem)", 
                     "Av. Ideol (Rep)", 
                     "Av. Percep. (all)",
                     "Av. Percep. (Dem)",
                     "Av. Percep. (Rep)")
# printing table
round(TABLE.S1, 2)


##############
## TABLE S2 ##
##############
# NOTE: does not include credible (HPD) intervals
#       (see readme for more info)
TABLE.S2 <- c(apply(SURVEY.2020[, c("idealg_sotomayor", "idealg_ginsburg", 
                                    "idealg_breyer", "idealg_kagan",
                                    "idealg_roberts", "idealg_gorsuch",
                                    "idealg_kavanaugh", "idealg_alito", 
                                    "idealg_thomas", "idealg_courtmajority")],
                    2, mean),
              ALL.av.idealg.by.year[2],
              D.av.idealg.by.year[2],
              R.av.idealg.by.year[2],
              ALL.av.percep.by.year[2],
              D.av.percep.by.year[2],
              R.av.percep.by.year[2])
names(TABLE.S2) <- c("Sotomayor", "Ginsburg", 
                     "Breyer", "Kagan",
                     "Roberts", "Gorsuch",
                     "Kavanaugh", "Alito",
                     "Thomas", "Court Majority",
                     "Av. Ideol (all)", 
                     "Av. Ideol (Dem)", 
                     "Av. Ideol (Rep)", 
                     "Av. Percep. (all)",
                     "Av. Percep. (Dem)",
                     "Av. Percep. (Rep)")
# printing table
round(TABLE.S2, 2)




##############
## TABLE S2 ##
##############
# NOTE: does not include credible (HPD) intervals
#       (see readme for more info)
TABLE.S3 <- c(apply(SURVEY.2021[, c("idealg_sotomayor", "idealg_breyer", 
                                    "idealg_kagan", "idealg_roberts", 
                                    "idealg_kavanaugh", "idealg_barrett",
                                    "idealg_thomas", "idealg_gorsuch",
                                    "idealg_alito", "idealg_courtmajority")],
                    2, mean),
              ALL.av.idealg.by.year[3],
              D.av.idealg.by.year[3],
              R.av.idealg.by.year[3],
              ALL.av.percep.by.year[3],
              D.av.percep.by.year[3],
              R.av.percep.by.year[3])
names(TABLE.S3) <- c("Sotomayor", "Breyer", 
                     "Kagan", "Roberts", 
                     "Kavanaugh", "Barrett", 
                     "Thomas", "Gorsuch",
                     "Alito", "Court Majority",
                     "Av. Ideol (all)", 
                     "Av. Ideol (Dem)", 
                     "Av. Ideol (Rep)", 
                     "Av. Percep. (all)",
                     "Av. Percep. (Dem)",
                     "Av. Percep. (Rep)")
# printing table
round(TABLE.S3, 2)


###############
## FIGURE S1 ##
###############
# creating cleaned up ideo5 variables (6=NA)
SURVEY.2010$ideo5.new <- ifelse(SURVEY.2010$ideology5_personal %in% 1:5,
                                SURVEY.2010$ideology5_personal, NA)
SURVEY.2020$ideo5.new <- ifelse(SURVEY.2020$ideo5 %in% 1:5,
                                SURVEY.2020$ideo5, NA)
SURVEY.2021$ideo5.new <- ifelse(SURVEY.2021$ideo5 %in% 1:5,
                                SURVEY.2021$ideo5, NA)
#
par(mfrow=c(1,3))
boxplot(SURVEY.2010$idealg ~ SURVEY.2010$ideo5.new, 
        ylim=c(-3, 2.2), main="2010", bty="n",
        xlab="Ideological Identification", ylab="Estimated Ideology")
abline(h=seq(-3,2, by=.5), lty=3, col="gray")
boxplot(SURVEY.2020$idealg ~ SURVEY.2020$ideo5.new, 
        ylim=c(-3, 2.2), main="2020", bty="n",
        xlab="Ideological Identification", ylab="Estimated Ideology")
abline(h=seq(-3,2, by=.5), lty=3, col="gray")
boxplot(SURVEY.2021$idealg ~ SURVEY.2021$ideo5.new, 
        ylim=c(-3, 2.2), main="2021", bty="n",
        xlab="Ideological Identification", ylab="Estimated Ideology")
abline(h=seq(-3,2, by=.5), lty=3, col="gray")


###############
## FIGURE S6 ##
###############

## PLOTS WITH LOESS FOR SIGNED PERCEIVED DISTANCE
loess.expand.signedperceived.all <- loess.smooth(SURVEY.2021$SignedPerceivedDist, SURVEY.2021$ExpandCourt, 
                                                 span=.8, weights=SURVEY.2021$weight)
loess.expand.signedperceived.dem <- loess.smooth(SURVEY.2021$SignedPerceivedDist[SURVEY.2021$pid3_recoded==1], 
                                                 SURVEY.2021$ExpandCourt[SURVEY.2021$pid3_recoded==1],
                                                 span=.8, weights=SURVEY.2021$weight[SURVEY.2021$pid3_recoded==1])
loess.expand.signedperceived.rep <- loess.smooth(SURVEY.2021$SignedPerceivedDist[SURVEY.2021$pid3_recoded==3], 
                                                 SURVEY.2021$ExpandCourt[SURVEY.2021$pid3_recoded==3],
                                                 span=.8, weights=SURVEY.2021$weight[SURVEY.2021$pid3_recoded==3])
#
loess.termlimits.signedperceived.all <- loess.smooth(SURVEY.2021$SignedPerceivedDist, SURVEY.2021$TermLimits,
                                                     span=.8, weights=SURVEY.2021$weight)
loess.termlimits.signedperceived.dem <- loess.smooth(SURVEY.2021$SignedPerceivedDist[SURVEY.2021$pid3_recoded==1], 
                                                     SURVEY.2021$TermLimits[SURVEY.2021$pid3_recoded==1],
                                                     span=.8, weights=SURVEY.2021$weight[SURVEY.2021$pid3_recoded==1])
loess.termlimits.signedperceived.rep <- loess.smooth(SURVEY.2021$SignedPerceivedDist[SURVEY.2021$pid3_recoded==3], 
                                                     SURVEY.2021$TermLimits[SURVEY.2021$pid3_recoded==3],
                                                     span=.8, weights=SURVEY.2021$weight[SURVEY.2021$pid3_recoded==3])


# getting .05 and .95 quantiles of distribution
# for SignedPerceivedDist for all resps
# and for D's and for R's
q05.all <- quantile(SURVEY.2021$SignedPerceivedDist, .05)
q95.all <- quantile(SURVEY.2021$SignedPerceivedDist, .95)
#
q05.dem <- quantile(SURVEY.2021$SignedPerceivedDist[!is.na(SURVEY.2021$pid3_recoded) & SURVEY.2021$pid3_recoded==1], .05)
q95.dem <- quantile(SURVEY.2021$SignedPerceivedDist[!is.na(SURVEY.2021$pid3_recoded) & SURVEY.2021$pid3_recoded==1], .95)
#
q05.rep <- quantile(SURVEY.2021$SignedPerceivedDist[!is.na(SURVEY.2021$pid3_recoded) & SURVEY.2021$pid3_recoded==3], .05)
q95.rep <- quantile(SURVEY.2021$SignedPerceivedDist[!is.na(SURVEY.2021$pid3_recoded) & SURVEY.2021$pid3_recoded==3], .95)

par(mfrow=c(2,1))
set.seed(12345) # so jitter will stay same
plot(jitter(SURVEY.2021$ExpandCourt, factor=2) ~ SURVEY.2021$SignedPerceivedDist,
     col=alpha(c("lightsteelblue", "lightgray", "indianred1")[SURVEY.2021$pid3_recoded],.4),
     pch=19, cex=.5, bty="n",
     xlab="Perception of Court Minus Own Ideology", ylab="Support for Court Expansion (Jittered)")
lines(loess.expand.signedperceived.all$x[loess.expand.signedperceived.all$x > q05.all &
                                           loess.expand.signedperceived.all$x < q95.all], 
      loess.expand.signedperceived.all$y[loess.expand.signedperceived.all$x > q05.all &
                                           loess.expand.signedperceived.all$x < q95.all],
      lwd=2)
lines(loess.expand.signedperceived.dem$x[loess.expand.signedperceived.dem$x > q05.dem &
                                           loess.expand.signedperceived.dem$x < q95.dem], 
      loess.expand.signedperceived.dem$y[loess.expand.signedperceived.dem$x > q05.dem &
                                           loess.expand.signedperceived.dem$x < q95.dem],
      lwd=2, col="blue")
lines(loess.expand.signedperceived.rep$x[loess.expand.signedperceived.rep$x > q05.rep &
                                           loess.expand.signedperceived.rep$x < q95.rep], 
      loess.expand.signedperceived.rep$y[loess.expand.signedperceived.rep$x > q05.rep &
                                           loess.expand.signedperceived.rep$x < q95.rep],
      lwd=2, col="red")
#
plot(jitter(SURVEY.2021$TermLimits, factor=2) ~ SURVEY.2021$SignedPerceivedDist,
     col=alpha(c("lightsteelblue", "lightgray", "indianred1")[SURVEY.2021$pid3_recoded],.4),
     pch=19, cex=.5, bty="n",
     xlab="Perception of Court Minus Own Ideology", ylab="Support for Term Limits (Jittered)")
legend('bottomright', c("all respondents", "Democrats", "Republicans"),
       lty=c(1,3,2), col=c("black", "blue", "red"), lwd=3)
lines(loess.termlimits.signedperceived.all$x[loess.termlimits.signedperceived.all$x > q05.all &
                                               loess.termlimits.signedperceived.all$x < q95.all], 
      loess.termlimits.signedperceived.all$y[loess.termlimits.signedperceived.all$x > q05.all &
                                               loess.termlimits.signedperceived.all$x < q95.all],
      lwd=2)
lines(loess.termlimits.signedperceived.dem$x[loess.termlimits.signedperceived.dem$x > q05.dem &
                                               loess.termlimits.signedperceived.dem$x < q95.dem], 
      loess.termlimits.signedperceived.dem$y[loess.termlimits.signedperceived.dem$x > q05.dem &
                                               loess.termlimits.signedperceived.dem$x < q95.dem],
      lwd=2, col="blue")
lines(loess.termlimits.signedperceived.rep$x[loess.termlimits.signedperceived.rep$x > q05.rep &
                                               loess.termlimits.signedperceived.rep$x < q95.rep], 
      loess.termlimits.signedperceived.rep$y[loess.termlimits.signedperceived.rep$x > q05.rep &
                                               loess.termlimits.signedperceived.rep$x < q95.rep],
      lwd=2, col="red")



###############
## FIGURE S7 ##
###############
#
reg.expansion.actual <- lm(ExpandCourt ~ SignedActualDist,
                           data=SURVEY.2021)
summary(reg.expansion.actual)
# for Democrats
reg.expansion.actual.D <- lm(ExpandCourt ~ SignedActualDist,
                             data=subset(SURVEY.2021, pid3_recoded==1))
summary(reg.expansion.actual.D)
# for Republicans
reg.expansion.actual.R <- lm(ExpandCourt ~ SignedActualDist,
                             data=subset(SURVEY.2021, pid3_recoded==3))
summary(reg.expansion.actual.R)


# regression predicting term limits
reg.termlimits.actual <- lm(TermLimits ~ SignedActualDist,
                            data=SURVEY.2021)
summary(reg.termlimits.actual)
# for Democrats
reg.termlimits.actual.D <- lm(TermLimits ~ SignedActualDist,
                              data=subset(SURVEY.2021, pid3_recoded==1))
summary(reg.termlimits.actual.D)
# for Republicans
reg.termlimits.actual.R <- lm(TermLimits ~ SignedActualDist,
                              data=subset(SURVEY.2021, pid3_recoded==3))
summary(reg.termlimits.actual.R)


library(scales) # to get alpha for transparent points
par(mfrow=c(2,1))
set.seed(12345) # so jitter will stay same
plot(jitter(SURVEY.2021$ExpandCourt, factor=2) ~ SURVEY.2021$SignedActualDist,
     col=alpha(c("lightsteelblue", "lightgray", "indianred1")[SURVEY.2021$pid3_recoded], .4),
     pch=19, cex=.5, bty="n",
     xlab="Position of Court Minus Own Ideology", ylab="Support for Court Expansion (Jittered)")
abline(reg.expansion.actual, lwd=3)
abline(reg.expansion.actual.D, col="blue", lty=3, lwd=3)
abline(reg.expansion.actual.R, col="red", lty=2, lwd=3)
#
plot(jitter(SURVEY.2021$TermLimits, factor=2) ~ SURVEY.2021$SignedActualDist,
     col=alpha(c("lightsteelblue", "lightgray", "indianred1")[SURVEY.2021$pid3_recoded], .4),
     pch=19, cex=.5, bty="n",
     xlab="Position of Court Minus Own Ideology", ylab="Support for Term Limits (Jittered)")
abline(reg.termlimits.actual, lwd=3)
abline(reg.termlimits.actual.D, col="blue", lty=3, lwd=3)
abline(reg.termlimits.actual.R, col="red", lty=2, lwd=3)
legend('bottomright', c("all respondents", "Democrats", "Republicans"),
       lty=c(1,3,2), col=c("black", "blue", "red"), lwd=3)
