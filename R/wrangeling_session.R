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

#for more info on helpers:
?select_helpers

#Save the selected coloums as a new dataset
nhanes_small <- select(NHANES, Age, Gender, Height, Weight, BMI, Diabetes,
                       DiabetesAge, PhysActiveDays, PhysActive, TotChol,
                       BPSysAve, BPDiaAve, SmokeNow, Poverty)

#view the data framw
nhanes_small

#renaming
#rename all columns to snake case
nhanes_small <- rename_with(nhanes_small,
                            snakecase::to_snake_case)

nhanes_small

#renaming specific coloumns
rename(nhanes_small, sex = gender) #obs not saved
#with saving:
nhanes_small <-rename(nhanes_small, sex = gender)



