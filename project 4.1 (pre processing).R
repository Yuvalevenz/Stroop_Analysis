library(dplyr)
library(ggplot2)
#### Create raw data ----

# Combine files
files_names <- dir("Collected Data") 
df <- data.frame()

for (file in files_names) {
  df <- rbind(df, read.csv(paste0("Collected Data/", file)))  
}

# Add task, congruency & accuracy variables
df <- df |> mutate(task = ifelse(grepl("naming", condition), "ink_naming", "word_reading"), congruency = ifelse(grepl("incong", condition), "incongruent", "congruent"), accuracy = ifelse(correct_response == participant_response, 1, 0))

# remove irrelavant variables
df <- df |> mutate(
  subject = as.factor(subject),
  task = as.factor(task),
  congruency = as.factor(congruency),
  block = as.numeric(block),
  trial = as.numeric(trial),
  accuracy = as.numeric(accuracy),
  rt = as.numeric(rt)) |>
  select(subject, task, congruency, block, trial, accuracy, rt)
View(df)

# check factors
contrasts(df$task) <- c(1,0)
contrasts(df$task)
contrasts(df$congruency)

save(df, file = "Project 4 Raw Data.RData")

#### Create filtered data ----

load("Project4_RawData.rdata")
# Count subjects
cat("Number of unique subjects:", length(unique(df$subject)))

# Filter NA and outliers
sum(is.na(df$rt))
df <- df |> filter(!is.na(rt), rt <= 3000, rt >= 300)

View(df)

# Calculate remaining trials percentage
df |> group_by(subject) |> summarise(percentage = (n() / 400)) |> print(n = Inf) 

# Calculate mean and sd of removed trials percentage
removed_per = 1 - df1$percentage
print(removed_per)
mean(removed_per)
sd(removed_per)

save(df, file = "Project 4 Filtered Data.RData")
