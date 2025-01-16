## estimating ideal point model for each wave
## separately, dropping one case at a time
## storing (identified) 

## COMMENTED OUT CODE IS LEFT IN TO ILLUSTRATE 
## HOW IDEAL POINT WERE OBTAINED. EMAIL AUTHORS
## IF YOU WANT THE FILES NECESSARY TO RUN THIS PART OF THE CODE
## THESE ANALYSES TAKE A LONG TIME AND CREATE VERY
## LARGE OUTPUT FILES, SO ONLY THE POSTERIOR MEANS
## ARE PROVIDED HERE (LOADED BELOW)

## RUNNING LEAVE ONE OUT SCALINGS AND SAVING
## COMMENTED OUT WITH SAVED RESULTS LOADED BELOW
# 
# ## 2010 leave one out scalings
# 
# # making big matrix of supct votes, survey votes, guess
# ALL.VOTES.AND.GUESSES.BIG.2010 <- rbind(SCT.VOTES.2010, SVY.VOTES.BIG.2010, SVY.GUESSES.BIG.2010)
# LEAVEONEOUT.X.2010 <- matrix(NA, 
#                              nrow=nrow(ALL.VOTES.AND.GUESSES.BIG.2010),
#                              ncol=length(qvote.2010))
# 
# library(pscl)
#
# # looping over all surveyed cases, estimating ideal points dropping one case at a time
# for(i in 1:length(qvote.2010)){
#   RC.2010 <- rollcall(ALL.VOTES.AND.GUESSES.BIG.2010[,-qvote.2010[i]],
#                                      legis.names=c(rownames(SCT.VOTES.2010), 
#                                                    paste("resp",1:nrow(SURVEY.2010)),
#                                                    paste("guess",1:nrow(SURVEY.2010))))
#   x.start <- apply(rbind(rbind(SCT.VOTES.2010[ , qvote.2010], SVY.VOTES.2010), SVY.GUESSES.2010), 1, function(x){mean(x==con.vote.2010, na.rm=TRUE)})
#   x.start[is.na(x.start) | is.nan(x.start)] <- mean(x.start, na.rm=TRUE)
#   foo.ideal <- ideal(RC.2010, startvals=list("x"=x.start),
#                                dropList = list(codes = "notInLegis",lop = 0),
#                                burnin=50000, maxiter=100000, thin=1, normalize=TRUE, store.item=TRUE, verbose=FALSE)
#   LEAVEONEOUT.X.2010[,i] <- foo.ideal$xbar[,1]
#   print(i)
# }
# 
# save(LEAVEONEOUT.X.2010, file="Leave one out x estimates 2010.RData")
# 
# 
# 
# ## 2020 leave one out scalings
# 
# # making big matrix of supct votes, survey votes, guess
# ALL.VOTES.AND.GUESSES.BIG.2020 <- rbind(SCT.VOTES.2020, SVY.VOTES.BIG.2020, SVY.GUESSES.BIG.2020)
# LEAVEONEOUT.X.2020 <- matrix(NA, 
#                              nrow=nrow(ALL.VOTES.AND.GUESSES.BIG.2020),
#                              ncol=length(qvote.2020))
# 
# library(pscl)
#
# # looping over all surveyed cases, estimating ideal points dropping one case at a time
# for(i in 1:length(qvote.2020)){
#   RC.2020 <- rollcall(ALL.VOTES.AND.GUESSES.BIG.2020[,-qvote.2020[i]],
#                       legis.names=c(rownames(SCT.VOTES.2020), 
#                                     paste("resp",1:nrow(SURVEY.2020)),
#                                     paste("guess",1:nrow(SURVEY.2020))))
#   x.start <- apply(rbind(rbind(SCT.VOTES.2020[ , qvote.2020], SVY.VOTES.2020), SVY.GUESSES.2020), 1, function(x){mean(x==con.vote.2020, na.rm=TRUE)})
#   x.start[is.na(x.start) | is.nan(x.start)] <- mean(x.start, na.rm=TRUE)
#   foo.ideal <- ideal(RC.2020, startvals=list("x"=x.start),
#                      dropList = list(codes = "notInLegis",lop = 0),
#                      burnin=50000, maxiter=100000, thin=1, normalize=TRUE, store.item=TRUE, verbose=FALSE)
#   LEAVEONEOUT.X.2020[,i] <- foo.ideal$xbar[,1]
#   print(i)
# }
# 
# save(LEAVEONEOUT.X.2020, file="Leave one out x estimates 2020.RData")
# 
# 
# 
# 
# ## 2021 leave one out scalings
# 
# # making big matrix of supct votes, survey votes, guess
# ALL.VOTES.AND.GUESSES.BIG.2021 <- rbind(SCT.VOTES.2021, SVY.VOTES.BIG.2021, SVY.GUESSES.BIG.2021)
# LEAVEONEOUT.X.2021 <- matrix(NA, 
#                              nrow=nrow(ALL.VOTES.AND.GUESSES.BIG.2021),
#                              ncol=length(qvote.2021))
# 
# library(pscl)
#
# # looping over all surveyed cases, estimating ideal points dropping one case at a time
# for(i in 1:length(qvote.2021)){
#   RC.2021 <- rollcall(ALL.VOTES.AND.GUESSES.BIG.2021[,-qvote.2021[i]],
#                       legis.names=c(rownames(SCT.VOTES.2021), 
#                                     paste("resp",1:nrow(SURVEY.2021)),
#                                     paste("guess",1:nrow(SURVEY.2021))))
#   x.start <- apply(rbind(rbind(SCT.VOTES.2021[ , qvote.2021], SVY.VOTES.2021), SVY.GUESSES.2021), 1, function(x){mean(x==con.vote.2021, na.rm=TRUE)})
#   x.start[is.na(x.start) | is.nan(x.start)] <- mean(x.start, na.rm=TRUE)
#   foo.ideal <- ideal(RC.2021, startvals=list("x"=x.start),
#                      dropList = list(codes = "notInLegis",lop = 0),
#                      burnin=50000, maxiter=100000, thin=1, normalize=TRUE, store.item=TRUE, verbose=FALSE)
#   LEAVEONEOUT.X.2021[,i] <- foo.ideal$xbar[,1]
#   print(i)
# }
# 
# save(LEAVEONEOUT.X.2021, file="Leave one out x estimates 2021.RData")


## LOADING LEAVE ONE OUT IDEAL RUNS FOR EACH YEAR
load("Leave one out x estimates 2010.RData")
load("Leave one out x estimates 2020.RData")
load("Leave one out x estimates 2021.RData")

## names of SCT justices and court
sct.names.2010 <- c("Stevens", "O'Connor", "Scalia", "Kennedy", "Souter", "Thomas",
                    "Ginsburg", "Breyer", "Roberts", "Alito", "Sotomayor", "Majority",
                    "RobertsNatCt1", "RobertsNatCt2", "RobertsNatCt3")
sct.names.2020 <- c("Sotomayor", "Ginsburg", "Kagan", "Breyer", "Roberts", "Kavanaugh",
                    "Alito", "Gorsuch", "Thomas", "CourtMajority")
sct.names.2021 <- c("Sotomayor", "Kagan", "Breyer", "Roberts", "Kavanaugh", "Barrett", 
                    "Gorsuch", "Alito", "Thomas", "CourtMajority")

# loading SCOTUSpoll datasets with ideal point estimates
load("2010SCOTUSpoll.RData") # loaded as SURVEY.2010
load("2020SCOTUSpoll.RData") # loaded as SURVEY.2020
load("2021SCOTUSpoll.RData") # loaded as SURVEY.2021


###############
## FIGURE S3 ##
###############
##########
##########
## 2020 ##
##########
##########


## identifying 2010 estimates so resp ideal points
## have mean 0 sd 1

for(i in 1:ncol(LEAVEONEOUT.X.2010)){
  LEAVEONEOUT.X.2010[, i] <- (LEAVEONEOUT.X.2010[, i] - 
                                mean(LEAVEONEOUT.X.2010[(15+1):(15+nrow(SURVEY.2010)), i])) /
    sd(LEAVEONEOUT.X.2010[(15+1):(15+nrow(SURVEY.2010)), i])
}

## 2010 leave one out scalings results figure
par(mfrow=c(3,1))
plot(10:1 ~ LEAVEONEOUT.X.2010[c(1, 11, 7, 8, 4, 9, 10, 3, 6, 12), 1],
     xlim=c(-3,3), ylab="", xlab="", yaxt="n",
     col="gray", bty="n", main="Justice and Court Ideology Estimates")
#axis(side=3, at=-3:3)
for(i in 1:ncol(LEAVEONEOUT.X.2010)){
  points(10:1 ~ LEAVEONEOUT.X.2010[c(1, 11, 7, 8, 4, 9, 10, 3, 6, 12), i],
       col="gray")
    text(-3, (10:1)[i], 
       sct.names.2010[c(1, 11, 7, 8, 4, 9, 10, 3, 6, 12)[i]],
       pos=4)
}
#
plot(density(LEAVEONEOUT.X.2010[(15+1):(15+nrow(SURVEY.2010)), 1],
             adj=1.5, weights=SURVEY.2010$weight/sum(SURVEY.2010$weight)),
     col="gray", xlim=c(-3,3), bty="n", ylim=c(0, .6),
     yaxt="n", ylab="", xlab="",
     main="Density of Respondent Ideology Estimates")
for(i in 1:ncol(LEAVEONEOUT.X.2010)){
  lines(density(LEAVEONEOUT.X.2010[(15+1):(15+nrow(SURVEY.2010)), i],
                adj=1.5, weights=SURVEY.2010$weight/sum(SURVEY.2010$weight)),
       col="gray")
}
#
plot(density(LEAVEONEOUT.X.2010[-(1:(15+nrow(SURVEY.2010))), 1],
             adj=1.5, weights=SURVEY.2010$weight/sum(SURVEY.2010$weight)),
     col="gray", xlim=c(-3,3), bty="n", ylim=c(0, .6),
     yaxt="n", ylab="", xlab="Ideology", main="Density of Respondent Perception Estimates")
for(i in 1:ncol(LEAVEONEOUT.X.2010)){
  lines(density(LEAVEONEOUT.X.2010[-(1:(15+nrow(SURVEY.2010))), i],
                adj=1.5, weights=SURVEY.2010$weight/sum(SURVEY.2010$weight)),
        col="gray")
}

###############
## FIGURE S4 ##
###############
##########
##########
## 2020 ##
##########
##########

## identifying 2020 estimates so resp ideal points
## have mean 0 sd 1

for(i in 1:ncol(LEAVEONEOUT.X.2020)){
  LEAVEONEOUT.X.2020[, i] <- (LEAVEONEOUT.X.2020[, i] - 
                                mean(LEAVEONEOUT.X.2020[(10+1):(10+nrow(SURVEY.2020)), i])) /
    sd(LEAVEONEOUT.X.2020[(10+1):(10+nrow(SURVEY.2020)), i])
}

## 2020 leave one out scalings results figure
par(mfrow=c(3,1))
plot(10:1 ~ LEAVEONEOUT.X.2020[c(1, 2, 4, 3, 5, 8, 6, 7, 9, 10), 1],
     xlim=c(-3,3), ylab="", xlab="", yaxt="n",
     col="gray", bty="n", main="Justice and Court Ideology Estimates")
#axis(side=3, at=-3:3)
for(i in 1:ncol(LEAVEONEOUT.X.2020)){
  points(10:1 ~ LEAVEONEOUT.X.2020[c(1, 2, 4, 3, 5, 8, 6, 7, 9, 10), i],
         col="gray")
  text(-3, (10:1)[i], 
       sct.names.2020[c(1, 2, 4, 3, 5, 8, 6, 7, 9, 10)[i]],
       pos=4)
}
#
plot(density(LEAVEONEOUT.X.2020[(10+1):(10+nrow(SURVEY.2020)), 1],
             adj=1.5, weights=SURVEY.2020$weight/sum(SURVEY.2020$weight)),
     col="gray", xlim=c(-3,3), bty="n", ylim=c(0, .6),
     yaxt="n", ylab="", xlab="",
     main="Density of Respondent Ideology Estimates")
for(i in 1:ncol(LEAVEONEOUT.X.2020)){
  lines(density(LEAVEONEOUT.X.2020[(10+1):(10+nrow(SURVEY.2020)), i],
                adj=1.5, weights=SURVEY.2020$weight/sum(SURVEY.2020$weight)),
        col="gray")
}
#
plot(density(LEAVEONEOUT.X.2020[-(1:(10+nrow(SURVEY.2020))), 1],
             adj=1.5, weights=SURVEY.2020$weight/sum(SURVEY.2020$weight)),
     col="gray", xlim=c(-3,3), bty="n", ylim=c(0, .6),
     yaxt="n", ylab="", xlab="Ideology", main="Density of Respondent Perception Estimates")
for(i in 1:ncol(LEAVEONEOUT.X.2020)){
  lines(density(LEAVEONEOUT.X.2020[-(1:(10+nrow(SURVEY.2020))), i],
                adj=1.5, weights=SURVEY.2020$weight/sum(SURVEY.2020$weight)),
        col="gray")
}



###############
## FIGURE S5 ##
###############
##########
##########
## 2021 ##
##########
##########

## identifying 2021 estimates so resp ideal points
## have mean 0 sd 1

for(i in 1:ncol(LEAVEONEOUT.X.2021)){
  LEAVEONEOUT.X.2021[, i] <- (LEAVEONEOUT.X.2021[, i] - 
                                mean(LEAVEONEOUT.X.2021[(10+1):(10+nrow(SURVEY.2021)), i])) /
    sd(LEAVEONEOUT.X.2021[(10+1):(10+nrow(SURVEY.2021)), i])
}

## 2021 leave one out scalings results figure
par(mfrow=c(3,1))
plot(10:1 ~ LEAVEONEOUT.X.2021[c(1, 3, 2, 4, 5, 6, 9, 7, 8, 10), 1],
     xlim=c(-3,3), ylab="", xlab="", yaxt="n",
     col="gray", bty="n", main="Justice and Court Ideology Estimates")
#axis(side=3, at=-3:3)
for(i in 1:ncol(LEAVEONEOUT.X.2021)){
  points(10:1 ~ LEAVEONEOUT.X.2021[c(1, 3, 2, 4, 5, 6, 9, 7, 8, 10), i],
         col="gray")
  text(-3, (10:1)[i], 
       sct.names.2021[c(1, 3, 2, 4, 5, 6, 9, 7, 8, 10)[i]],
       pos=4)
}
#
plot(density(LEAVEONEOUT.X.2021[(10+1):(10+nrow(SURVEY.2021)), 1],
             adj=1.5, weights=SURVEY.2021$weight/sum(SURVEY.2021$weight)),
     col="gray", xlim=c(-3,3), bty="n", ylim=c(0, .6),
     yaxt="n", ylab="", xlab="",
     main="Density of Respondent Ideology Estimates")
for(i in 1:ncol(LEAVEONEOUT.X.2021)){
  lines(density(LEAVEONEOUT.X.2021[(10+1):(10+nrow(SURVEY.2021)), i],
                adj=1.5, weights=SURVEY.2021$weight/sum(SURVEY.2021$weight)),
        col="gray")
}
#
plot(density(LEAVEONEOUT.X.2021[-(1:(10+nrow(SURVEY.2021))), 1],
             adj=1.5, weights=SURVEY.2021$weight/sum(SURVEY.2021$weight)),
     col="gray", xlim=c(-3,3), bty="n", ylim=c(0, .6),
     yaxt="n", ylab="", xlab="Ideology", main="Density of Respondent Perception Estimates")
for(i in 1:ncol(LEAVEONEOUT.X.2021)){
  lines(density(LEAVEONEOUT.X.2021[-(1:(10+nrow(SURVEY.2021))), i],
                adj=1.5, weights=SURVEY.2021$weight/sum(SURVEY.2021$weight)),
        col="gray")
}