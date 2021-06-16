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

# without the pipe operator
colnames(nhanes_small)

#with pipe Ctrl+Shift+M
nhanes_small %>% colnames()

#using the pipeoperator with more functions
nhanes_small %>%
    select(phys_active) %>%
    rename(physically_active=phys_active)

nhanes_small %>%
    select(tot_chol, bp_sys_ave,  poverty)

nhanes_small %>%
    rename(diabetes_diagnosis_age = diabetes_age)

# rewrite with pipe: select(nhanes_small, bmi, contains("age"))
nhanes_small %>%
    select(bmi, contains("age"))


#rewrite physical_activity <- select(nhanes_small, phys_active_days, phys_active) rename(physical_activity, days_phys_active = phys_active_days)
nhanes_small %>%
    select(phys_active_days, phys_active) %>%
    rename(days_phys_active = phys_active_days)

##filtering
#filter for all females
nhanes_small %>%
    filter(sex == "female")

#Participants who are not female
nhanes_small %>%
    filter(sex != "female")

#Participants who have a BMI of 25
nhanes_small %>%
    filter(bmi == 25)

#Participants who have a BMI greater or equal to 25
nhanes_small %>%
    filter(bmi >= 25)

#Participants who are female and have a BMI greater or equal to 25
nhanes_small %>%
    filter(bmi >= 25 & sex == "female")

#Participants who are female OR BMI greater or equal to 25
nhanes_small %>%
    filter(bmi >= 25 | sex == "female")

# OR: option + I => |


## sort the dataset using the arrange function
# arranging by age in ascending order
nhanes_small %>%
    arrange(age)
# arranging by age in descending order
nhanes_small %>%
    arrange(desc(age))

#arrange alphabetically
nhanes_small %>%
    arrange(sex)

# Arranging data by sex then age in ascending order
nhanes_small %>%
    arrange(sex, age)

##transform or add coloums

#transform heigh values to meters
nhanes_small %>%
    mutate(height = height / 100)

# add a new cloumn with logged height values
nhanes_small %>%
    mutate(logged_height = log(height))

#or do both in the same step:
nhanes_small %>%
    mutate(height = height / 100,
           logged_height = log(height))
#log taken from the changed height in this case


#add a new column that shows if the subject is highly active
nhanes_small %>%
    mutate(highly_active = if_else(phys_active_days >= 5, "Yes", "No"))

nhanes_update <- nhanes_small %>%
    mutate(height = height/100,
           logged_height = log(height),
           highly_active = if_else(phys_active_days >=5, "Yes", "No"))

##summary statistics
nhanes_small %>%
    summarise(max_bmi = max(bmi))
#NA is the missing value

nhanes_small %>%
    summarise(max_bmi = max(bmi, na.rm = TRUE)) #na.rm removes the NA

#calculating 2 summary statistics at a time
nhanes_small %>%
    summarise(max_bmi = max(bmi, na.rm = TRUE), min_bmi = min(bmi, na.rm = TRUE))


#exercise 9.16

# 1.#Calculate the mean of weight and age.
nhanes_small %>%
    summarise(mean_weight = mean(weight, na.rm = TRUE),
              mean_age = mean(age, na.rm = TRUE))

# 2.#Calculate the max and min of height.
nhanes_small %>%
    summarise(max_height = max(height, na.rm = TRUE),
              min_height = min(height, na.rm = TRUE))

# 3.#Calculate the median of age and phys_active_days.
nhanes_small %>%
    summarise(med_age = median(age, na.rm = TRUE),
              med_phys_active_days = median(phys_active_days, na.rm = TRUE))

#Lastly, add and commit any changes made to the Git history with the RStudio Git interface.

# 1.#Calculate statistics from groups.
nhanes_small %>%
    group_by(diabetes) %>%
    summarise(mean_age = mean(age, na.rm = TRUE),
              mean_bmi = mean(bmi, na.rm = TRUE))

#filter out NA
nhanes_small %>%
    # Recall ! means "NOT", so !is.na means "is not missing"
    filter(!is.na(diabetes)) %>%
    group_by(diabetes) %>%
    summarise(mean_age = mean(age, na.rm = TRUE),
              mean_bmi = mean(bmi, na.rm = TRUE)) %>%
    ungroup()


#saving datasets as files

#save data as an .rda file in the data folder
usethis::use_data(nhanes_small, overwrite = TRUE)

BW<- readr::read_csv(here::here("data/BW")

