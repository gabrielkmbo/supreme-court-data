#---
# SRC Summer Camp: Introduction to R
# Session 1
# author: Name
#---

## Arithmetic Operations
# R can be used as a calculator:
  
#### try summation, division, multiplication, power calculations ###

5 + 3
5 - 3
5 / 3
5 * 3
5 ^ 3

## Objects

# R is an "object-oriented" programming language. An *object* is any piece of information stored by R. 
# These can be anything, for example:
  
# - A dataset (e.g. a country year dataset)
# - A subset of a dataset (e.g. just the democracies in a country year dataset)
# - A number (e.g. $2\pi + 1$)
# - A phrase (e.g. "stanford is awesome")
# - A function (e.g. a function that takes in $x$ and gives you $x^2 + 8$)
  
# R can store *objects* with a name of our choice. Use <- as an assignment operator for objects.

result <- 5 + 3
result2 = 5 + 3

result == 8

a <- 4
result

#If we assign a new value to the same object name, then we will overwite this object (so be careful when doing so!)

result <- 5 - 3
result <- 5
print(result)

## Objects (cont.)

# R can also represent other types of values as objects, such as strings of characters:

s <- "stanford is awesome"
s
print(s)

# There are many other classes of data besides numeric and character, which we will talk about in class

## Vectors

# A *vector* simply represents a collection of information stored in a specific order. 
# We use the function c(), which stands for "concatenate," to enter a data vector 
# (with commas separating elements of the vector):

a <- c(2, 4)
  
world.pop <- c(2525779, 3026003, 3691173, 4449049, 5320817, 6127700, 6916183)
world.pop

world.pop[2]
world.pop[-2]

a <- c(1, 2, 3, 5)

## Vectors (cont.)

# To access specific elements of a vector, we use square brackets [ ]. This is called *indexing*:
  
world.pop[2]

b <-world.pop[c(2, 4)]

world.pop[2, 4]


length(world.pop)

world.pop <- world.pop[-c(2,4)]


world.pop[-c(1,3)]

world.pop[c(1,3)]

world.pop[1,3]

## Vectors (cont.)

# Since each element of this vector is a numeric value, we can apply arithmetic operations to it:
  
world.pop.small <- world.pop /1000

a <- 1:7
b <- seq(2, 10, length.out = 7)
a + b


length(a)

## Functions

# A *function* takes input object(s) and returns an output object. 
# In R, a function generally runs as funcname(input) where funcname is the function name 
# and input is the input object. We often call these inputs *arguments*. 
# Some basic functions useful for summarizing data include:
  
# - length(): length of a vector (number of elements)
# - min(): minimum value
# - max(): maximum value
# - range(): range of data
# - mean(): mean
# - sum(): sum

## Functions (cont.)

length(world.pop)

min(world.pop)

max(world.pop)

## Functions (cont.)

a <- c(1:7, NA)
a
min(a, na.rm = TRUE)

a <- range(world.pop)
a[2]

range(world.pop)[2]

max(world.pop)

a <- range(world.pop)
length(a)
a[2]

mean(world.pop)

median(world.pop)

sum(world.pop)

## Data Files

# Most of the time, we will load data from an external file. For this class, we will mostly use:
  
# - *CSV*: comma-separated files. These are conceptually similar to Microsoft Excel or Google Spreadsheet.

# - *RData*: collection of R objects including data sets.

## Working Directory

# - The *working directory* is where R will by default load data from and save data to. 

# - Use the function getwd() to display the current working directory.

getwd()

dir()
# - Use the function setwd() to change the working directory



setwd("~/Dropbox/Teaching/_Undergraduate/R_sessions/session1") # Enter your directory here

dir()

# - In RStudio, you can also go to Session, Set Working Directory, To Source File Location to set it where your R file is located

## clear memory

rm(list = ls())

## Reading in Files

# - For *CSV* files:

  
d <- read.csv("nations.csv")
class(d)
str(d)

# - For *RData* files:
rm(list = ls())
load("nations.RData")

## Data Frames

# A *data frame* is a collection of vectors, but we can think of it like a spreadsheet. 
# Useful functions for data frames include:
  
# - names(): return a vector of variable names
# - nrow(): return the number of rows
# - ncol(): return the number of columns
# - dim(): combine ncol() and nrow() into a vector
# - summary(): produce a summary

## Data Frames (cont.)

names(d)

nrow(d)

ncol(d)

## Data Frames (cont.)

dim(d)

summary(d)

## Data Frames (cont.)

# The $ operator is one way to access variables from a data frame:
table(d$demo)
table(d$year)

# Another way of retrieving variables is to use brackets [ ] with a comma in the form [rows, columns]:

d1 <- d[, c("country","gdppc")]


d[, c(1,5)]

d[1:4, c("country","year")]




## Saving Objects


# - When you quit RStudio, you will be asked whether you would like to save the workspace. You should answer *no* to this in general: we only want to save what we want!
  
# - To export *CSV*:

write.csv(d1, file = "nations_new.csv")


# - To export *RData*:

save(d, file = "d.RData")

## Packages

# One of R's strengths is the existence of a large community of R users who contribute various 
# functionalities as R packages. For example, the foreign package is useful when dealing with 
# files from other statistical software.

# install.packages("foreign") # install package
library(foreign) # load package

install.packages("ggplot2")
install.packages("haven")
library(ggplot2)

## Programming Tips

# - First, use the text editor in RStudio to write your code rather than directly typing it into 
# the R console. That way you can save a record of your program as a R file.

# - Second, we can annotate our R code so that it is easily understandable to ourselves and others using #

# File: d.R
# Author: Yiqing Xu
# This code loads the UN population data

d <- read.csv("nations.csv")

## Programming Tips (cont.)

# Third, we should follow a certain set of coding rules:

# - Use informative names for files, variables, and functions
# - Use systematic spacing and indentation

# Finally, R Markdown is useful for quickly writing documents using R. 
# I used it to make this presentation, and you will be using this to turn in your problem sets.

