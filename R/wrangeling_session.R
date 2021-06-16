#load up the packages
source(here::here("R/package-loading.R"))

#briefly glimpse at content of dataset
glimpse(NHANES)

#select one column by its name
select(NHANES, Age)

#select more column by its name
select(NHANES, Age, Weight, BMI)

#exclude a column by its name
select(NHANES, HeadCirc)

#all coloumns starting with BP
select(NHANES, starts_with("BP"))

#all coloumns ending with Day
select(NHANES, ends_with("Day"))

#all coloumns containing Age
select(NHANES, contains("AGE"))

