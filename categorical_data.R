Working with categorical data-

# 1a. ----
# >> Build a factor vector named "Department" by sampling 10 elements from the 
# words "OP", "ED", and "ICU" and set the levels in reverse alphabetical order.

dept_vec <- sample(c("OP", "ED", "ICU"), 10, TRUE)
Department <- factor(dept_vec, 
             levels= c("OP", "ICU", "ED"))
Department

# 1b. ----
# >> Print the number of cases in each level:
summary(Department)
table(Department)
str(Department)

# 1c. ----
# >> Rename the levels of the above factor such that "ICU" becomes 
# "Intensive Care", "OP" becomes "Outpatient", and "ED" becomes "Emergency":
levels(Department) <- c("Outpatient", "Intensive Care", "Emergency")
Department


# 1d. ----
# >> Change the order of the factor levels to "Outpatient", "Emergency", 
# "Intensive Care" and set as an ordered factor:
Department <- factor(Department,
                     levels = c("Outpatient", "Emergency", "Intensive Care"),
                     ordered = TRUE)
Department
Department <- ordered(Department,
                      levels= c("Outpatient", "Emergency", "Intensive Care"))
Department


# 2a. ----
# >> Read the CSV from the following address into an object named 'hf0'
# directly from the UCI web server:
# https://archive.ics.uci.edu/ml/machine-learning-databases/00519/heart_failure_clinical_records_dataset.csv

hf0 <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/00519/heart_failure_clinical_records_dataset.csv")
hf0

# 2b. ----
# >> Make a copy of 'hf0' named 'hf1'. Leave 'hf0' as is and use 'hf1' for 
# questions 2c through 2f
hf1 <- data.frame(hf0)
hf1
hf1 <- hf0
hf1

# 2c. ----
# >> Convert "anaemia" to a factor with levels "Not_Anaemic" and "Anaemic"
# & check that it worked:
hf1$anaemia <- factor(hf1$anaemia, 
                     levels= c(0, 1))
hf1$anaemia
levels(hf1$anaemia) <- c("Not_Anaemic", "Anaemic")
hf1$anaemia


# 2d. ----
# >> Convert "creatinine_phosphokinase" to double precision / numeric:

hf1$creatinine_phosphokinase <- as.double(hf1$creatinine_phosphokinase)


# >> Check its type:
typeof(hf1$creatinine_phosphokinase)


# 2e. ----
# >> Convert "diabetes" to a factor with levels "Not_Diabetic", "Diabetic"
hf1$diabetes <- factor(hf1$diabetes,
                       levels = c(0, 1))
hf1$diabetes
levels(hf1$diabetes) <- c("Not_Diabetic", "Diabetic")
hf1$diabetes

# 2f. ----
# >> Convert "serum_sodium" to double precision / numeric:
hf1$serum_sodium <- as.double(hf1$serum_sodium)

# >> Check its type:
typeof(hf1$serum_sodium)
class(hf1$serum_sodium)


# 3. ----
# >> Read the same CSV as above into a new object named 'hf2', but this time
# specify all the type conversions you performed above from within the 
# 'read.csv()' call.
hf2 <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/00519/heart_failure_clinical_records_dataset.csv", 
                colClasses=c(anaemia="factor", creatinine_phosphokinase="double", diabetes="factor", serum_sodium="double"))


# Then, perform any further operations that cannot be performed within 
# 'read.csv()', so that 'hf2' is identical to 'hf1' and check that it is.
hf2$anaemia <- factor(hf2$anaemia, 
                      levels= c(0, 1))
levels(hf2$anaemia) <- c("Not_Anaemic", "Anaemic")
hf2$anaemia 
hf2$diabetes <- factor(hf2$diabetes,
                       levels = c(0, 1))
levels(hf2$diabetes) <- c("Not_Diabetic", "Diabetic")
hf2$diabetes
str(hf2)

# 4. ----
# >> Save the 'hf2' data.frame to an RDS (.rds) file to any path on your system
saveRDS(hf2, "hf2.rds")
getwd()
## I saved in current working directory


# 5. ----
# >> Read the 'hf2' data.frame from the .rds file you saved above into a new 
# object named 'heart_failure'
'heart_failure' <- readRDS("hf2.rds")


# 6. ----
# >> Save the 'hf0' and 'hf2' data.frames to an .RData file to any path on your 
# system
hf0 <- as.data.frame(hf0)
hf2 <- as.data.frame(hf2)

save(hf0, hf2, file = "./hf.RData")
y <- load("hf.RData")
y

# 7. ----
# >> Save both the 'hf0' and 'hf2' data.frames to a single RDS (.rds) file
# (by enclosing them in some other object; again, to any path on your system)
l <- list(hf0= hf0, hf2= hf2)
saveRDS(l, "hf0_2.rds")
hf0_2 <- readRDS("hf0_2.rds")
hf0_2

# 8. ----
# >> Create a numeric vector of length 100 named "Age" by sampling from a normal
# distribution with a mean of 52 and a standard deviation of 1.3
Age <- rnorm(100, 52, 1.3)
is.numeric(Age)
is.vector(Age)
Age

# >> Create an *ordered* factor named "Group" of length 100 by sampling the
# words "Placebo", "Half_Dose", and "Full_Dose" with levels in that order
# and labels "Vehicle", "Half", "Full"
gp_factor <- sample(c("Placebo", "Half_Dose", "Full_Dose"), 100, TRUE)
gp_factor

Group <- factor(gp_factor,
                levels = c("Placebo", "Half_Dose", "Full_Dose"), 
                labels = c("Vehicle", "Half", "Full"), ordered = TRUE)
Group


# 9. ----
# >> Save "Age" and "Group" objects created above as an .RData file
Age <- as.data.frame(Age)
Group <- as.data.frame(Group)

save(Age, Group, file = "./AG.RData")
