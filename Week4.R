
##DATAFRAME and MATRICES
#create we create easy matrices
x <- 1:3
y <- 6:2
z <- 11:14

#create matrix with x,y,z columns c will represent building columns

cbind(x, y, z)

#create matrix with x,y,z rows and rbing will show for rows

rbind(x, y, z)

#creating matrixes converting number to characters

cbind(c(1, 2, 3, 4, 5),
      c("A", "B", "C", "D", "D"))

# Create a matrix of the integers 1-8 with 10 rows and 3 columns

matrix(data = 1:8,
       nrow = 10,
       ncol = 3)

# HEre we are creating with with 2 rows and 5 columns with integers 1-10
matrix(data = 1:10,
       nrow = 2,
       ncol = 5)

# checking with 10 rows and 4 columns,fill by row instead of columns by givinng byrow as TRUE
matrix(data = 1:15,
       nrow = 10,
       ncol = 4,
       byrow = TRUE)

#To create a dataframe from vectors, weuse the data.frame() function. The data.frame() function is similar to 
#cbind() – but with different that we specify names to each of the columns as you define them.
#create dataframe called mysurvey data
mysurvey <- data.frame("index" = c(1, 2, 3, 4, 5),
                       "sex" = c("m", "m", "none", "f", "f"),
                       "age" = c(30,25,26,29,15))

#viewing the dataframe structure
str(mysurvey)

# Here R has converted the column sex to a factor with only two possible levels and there could arrise problems
#make sure that this doesn’t happen we use Stringasfactors to solve this:
mysurvey <- data.frame("index" = c(1, 2, 3, 4, 5),
                       "sex" = c("m", "m", "none", "f", "f"),
                       "age" = c(50,40,55,34,44),
                       stringsAsFactors = FALSE)
#print output- this looks same as before
mysurvey

#BUt when we see the structure, we see that there are no factors
str(mysurvey)


#The head() that shows only head of the few rows 
head(ChickWeight)

# The tail() that shows  the last few rows
tail(ChickWeight)

# This will help us see the whole data frame
View(ChickWeight)

# To get summary statistics on all columns in a dataframe, we can use the summary() function.
summary(ToothGrowth)

# To learn about the classes of columns in a dataframe,we use the str() (structure) function. 
str(ToothGrowth)


# To access the names of a dataframe, we use the function names(). This will return a string vector
#with the names of the dataframe.
names(ToothGrowth)

# Print the length column ToothGrowth- We use the $ operator to get a vector of just the
#length column (called len) from the ToothGrowth dataframe:
ToothGrowth$len

# What is the mean of the len column of ToothGrowth?
mean(ToothGrowth$len)

# Give me a table of the supp column of ToothGrowth.
table(ToothGrowth$supp)

#Give me the len AND supp columns of ToothGrowth
#Print length AND supplement columns of ToothGrowth. Here we can use head with len and supp.
head(ToothGrowth[c("len", "supp")])

#adding new columns-here we create a dataframe called mysurvey with two columns: index and age
mysurvey <- data.frame("index" = c(1, 2, 43, 4, 5),
                       "age" = c(31,23,65,18,25))
#print new columns
mysurvey

# adding new column sex to matrix- 
mysurvey$sex <- c("m", "m", "none", "f", "m")
#print new column
mysurvey

names
# trying to change 1st column the name of dataframe To change the name of a column in a dataframe,
#just use a combination of the names() function, indexing, and reassignment.
names(mysurvey)[1] <- "participant.number"

#print output
mysurvey

# trying to change 3rd  column the name of dataframe
names(mysurvey)[2] <- "Hello"

#Let’s use logical indexing to change the name of the column mysurvey$age to mysurvey$years
#trying to Change the column name from age to age.year
names(mysurvey)[names(mysurvey) == "age"] <- "year"

#Code to slice the dataframes
#Slicing with [, ]
#Just like vectors, we can access specific data in dataframes using brackets.
#Here instead of just using one indexing vector, we use two indexing vectors:one for the rows & another for
#the columns. To achieve this, we use data[rows, columns], where rows and columns are vectors of integers.
ToothGrowth[1:4, c(1,3)]

# Code to extract the 1st row (and all columns) of ToothGrowth
ToothGrowth[1, ]


# Here we learn about Calculate the mean of the length column new subset

mean(oj$len)

#using same calculations with logical indexing 
oj <- ToothGrowth[ToothGrowth$supp == "OJ",]

#Learning about  mean() to get mean length of subset data
mean(oj$len)

#FInding out the mean can also be done in one line by referring to column vectors 
mean(ToothGrowth$len[ToothGrowth$supp == "OJ"])


#The with() function helps us save you some typing when using multiple columns from a dataframe
# Let us first create a dataframe Health
health <- data.frame("age" = c(32, 24, 43, 19, 43),
                     "height" = c(1.75, 1.65, 1.50, 1.92, 1.80),
                     "weight" = c(70, 65, 62, 79, 85))

# Let us add a new column for BMI Formula to Calculating bmi
health$weight / health$height ^ 2

#TO save time using the with() function,
#we can make it a bit easier by saying the name of the dataframe once.
with(health, height / weight ^ 2)

#################################

library("tidyverse")

## Vector basics
#typeof lets us know the characteristic of the vectorsee examples below:
typeof(letters) # is a character
typeof(1:10) # is an integer
x <- list("a", "b", 1:10)
length(x) # we Find out the length is 3

#Logical vectors are the simplest type of atomic vector as there are only three possible values:
#FALSE, TRUE, and NA. Logical vectors are usually constructed with comparison operators,we can create them with c():
1:10 %% 3 == 0
c(TRUE, TRUE, FALSE, NA)

#Integer and double vectors are known collectively as numeric vectors.
#In R, numbers are double by default. We have to place and L to make them an integer.
typeof(1)
typeof(1L) # not is an integer

x <- sqrt(2) ^ 2
x
x-2

#Integers have one special value: NA and doubles have four: NA, NaN, Inf and -Inf.
#All three special values NaN, Inf and -Inf can arise during division:

c(-1, 0, 1) / 0
#Each type of atomic vector has its own missing value
NA            # This is logical
NA_integer_   #This is integer
NA_real_      # This is double
NA_character_ #Character

## Important types of atomic vector {#important-types-of-atomic-vector .r4ds-section}

### Exercise 20.3.1 {.unnumbered .exercise data-number="20.3.1"}

#Describe the difference between `is.finite(x)` and `!is.infinite(x)`?

#To find out, try the functions on a numeric vector that includes at least one number and the four special values (`NA`, `NaN`, `Inf`, `-Inf`).
x <- c(0, NA, NaN, Inf, -Inf)
is.finite(x)
!is.infinite(x)

#The `is.finite()` function considers non-missing numeric values to be finite,
#and missing (`NA`), not a number (`NaN`), and positive (`Inf`) and negative infinity (`-Inf`) to not be finite
#The `is.infinite()` behaves slightly differently as considers `Inf` and `-Inf` to be infinite,
#and everything else, including non-missing numbers, `NA`, and `NaN` to not be infinite.


#Coercion

Coercion
#There are two ways to convert, or coerce, one type of vector to another:

#Explicit coercion happens when you call a function like as.logical(), as.integer(), as.double(), or as.character().

#Implicit coercion happens when we use a vector in a specific context that expects a certain type of vector.

x <- sample(20, 100, replace = TRUE)
y <- x > 10
sum(y)  # how many are greater than 10?
mean(y)           



#What functions from the readr package allow you to turn a string into logical, integer, and double vector?

#The function `parse_logical()` parses logical values, which can appear as variations of TRUE/FALSE or 1/0.
parse_logical(c("TRUE", "FALSE", "1", "0", "true", "t", "NA"))

#The function `parse_integer()` parses integer values.
parse_integer(c("1235", "0134", "NA"))

#However, if there are any non-numeric characters in the string, including
#currency symbols, commas, and decimals, `parse_integer()` will raise an error.
parse_integer(c("1000", "$1,000", "10.00"))

#The function `parse_number()` parses integer values.
parse_number(c("1.0", "3.5", "$1,000.00", "NA"))

#Received error: Error in parse_number(c("1.0", "3.5", "$1,000.00", "NA")) : 
#could not find function "parse_number"



## Using atomic vectors

### Exercise 20.4.6.1

#What does `mean(is.na(x))` tell you about a vector `x`? What about `sum(!is.finite(x))`?

#I will use the numeric vector `x` to compare the behaviors of `is.na()` and `is.finite()`.
#It contains numbers (`-1`, `0`, `1`) as  well as all the special numeric values: infinity (`Inf`),  missing (`NA`), and not-a-number (`NaN`). 

x <- c(-Inf, -1, 0, 1, Inf, NA, NaN)

#mean(is.na(x))` calculates the proportion of missing values (values equal to `NA`) in a vector.
mean(is.na(x))

#The expression `sum(!is.finite(x))` calculates the number of elements in the vector that are equal to missing (`NA`), not-a-number (`NaN`), or infinity (`Inf`). 

sum(!is.finite(x))


### Exercise 20.4.6.2


#Carefully read the documentation of `is.vector()`. What does it actually test for? Why does `is.atomic()` not agree with the definition of atomic vectors above?


#The function `is.vector()` only checks whether the object has no attributes other than names. 
#making a `list` as a vector
is.vector(list(a = 1, b = 2))
#But any object that has an attribute (other than names) is not:
x <- 1:10
attr(x, "blahblah") <- FALSE
is.vector(x)

#The idea behind this is that object oriented classes will include attributes,
#including, but not limited to `"class"`.

#The function `is.atomic()` explicitly checks whether an object is one of the atomic types
#("logical", "integer", "numeric", "complex", "character", and "raw") or NULL.

is.atomic(1:10) #FALSE
is.atomic(list(a = 1)) #FALSE

#The function `is.atomic()` will consider objects to be atomic even if they have extra attributes.
is.atomic(x) #TRUE


### Exercise 20.4.6.3

#Compare and contrast `setNames()` with `purrr::set_names()`.

#The function `setNames()` takes two arguments, a vector to be named and a vector of names and applies to its elements.
setNames(1:4, c("a", "b", "c", "d"))
#We can use the values of the vector as its names if the `nm` argument is used.
setNames(nm = c("Dhanisha", "Lachake", "Varun", "Gala"))

#The function `set_names()` has more ways to set the names than `setNames()`.
#The names can be specified in the same manner as `setNames()`.

purrr::set_names(1:4, c("Dhanisha", "Lachake", "Varun", "Gala"))
#The names can also be specified as unnamed arguments,
purrr::set_names(1:4, "Dhanisha", "Lachake", "Varun", "Gala")

#The function `set_names()` will name an object with itself if no `nm` argument is
#provided (the opposite of `setNames()` behavior).
purrr::set_names(c("a", "b", "c", "d"))


#The `set_names()` function also checks that the length of the names argument is the same length as the vector that is being named, and will raise an error if it is not.
purrr::set_names(1:4, c("a", "b"))
#The `setNames()` function will allow the names to be shorter than the vector being
#named, and will set the missing names to `NA`.
setNames(1:4, c("a", "b"))



### Exercise 20.4.6.5

#Why is `x[-which(x > 0)]` not the same as `x[x <= 0]`?

#These expressions differ in the way that they treat missing values.
#These values should include all relevant types of values that these expressions would come accross
x <- c(-1:1, Inf, -Inf, NaN, NA)
x[-which(x > 0)]
x[x <= 0]
#The expressions  `x[-which(x > 0)]` and `x[x <= 0]` return the same values except for a `NaN` instead of a `NA` in the `which()` based expression.

#So what is going on here? Let's work through each part of these expressions and see where the different occurs.
#Let's start with the expression `x[x <= 0]`.
x <= 0
#As we remember the logical relational operators (`<`, `<=`, `==`, `!=`, `>`, `>=`) treat `NA` values. Any relational operation that includes a `NA` returns an `NA`. 
#Is `NA <= 0`? We don't know because it depends on the unknown value of `NA`, so the answer is `NA`.


#Indexing can use a logical vector, and will include those elements where the logical vector is `TRUE`,
#This will  will not  return those elements where the logical vector is `FALSE`.

#Since a logical vector can include `NA` values, what should it do for them?
#since the value is `NA` it could be `TRUE` or `FALSE`, we dont know what will it return


### Exercise 20.4.6.6

#What happens when
#you subset with a positive integer that’s bigger than the length of the vector? What happens when you subset with a name that doesn’t exist?

s <- c(a = 10, b = 20)
#If we subset it by an integer larger than its length, it returns a vector of missing values.
s[3]
#This also applies to ranges.
s[3:5]
#If some indexes are larger than the length of the vector, those elements are `NA`.
s[1:5]


## Recursive vectors (lists) {#lists .r4ds-section}

### Exercise 20.5.4.1


#Draw the following lists as nested sets:

#1.  `list(a, b, list(c, d), list(e, f))`
#2.  `list(list(list(list(list(list(a))))))`


#There are a numerrous  ways to draw these graphs and I can use different diagramming, drawing, or presentation software, including Adobe Illustrator,PowerPoint, and Google Slides.



### Exercise 20.5.4.2


#What happens if you subset a `tibble` as if you’re subsetting a list? What are the key differences between a list and a `tibble`?


#If we subset a `tibble` it would work the same way as a list; a data frame can be thought of as a list of columns.
#The major difference between a list and a `tibble` is that all the elements (columns) of a tibble must have the same length (number of rows).
#where as Lists can have vectors with different lengths as elements.
x <- tibble(a = 1:2, b = 3:4)
x[["a"]]
x["a"]
x[1]
x[1, ] #Received an error Error in x[1, ] : incorrect number of dimensions

#Exercise 20.7.4,1


#What does `hms::hms(3600)` return? How does it print? What primitive type is the augmented vector built on top of? What attributes does it use?

d <- hms::hms(720) #Received an error here and had to install package hms
class(d)
d

#`hms::hms` returns an object of class, and prints the time in "%H:%M:%S" format.


typeof(x) #The primitive type is a double

#All functions with tibbles enforce constraint

df<- data.frame(X=1:5, y = 5:1)
typeof(df)
attributes(df)


typeof(x) #DOuble

#The attributes is uses are `"units"` and `"class"`.
attributes(x)


#Exercise 20.7.2.4

#Try and make a tibble that has columns with different lengths. What happens?
#If I try to create using scalar at tibble with different length there are no issues, and the scalar is repeated to the length of the longer vector.

tibble(x = 1, y = 1:5) # Error Error in tibble(x = 1, y = 1:5) : could not find function "tibble"
#However, if I try to create a tibble with two vectors of different lengths (other than one), the `tibble` function throws an error.



