load("Project 4 Filtered Data.RData")
library(lme4)
library(lmerTest)

#### Statistics ----

model <- lmer(rt ~ task * congruency + (1 + task * congruency | subject), data = df)


summary(model)


