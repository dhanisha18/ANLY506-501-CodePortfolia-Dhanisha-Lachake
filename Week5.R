#This is used to help tidy up messy data
library(tidyverse)

#This shows different tables that have different way of representing the same dataset

# The below table shows the dATA 6 * 4
table1
#The below table shows the data 12 * 4
table2

#The table shows the data 6 * 3
table3

#The table shows the data 3 * 3
table4a

# Compute rate for table1 which means cases/population per 11,000
table1 %>% 
  mutate(rate = cases / population * 11000)

# This will give calculation of cases per year
table1 %>% 
  count(year, wt = cases)

#Visualise the changes over 25 years starting 1999 to 2000 for Afghanistan, Brazil and CHina
library(ggplot2)
ggplot(table1, aes(year, cases)) + 
  geom_line(aes(group = country), colour = "pink") + 
  geom_point(aes(colour = country))

Using prose, describe how the variables and observations are organised in each of the sample tables.

#Compute the rate for table2, and table4a + table4b. You will need to perform four operations:
  
#Extract the number of TB cases per country per year.
#Extract the matching population per country per year.
#Divide cases by population, and multiply by 10000.
#Store back in the appropriate place.
#Which representation is easiest to work with? Which is hardest? Why?
  
# The first step would be to create separate tables for cases and population to
#make sure they are sorted in the same order.
table2_cases <- filter(table2, type == "cases") %>%
  rename(cases = count) %>%
  arrange(country, year)
table2_population <- filter(table2, type == "population") %>%
  rename(population = count) %>%
  arrange(country, year)


# Next step is to create a new data frame with the population and cases in columns then
#calculate the cases per capita in a new column
table2_cases_per_capita <- tibble(
  year = table2_cases$year,
  country = table2_cases$country,
  cases = table2_cases$cases,
  population = table2_population$population
) %>%
  mutate(cases_per_capita = (cases / population) * 10000) %>%
  select(country, year, cases_per_capita)


#Next step here is append the new variable in the correct location, we will now add new rows to `table2'
table2_cases_per_capita <- table2_cases_per_capita %>%
  mutate(type = "cases_per_capita") %>%
  rename(count = cases_per_capita)

#Now we are adding the rows to table 2
bind_rows(table2, table2_cases_per_capita) %>%
  arrange(country, year, type, count)

# Let us do the same above for Table4a and Table4b:
#For `table4a` and `table4b`, we will now create a new table for cases per capita, which we'll name `table4ab`, with country rows and year 1999 and 2000 columns.
table4ab <-
tibble(
country = table4a$country,
`1999` = table4a[["1999"]] / table4b[["1999"]] * 10000,
`2000` = table4a[["2000"]] / table4b[["2000"]] * 10000)
table4ab

#Neither table is easier than other by very much easy to work with but since `table2`
#has separate rows for cases and population we had to create a table with columns for
#cases and population where we could calculate cases per capita.

#For table4a` and `table4b` we split the cases and population variables into different tables then it was
#easy to divide cases by population. However, we had to repeat this calculation for each row.
#The ideal format of a data frame to answer this question is one with columns `country`, `year`, `cases`, and `population`#
#Thus 4a + 4b could be easier.


#We firt need to filter `table` to only include rows representing cases of TB and then show the changes over time from 1999 to 2000

table2 %>%
  filter(type == "cases") %>%
  ggplot(aes(year, count)) +
  geom_line(aes(group = country), colour = "pink") +
  geom_point(aes(colour = country)) +
  scale_x_continuous(breaks = unique(table2$year)) +
  ylab("cases")


#Spreading and gathering
tidy4a <- table4a %>%
  gather(`1999`, `2000`, key = "year", value = "cases")
tidy4b <- table4b %>%
  gather(`1999`, `2000`, key = "year", value = "cases")

#Why are `gather()` and `spread()` not perfectly symmetrical?
#Carefully consider the following example:
  
stocks <- tibble(
  year = c(2015, 2015, 2016, 2016),
  half = c(1, 2, 1, 2),
  return = c(1.88, 0.59, 0.92, 0.17)
)
stocks %>%
  spread(year, return) %>%
  gather(`2015`:`2016`, key = "year", value = "return")

#The functions `spread()` and `gather()` are not perfectly symmetrical because we lose the column type info.
#With `gather()`, it discards the original column types as it has to coerce all the gathered variables into a single type vector
# When we use `spread()` it does not know the original data types of the variables.



#What do the extra and fill arguments do in `separate()`? Let us Experiment with the various options for the following two toy datasets.
#Here the separate drops the NA and provides a warning

tibble(x = c("a,b,c", "d,e,f,g", "h,i,j")) %>%
  separate(x, c("one", "two", "three"))
tibble(x = c("a,b,c", "d,e", "f,g,i")) %>%
  separate(x, c("one", "two", "three"))

#Both unite() and separate() have a remove argument. What does it do?
#The `remove` argument discards input columns in the result data frame
#ANSWER:If I set it to`FALSE`, I would want to create a new variable and keep the old one.


#Compare and contrast separate() and extract(). Why are there three variations of separation
#(by position, by separator, and with groups), but only one unite?
#ANS:
#The function `separate()`, splits a column into multiple columns by separator, if the `sep` argument is a character vector, or by character positions, if `sep` is numeric.
# example with separators
tibble(x = c("X_1", "X_2", "AA_1", "AA_2")) %>%
  separate(x, c("variable", "into"), sep = "_")
# example with position
tibble(x = c("X1", "X2", "Y1", "Y2")) %>%
  separate(x, c("variable", "into"), sep = c(1))

#The function `extract()` uses a regular expression to specify groups in character vector and split that single character vector into multiple columns.
#This is more flexible than `separate()` because it does not require a common
#separator or specific column positions.

# example with separators
tibble(x = c("X_1", "X_2", "AA_1", "AA_2")) %>%
  extract(x, c("variable", "id"), regex = "([A-Z])_([0-9])")
# example with position
tibble(x = c("X1", "X2", "Y1", "Y2")) %>%
  extract(x, c("variable", "id"), regex = "([A-Z])([0-9])")
# example that separate was not able to  parse
tibble(x = c("X1", "X20", "AA11", "AA2")) %>%
  extract(x, c("variable", "id"), regex = "([A-Z]+)([0-9]+)")

#Both `separate()` and `extract()` convert a single column to many columns.
#However, `unite()` converts many columns to one, with a choice of a separator.

tibble(variable = c("X", "X", "Y", "Y"), id = c(1, 2, 1, 2)) %>%
  unite(x, variable, id, sep = "_")

#thus we can conclude that with `extract()` and `separate() we can only chose one column,
#but there are different ways of splitting that single column.
#With `unite()`, there are many choices as to which columns to separate, but only one 
#option to combine their contents into a single vector.

#12.6 Case Study:
#The data comes from the 2014 World Health Organization Global Tuberculosis Report,
#available at http://www.who.int/tb/country/data/download/en/. 

#na_rm will help us keep only the values that are present versus all the values
whodata <- who %>% gather(new_sp_m014:newrel_f65, key = "key", value = "cases", na.rm = TRUE)
whodata # with 76,036 more rows not shown

#We need to make small fixes to the format of the column names: as the names are slightly inconsistent because instead of new_rel we have newrel (it’s hard to spot this here but if you don’t fix it we’ll get errors in subsequent steps). You’ll learn about str_replace() in strings, but the basic idea is pretty simple:
#replace the characters “newrel” with “new_rel" and it will make all variable names standardized.
whodata2 <- whodata %>% 
  mutate(key = stringr::str_replace(key, "newrel", "new_rel"))
whodata2

#separate function can be used in each passes:
whodata3 <- whodata2 %>% 
  separate(key, c("new", "type", "sexage"), sep = "_")
whodata3

#Helps add sturcture to the value when we count it:
whodata %>% 
  count(key)

#We have now tidied the data
who %>%
  gather(key, value, new_sp_m014:newrel_f65, na.rm = TRUE) %>% 
  mutate(key = stringr::str_replace(key, "newrel", "new_rel")) %>%
  separate(key, c("new", "var", "sexage")) %>% 
  select(-new, -iso2, -iso3) %>% 
  separate(sexage, c("sex", "age"), sep = 1)



