# Prepared by: William Doane, PhD <wdoane@bennington.edu>
# during the Computational Biology for Biology Educators workshop
# Lafayette College, Easton PA, 2011 06 12 - 2011 06 17

# Any line or part of a line that begins with a hash mark # is a comment, ignored by R




# Values
1        # integer
1.4      # decimal fraction
1e-2     # Scientific notation: "1 times 10 to the -2 plus 7"
"red"    # string value
TRUE     # boolean/logical value

# The display of values can be affected by environment settings
1e-1 + 7
1e-2 + 7
1e-3 + 7
1e-4 + 7
1e-5 + 7
1e-6 + 7
1e-7 + 7
1e-8 + 7

getOption("digits")
options(digits=10) # if you want a specific number of sig. figs

1e-1 + 7
1e-2 + 7
1e-3 + 7
1e-4 + 7
1e-5 + 7
1e-6 + 7
1e-7 + 7
1e-8 + 7

options(digits=5) # a sane default

# Collections of values
c(1, 2)                      # collection of integer values
c("red", "blue")            # collection of string values
c(TRUE, TRUE, FALSE, TRUE)  # collection of boolean (logical) values
?c
c(1, 2) + 1
c("red", "blue") + 1  # ERROR





# Sequences of values
seq(1, 10)
seq(1, 10) * 2
seq(1, 10, by=2)
?seq

letters
LETTERS




# Variables store values
# Variable names must begin with an alphabetic character
#                cannot contain spaces
#                must NOT be the same as an existing R function name
#                by convention use . to separate words: final.grades
#                should be meaningful within the context of your research
# Either <- or = is used evaluate the right-hand side and store it 
#   in the variable named on the left-hand side

xx = 5
xx
xx + 2
xx
xx = xx + 2
xx

yy = seq(1, 100, by=2)




# Selecting parts of a collection
# consider the whole collection
yy

# In algebra, you might have a vector variable X and use "X sub 1", "X sub 2",
# to refer to the 1st element in X or the 2nd element in X or, generally "X sub i"
# We cant type a subscript in computer programming, so most programming languages
# use a bracket notation to denote "X sub i": X[i]

# consider the 5th element in yy
yy[5]

# consider contiguous elements: the 5th, 6th, 7th, 8th, 9th, and 10th elements in yy
yy[5:10]

# consider non-contiguous elements: the 5th, 10th, 15th, and 20th elements in yy
yy[c(5, 10, 15, 20)]




# consider a random purmutation of all elements in yy
sample(yy)

# consider 20 random elements from yy without replacement
sample(yy, 20)

# consider 20 random elements from yy with replacement
# note: just because R _can_ choose elements multiple times doesn't mean it _will_
sample(yy, 20, replace=TRUE)

# consider 10 random elements from the letters collection with replacement
sample(letters, 10, replace=TRUE)




# Matrices of values
matrix(seq(1, 10), nrow=2)
?matrix
matrix(seq(1, 10), nrow=2) / 2


XX = matrix(seq(1, 10), nrow=2, byrow=TRUE)  # 'byrow' flag set to true populates rows in the matrix before cols
XX
XX = matrix(seq(1, 10), ncol=2) # can specify the no. of cols for the matrix, instead of no. of rows
XX
XX = matrix(seq(1, 10), nrow=2) # 'byrow' not specified here, set to FALSE by default
XX
XX / 2        # computes but does not store, the value(s)
XX
XX = XX / 2  # computes the value(s) and stores the result back in XX

t(XX) %*% XX  # X'X ... matrix multiplication of X-transpose and X

# adding names to rows and columns of a matrix
dimnames(XX) = list(c("A", "B"),                    # row names
                    c("V", "W", "X", "Y", "Z"))  # col names
XX

colnames(XX) # print out the column names
rownames(XX) # print the row names

rownames(XX) <- c("r1", "r2")                   # rename rows
colnames(XX) <- c("c1", "c2", "c3", "c4", "c5") # rename columns

AB = matrix(c(11, 12), nrow=2) # new matrix with 1 col and 2 rows
AB

# 'cbind' can be used to combine multiple matrices by column
D = cbind(XX, AB) 
rownames(D) <- c("r1", "r2")                         # rename rows in D
colnames(D) <- c("c1", "c2", "c3", "c4", "c5", "c6") # remane columns in D
D

# Selecting parts of a matrix
# We can consider the whole matrix
XX

# ... or just a single row by leaving the column index empty
XX[1, ]

# ... or a single column by leaving the row index empty
XX[, 2]

# ... or a contiguous range of columns by leaving the row index empty and specifying a sequence
XX[, 2:3]

# ... or using an alternative notation for specifying a sequence
XX[, c(2, 3)]

# ... or a non-contiguous range of columns by leaving the row index empty and specifying a sequence
XX[, c(4, 2, 3)]

# ... or a single cell
XX[1, 2]    # the cell at row 1, column 2
XX["r1", "c2"] # can also use row and col names to select a cell or parts of a matri




# Organizing analyses
# 1. Create a directory for each new analysis project
#    so that you can save the history, workspace, etc. 
#    separately for each project.
#
#    ~ means "the current user's home directory"

dir.create("~/research/example", recursive=TRUE)

# 2. Set the current working directory to that directory
# In R-Studio, you can do this either using the menus
#        Tools > Set working directory...
#
# ... or using standard R commands
setwd("~/research/example")

# 3. Save the history of your analysis regularly and annotate it
savehistory("20110617-Tutorial.Rhistory")


# 4. Import raw data into R, then do any data cleaning within R
#    so that data transformations (log, male/female, corrections, etc)
#    are documented as part of your analysis.
# 
#    Some common R filename conventions: 
#       rawdata.xls
#       rawdata.csv
#       20110617-cleaned-gender.RData
#       20110618-imputed-missingvalues.RData
#       analysis.R
#
#    In your Excel/comma separated values data file, be sure that
#       every column has a header
#       every header begins with a letter
#       no header contains punctuation marks
#    It's probably also best to avoid spaces in header names (R will convert them to periods)
#    and to stick to lower case letters.
#       e.g.:   First Name     would become     First.Name     in R
#    which is a bit cumbersome to type... easier probably to name such columns
#       firstname




# ** TUTORIAL NOTE **
# At this point, you should copy the rawdata.xls and rawdata.csv files
# to your home directory, into the research folder, into the
# example folder.
#
# That way, your data, saved workspaces, saved history, save R scripts,
# etc. are all stored together.


# Reading data from a file
# In R-Studio, you can do this either using the menus
#        Workspace > Import Dataset > From Text File...
#
# ... or using standard R commands
rawdata = read.csv("rawdata.csv", header=TRUE)

# Inspect the first few rows of data as a sanity check
head(rawdata)

# We should see...
#       id  pre post gender
# 1   Aaron   5    6      m
# 2   Betty  31   56      f
# 3  Calvin  30   43      m
# 4   Daisy  46   95      f
# 5  Eileen   3   21      f
# 6 Forrest  35   66      m

# Check that columns (parameters) have been read/named correctly
str(rawdata)

# We should see...
# 'data.frame':  21 obs. of  4 variables:
#  $ id     : Factor w/ 21 levels "Aaron","Betty",..: 1 2 3 4 5 6 7 8 9 10 ...
#  $ pre   : int  5 31 30 46 3 35 20 7 11 47 ...
#  $ post  : int  6 56 43 95 21 66 51 30 46 59 ...
#  $ gender: Factor w/ 2 levels "f","m": 2 1 2 1 1 2 2 1 2 2 ...

# Note that the student names have been read-in as a parameter, X,
# and converted to a categorical factor with 21 levels.

# We can consider just the first column (student names)
head(rawdata[, 1])

# We really want to use those as row names, not as a parameter
rownames(rawdata) = rawdata[, 1]
head(rawdata)

# We should see...
#                 id  pre post gender
# Aaron         Aaron   5    6      m
# Betty         Betty  31   56      f
# Calvin       Calvin  30   43      m
# Daisy         Daisy  46   95      f
# Eileen       Eileen   3   21      f
# Forrest     Forrest  35   66      m




# There are several ways to select columns from a matrix...
# Select all columns from the matrix
head(rawdata)

# Select contiguous columns
head(rawdata[, 1:2])

# Select possibly non-contiguous columns
head(rawdata[, c(1, 4)])

# Change the order of the columns selected
head(rawdata[, c(3, 2)])

# Exclude a column
head(rawdata[, -1])





# Remove the student names parameter column (column #1)
rawdata = rawdata[, -1]
head(rawdata)

# We should see...
#           pre post gender
# Aaron       5    6      m
# Betty      31   56      f
# Calvin     30   43      m
# Daisy      46   95      f
# Eileen      3   21      f
# Forrest    35   66      m





#Generate descriptive statistics
summary(rawdata)

# You'll get a warning ("NAs introduced by coercion") for any 
# remaining factors (categorical parameters)
sd(rawdata)

# Generate an initial exploratory scatter plot
pairs(rawdata)

# Let's find out what the coding is for this factor
levels(rawdata$gender)

# We should se...
# [1] "f" "m"
#
# indicating that F == 1 and M == 2




# Let's add a couple of functions to our workspace to be able to
# plot nicer pairs scatter plots.
#
# It's not critical that you understand how these functions
# work at the moment, just that they create (1) text showing
# the r value for each comparison and (2) a histogram for
# each parameter.
panel.cor = function(x, y, digits=2, prefix="r=", cex.cor)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  r <- abs(cor(x, y))
  txt <- format(c(r, 0.123456789), digits=digits)[1]
  txt <- paste(prefix, txt, sep="")
  if(missing(cex.cor)) cex <- 0.6/strwidth(txt)
  text(0.5, 0.5, txt, cex = cex)
}

panel.hist = function(x, ...)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(usr[1:2], 0, 1.5) )
  h <- hist(x, plot = FALSE)
  breaks <- h$breaks; nB <- length(breaks)
  y <- h$counts; y <- y/max(y)
  rect(breaks[-nB], 0, breaks[-1], y, col="gray", ...)
}
  
# Note that panel.smooth is built in, so we don't need to define it.
pairs(rawdata, lower.panel = panel.cor, diag.panel = panel.hist, upper.panel = panel.smooth)





# Save the plot to a PDF in the working directory
# In R-Studio, you can do this either using the menus
#        Plots > Save plot as PDF...
#
# ... or using standard R commands
pdf("pairsplot.pdf")
pairs(rawdata, lower.panel = panel.cor, diag.panel = panel.hist, upper.panel = panel.smooth)
dev.off()

  
# Save the plot as a JPEG, too, for use on a webpage
# In R-Studio, you can do this either using the menus
#        Plots > Save plot as image...
#
# ... or using standard R commands
jpeg("pairsplot.jpg")
pairs(rawdata, lower.panel = panel.cor, diag.panel = panel.hist, upper.panel = panel.smooth)
dev.off()





# 5. Install any packages you need for more advanced/specialized analyses
#    Be sure to install anything the package depends upon, too
#    In R-Studio, you can do this either using the menus
#        Tools > Install packages...
#
#    ... or using standard R commands
install.packages("granova", dependencies = TRUE)

# 6. Include any "library(...)" commands in your history, if you've
#    used any additional packages, so that you can clearly see which
#    packages you've relied upon.
library(granova)

#    You can find out how to use the package with R's help commands
?granova

#    Since my data represents a dependent sample, I'll focus on that
#    Examples are found by looking at the help for a given function
?granova.ds

#    and scrolling to the bottom of that help page.

# granova.ds needs a data paramater that's just our two dependent scores
#    e.g., pre & post scores on an exam, in a course, etc.
head(rawdata)
head(rawdata[, 1:2])

granova.ds(rawdata[, 1:2])

# preferably with the POST scores as column 1 and the PRE column 2
# so that any treatment effect appears as a positive shift to the south-east
granova.ds(rawdata[, 1:2], revc = TRUE)

# I could also have achieved the same result using
granova.ds(rawdata[, c(2, 1)])




# Save our workspace with all the data objects we've created so 
# we can continue working with it later
# In R-Studio, you can do this either using the menus
#        Workspace > Save Workspace as...
#
# ... or using standard R commands
save.image("20110617-Workspace.RData")

# Save our history, in case we want to repeat this analysis
savehistory("20110617-FirstGlance.Rhistory")

#end our R session
quit()







