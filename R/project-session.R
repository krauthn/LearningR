source(here::here("R/package-loading.R"))
#The here package uses a function called here() that makes it easier to manage file paths within an R Project
#will 'source' a specific file

# Basics of R -------------------------------------------------------------
# saves hundred into the new  variable
weight_kilos <- 100
weight_kilos

#functions:
c("a", "b", "c") # character vector
c(TRUE, FALSE)

c(1, 2, 4)

factor(c("high", "medium", "low"))
#factors:used to run models, are numbers underneath that have assigned labels

head(CO2)#will show 6 of the dataset
colnames(CO2) #show coloumn names of dataset
str(CO2) # shows the structure of the dataset
summary(CO2) #shows the stars of the dataset

colnames(CO2)

#PRACTICING STYLE

# Object names
day_one
false <- FALSE
current_value <- 9

# Spacing
x[, 1]
mean(x, na.rm = TRUE)
height <- feet * 12 + inches
df$z
x <- 1:10

# Indenting and brackets
if (y < 0 && debug) {
    message("Y is negative")
    }
# control,shift+A will restyle all code to good code.
# styler package will style a whole file => styler::style_file()
